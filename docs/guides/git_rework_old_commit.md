# Easy Way to Update an Old Commit

You have this commit history:

```text
commit-a
commit-b
commit-c
```

If you want to change `commit-c`:

```bash
git rebase -i HEAD~3
```

The editor shows commits in reverse order:

```text
edit commit-c
pick commit-b
pick commit-a
```

Do your changes, then amend that commit:

```bash
git commit --amend
```

Then continue the rebase:

```bash
git rebase --continue
```
