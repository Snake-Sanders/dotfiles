# Cherry Pick

```text
d5ba579f7b00 <- newest
86d764491075
5e1d58129d3e
b99c037c2dc9 <- oldest
```

```bash
git cherry-pick oldest^..newest
```

Example:

```bash
git cherry-pick b99c037c2dc9^..d5ba579f7b00
```
