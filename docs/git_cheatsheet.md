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

## Replace a remote branch with your current local branch 

```bash
# 1. Ensure you are on the local branch with the correct history
git checkout <local-good-branch>
# (This is the branch that contains your fixed, rewritten commits)

# 2. Force-push your current HEAD to overwrite the remote MR branch
git push --force-with-lease origin HEAD:<remote-target-branch>
# (Replaces the remote branch even if names differ; safest way to update MR)

# 3. Set your local branch to track the correct remote branch
git branch -u origin/<remote-target-branch>
# (Makes future pushes go to the right remote branch automatically)

# 4. (Optional) rename your local branch if needed
git branch -m <new-local-branch-name>
# (Fix typos or align local name with remote name)
```
