# Git

Configure your users in order to use different accounts for work and personal.

create this file:
`/Users/mac/src/weavs.io/.gitconfig`

```
[user]
  name = MyName MySurname
  email = my_user@company.com
```

then in add the following in
`/Users/MY_USER/.gitconfig`

```
[user]
	name = Snake Sanders
	email = elmarian22@gmail.com

# Example for multi-user configuration
# [includeIf "gitdir:~/Private/"]
#     path = ~/Private/.gitconfig

# This is the user I have for Work
[includeIf "gitdir:~/src/WORK_DIR/"]
  path = ~/src/WORK_DIR/.gitconfig
```

To validate the configuration, close vscode, go to the project folder

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

