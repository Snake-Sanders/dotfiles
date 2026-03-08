# Rework Commits on Feature Branch

Find the commit before the block of commits to edit.

If you want to edit `003` to `005`, pick `002` as the base:

```text
005 my commit 3
004 my commit 2
003 my commit 1
002 Somebody's commit
001 Somebody's commit
```

## Remove Commits

```bash
git reset --mixed BASE
```

Where `BASE` is `002`.

## Rewrite History on Branch

If the branch is already tracked on remote:

```bash
git push --force-with-lease
```
