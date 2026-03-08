# Split a Commit Not at HEAD (Interactive Rebase)

1. Backup your branch.

```bash
git branch backup/<date>
```

2. Start an interactive rebase from before the commit.

```bash
git rebase -i <base>
```

`<base>` is the commit before the one you want to split, or `origin/main`.

3. Mark the commit to split as `edit`.

Change `pick` to `edit` in the rebase todo file.

4. Let rebase stop at that commit.

Git pauses with HEAD detached at the commit you chose.

5. Uncommit its changes and keep them in your working tree.

```bash
git reset --mixed HEAD^
```

6. Split into smaller commits.

```bash
git add -p
git commit -m "part 1"
git add -p
git commit -m "part 2"
```

Repeat until all pieces are committed.

7. Continue the rebase.

```bash
git rebase --continue
```

8. Fix conflicts if they appear.

```bash
git add <fixed-files>
git rebase --continue
```

9. Verify new history.

```bash
git log --oneline
```

10. Push updated branch to remote.

```bash
git push --force-with-lease
```

Quick summary:

```text
rebase -i -> edit -> reset HEAD^ -> split commits -> rebase --continue -> force-with-lease push
```
