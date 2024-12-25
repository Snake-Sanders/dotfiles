# GIT

## rename branch 

`git branch -m <old-name> <new-name>`

## rebase

`git rebase -i <base-commit-id>

## Changing remote

If the git repo checked out as HTTPS but now you want to change it 
to SSH, do the following:

check what is the remote source

`git remote -v`

find out what is the SSH repo url format of you repo. Example 

`git@github.com:Snake-Sanders/cpp-skills.git`

set the new origin

formula: `git remote set-url origin <git@...git>`

`git remote set-url origin git@github.com:username/repository.git`

