# Split a Commit with Interactive Rebase

This walkthrough will:

- create a repo with a text file,
- create 4 commits so the target commit is not at `HEAD`,
- split the second commit into two commits,
- finish the rebase.

## 0) Setup a Sandbox Repo

```bash
mkdir git-split-lab && cd git-split-lab
git init -b main
git config --local format.pretty oneline
```

## 1) Create a File and Commits

```bash
cat > article.txt <<'EOF2'
# Building a Tea Timer

This article explains how to build a simple tea timer using a shell script.
EOF2
git add article.txt
git commit -m "feat: intro"

cat >> article.txt <<'EOF2'

Brewing green tea requires careful timing to avoid bitterness. Start with water below boiling point, typically 80C to 85C. Pour the water over the leaves and steep for 1-2 minutes depending on taste. A reliable timer helps you stay consistent across brews and teas. In this guide, we'll script a tiny timer so you can run it from any terminal.
EOF2
git add article.txt
git commit -m "feat: add big brewing paragraph"

cat >> article.txt <<'EOF2'

## Script Overview

The timer will accept a duration in seconds and beep when finished.
EOF2
git add article.txt
git commit -m "docs: add script overview"

echo -e "\n(End of draft)" >> article.txt
git add article.txt
git commit -m "chore: add end note"
```

Check history:

```bash
git log --oneline
```

## 2) Start Interactive Rebase

```bash
git rebase -i HEAD~3
```

In the todo list, change the target line from `pick` to `edit`.

## 3) Uncommit the Target Commit

```bash
git reset --mixed HEAD^
git status
```

## 4) Split into Two Commits

```bash
git add -p article.txt
git commit -m "docs(tea): add green-tea timing notes"

git add -p article.txt
git commit -m "docs(tea): add timer motivation"
```

## 5) Continue Rebase

```bash
git rebase --continue
git log --oneline
nl -ba article.txt
```

## 6) Optional Remote Push

```bash
cd .. && git init --bare remote.git
cd git-split-lab
git remote add origin ../remote.git
git push -u origin main

git commit --amend -m "docs(tea): add green-tea timing guidance"
git push --force-with-lease
```
