# Mise with Git Worktrees

<!--toc:start-->
- [Mise with Git Worktrees](#mise-with-git-worktrees)
  - [Overview](#overview)
  - [Description](#description)
  - [Setup](#setup)
    - [1. Directory structure](#1-directory-structure)
    - [2. .mise.toml](#2-misetoml)
    - [3. mise/tasks/sync-git-submodules](#3-misetaskssync-git-submodules)
    - [4. mise/tasks/install-git-hooks](#4-misetasksinstall-git-hooks)
    - [5. Install the git hook](#5-install-the-git-hook)
  - [How it works](#how-it-works)
  - [Usage](#usage)
<!--toc:end-->

## Overview

Git worktrees share the same `.git` folder but each worktree has its own working directory.
When you create a new worktree (`wt switch my-branch`), git submodules are not initialized —
their directories exist but are empty. Running `git submodule update --init` on large submodules
is slow. If the files rarely change, you can just copy them from the master worktree instead.

## Description

- Scripts live in `mise/tasks/` as real bash files — proper syntax highlighting in editors.
- Mise auto-discovers tasks in that directory, no need to declare them in `.mise.toml`.
- A mise **enter hook** in `.mise.toml` runs `sync-git-submodules` when you cd into a worktree.
- `install-git-hooks` writes a `post-checkout` git hook that runs `sync-git-submodules`
  automatically when you create a new worktree (`wt switch` / `git worktree add`).
- Everything except `.git/hooks/` is tracked in git — portable across machines.
- On a new machine: just run `mise run install-git-hooks` once.

## Setup

### 1. Directory structure

```
repo/
├── .mise.toml
└── mise/
    └── tasks/
        ├── sync-git-submodules    ← bash script, executable
        └── install-git-hooks      ← bash script, executable
```

Add these files to your local git `exclude` or your `.gitignore`

```sh
echo ".mise.toml" >> .git/info/exclude
echo "mise/*" >> .git/info/exclude
```


### 2. .mise.toml

Only hooks and simple inline tasks live here. Complex scripts go in `mise/tasks/`.

```toml
[hooks]
# Runs automatically when you cd into any worktree directory.
# Silenced (2>/dev/null) to avoid noise if mise or git isn't available.
# "|| true" prevents shell errors if the task fails.
enter = "mise run sync-git-submodules 2>/dev/null || true"

[tasks.check_all]
description = "Run all quality checks"
run = [
    "cargo fmt",
    "cargo clippy --all-targets -- -D warnings",
    "cargo test",
]

# sync-git-submodules and install-git-hooks live in mise/tasks/ as standalone
# bash scripts — mise auto-discovers them from that directory.
```

### 3. mise/tasks/sync-git-submodules

```bash
#!/usr/bin/env bash
#MISE description="Copy heavy submodule dirs from master worktree (avoids git submodule update)"

# Find the root of the current worktree (works from any subdirectory).
ROOT=$(git rev-parse --show-toplevel 2>/dev/null) || exit 0

# Get the path of the master (first) worktree.
# "git worktree list" prints all worktrees; head -1 takes the first one (master).
MASTER=$(git worktree list 2>/dev/null | head -1 | awk '{print $1}')

# Exit if we couldn't find master, or if we ARE master (nothing to copy from).
[[ -z "$MASTER" || "$MASTER" == "$ROOT" ]] && exit 0

# List the directories to copy instead of running git submodule update.
# Add or remove paths as needed for your project.
dirs=(
  path/to/submodule-A
  path/to/submodule-B
  path/to/submodule-C
)

for dir in "${dirs[@]}"; do
  # Only copy if the source exists in master AND the destination is empty/missing.
  # This makes the script safe to run multiple times (idempotent).
  if [[ -d "$MASTER/$dir" && -z "$(ls -A "$ROOT/$dir" 2>/dev/null)" ]]; then
    echo "[mise] syncing: $dir"
    mkdir -p "$ROOT/$dir"
    # rsync -a: copy recursively preserving permissions/timestamps.
    # --exclude='.git': skip the .git pointer file inside submodule dirs
    #   (it contains a path relative to master that would be broken in this worktree).
    rsync -a --exclude='.git' "$MASTER/$dir/" "$ROOT/$dir/"
  fi
done
```

Make it executable:

```bash
chmod +x mise/tasks/sync-git-submodules
```

### 4. mise/tasks/install-git-hooks

```bash
#!/usr/bin/env bash
#MISE description="Install git hooks (run once per machine/clone)"

HOOK=".git/hooks/post-checkout"

# Write the post-checkout hook script.
# Git calls this hook after every checkout with 3 arguments:
#   $1 = previous HEAD, $2 = new HEAD, $3 = 1 (branch checkout) or 0 (file checkout).
# We only want to run on branch checkouts (wt switch / git worktree add).
cat > "$HOOK" << 'EOF'
#!/bin/sh
[ "$3" = "1" ] || exit 0
mise run sync-git-submodules
EOF

# Git hooks must be executable or git will ignore them.
chmod +x "$HOOK"

echo "[mise] installed $HOOK"
```

Make it executable:

```bash
chmod +x mise/tasks/install-git-hooks
```

### 5. Install the git hook

Run this once after cloning on each machine:

```bash
mise run install-git-hooks
```

## How it works

```
wt switch my-branch
    └─> git worktree add  (git internal)
            └─> post-checkout hook fires
                    └─> mise run sync-git-submodules
                            └─> copies dirs from master if empty
```

```
cd into any worktree
    └─> mise enter hook fires
            └─> mise run sync-git-submodules
                    └─> copies dirs from master if empty (skips if already populated)
```

The copy is skipped if:
- You are in the master worktree (nothing to copy from/to).
- The destination directory is already populated (safe to re-run).

## Usage

| Command | What it does |
|---|---|
| `mise run sync-git-submodules` | Manually trigger the sync in the current worktree |
| `mise run install-git-hooks` | Install the post-checkout hook (once per machine) |
| `wt switch <branch>` | Creates worktree + triggers sync automatically |
| `mise tasks` | List all available tasks |
