# Git

If you have multiple git users, let's say one for work and one for personal 
projects, you can configure Git to automatically pick the right user
for commiting on each project.

create this git config file wherever is your folder for your profesional work
projects, this file will be refrenced in the global configuration:

`/Users/MY_USER/src/WORK/.gitconfig`

```
[user]
  name = MyName MySurname
  email = my_user@company.com
```

then add global configuration the following:

`/Users/MY_USER/.gitconfig`

```
; this is the default user

[user]
	name = Snake Sanders
	email = email@gmail.com

; If you want to add more users this is the format:
; Uncomment and update accordingly.

; Example for multi-user configuration
; [includeIf "gitdir:~/Private/"]
     path = ~/Private/.gitconfig

; This is the user I have for Work
; - WORK_DIR is not a git repo, but contains subfolders with git repos, that is 
; why ends with /*/.
; - Sometimes the ~/ does not work so it might need the full path.

[includeIf "gitdir:/Users/MY_USER/src/WORK_DIR/*/"]
  path = /Users/MY_USER/src/WORK_DIR/.gitconfig

```

To validate the configuration, close vscode, go to the project folder and 
check if the working user is picked up by git.

- Check user name `git config user.name`
- Check user email `git config user.email`

## Configure gitlab/github keys

create a key with 

`ssh-keygen -t rsa"`

do not add passphrase otherwise you will need to type for every 
git commit or git pull.

If you have different users for github and gitlab then you 
need to specify which key to use on each one.

create `~/.ssh/config`

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

ensure the access right

```
chmod 600 ~/.ssh/config
chmod 600 ~/.ssh/your_gitlab_key
chmod 600 ~/.ssh/your_github_key
```

test the connection 

`ssh -T git@gitlab.com`

