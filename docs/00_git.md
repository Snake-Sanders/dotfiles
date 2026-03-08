# Git

If you have multiple git users, let's say one for work and one for personal
projects, you can configure Git to automatically pick the right user
for committing on each project.

## Git Multi-User Setup (Work + Personal)

- `~/.gitconfig` is your main global Git configuration.
- Work identity goes in `~/.gitconfig` under `[user]`.
- Personal identity goes in a separate file, e.g. `~/.gitconfig-personal`.
- `includeIf` in `~/.gitconfig` loads the personal file only when the repo path
matches.

File: `~/.gitconfig` (default = work)

```
[user]
      email = employee@company.com
      name = Employee Surname

  [includeIf "gitdir:~/dotfiles/*"]
      path = /home/user/.gitconfig-personal

  ; another example
  [includeIf "gitdir:~/Private/*"]
      path = /home/user/.gitconfig-personal

  [safe]
      directory = /workspace

  [alias]
      st = status
      co = checkout

```

File: `~/.gitconfig-personal` (personal = GitHub)

```
[user]
      email = <personal@gmail.com>
      name = Snake Sanders
```

Validate:

Make sure in each folder the right git use is used.

- Check user name `git config user.name`
- Check user email `git config user.email`

## Configure gitlab/github keys

Create a key with

`ssh-keygen -t ed25519`

- Do not add passphrase otherwise you will need to type for every
git commit or git pull.

- If you have different users for github and gitlab then you
need to specify which key to use on each one.

> Note that this step is old and it might not be needed anymore.

Create `~/.ssh/config`

add:

```
# GitLab configuration
Host gitlab.com
    HostName gitlab.com
    User git
    IdentityFile ~/.ssh/your_gitlab_key

# GitHub configuration
Host github.com
    AddKeysToAgent yes
    UseKeychain no
    IdentityFile ~/.ssh/your_github


# Default configuration for other hosts
Host *
    AddKeysToAgent yes
    UseKeychain yes
    IdentityFile ~/.ssh/id_rsa    
```

Ensure the access right

```
chmod 700 ~/.ssh
chmod 600 ~/.ssh/id_ed25519
chmod 644 ~/.ssh/id_ed25519.pub
```

Test the connection

`ssh -T git@gitlab.com`

## HTTPS vs SSH

If the repo was checkout with the `https` protocol, no ssh keys,
then for pushing changes we need to change the protocol to `ssh`.

```
git remote -v
https://github.com/USER/REPO.git
```

Change to SSH

```
git remote set-url origin git@github.com:USER/REPO.git
```

Verify:

```
git remote -v
git@github.com:USER/REPO.git
```

Make sure the keys are loaded

```
ssh-add -l
```

Then test the connection

```
ssh -T git@github.com
```

If it fail, check the permission of the key and set with `chmod`.
