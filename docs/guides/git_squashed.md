# Git Squash

## How to Pull Squashed Commits to a Branch

1. Make sure `master` is up to date.

```bash
git checkout master
git pull origin master
```

2. Create a fresh branch from `master`.

```bash
git switch -c my-feature-squashed
# or: git checkout -b my-feature-squashed
```

3. Squash-merge your branch changes.

```bash
git merge --squash my-feature
```

4. Commit as a single commit.

```bash
git commit -m "My feature: single squashed commit"
```

5. Push if you want a PR.

```bash
git push -u origin my-feature-squashed
```

Or just update the branch history:

```bash
git push --force-with-lease
```

## Avoid CI

Squash local commits and rewrite history on remote:

```bash
git push --force-with-lease -o ci.skip
```
