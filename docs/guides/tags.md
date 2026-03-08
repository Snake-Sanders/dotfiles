# Git Tag Cheatsheet

## Create and Push

This creates a tag and pushes it to remote.

```bash
git tag v0.2.0
git push origin v0.2.0
```

## Create

```bash
git tag v0.0.0
git tag -a v0.0.0 -m "delete me: v0.0.0test"
```

## List

```bash
git tag
git tag -l "v1.*"
```

## Show

```bash
git show v1.0.0
```

## Delete

```bash
git tag -d v1.0.0
git push origin :refs/tags/v1.0.0
```

## Push

```bash
git push origin v1.0.0
git push origin --tags
```
