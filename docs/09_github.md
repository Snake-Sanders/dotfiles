# Github

To use Github it is recommended to create ssh keys, because user and password
authentication was deprecated.

> Reference: https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent

## Steps

1. Start ssh agent

```
$ eval "$(ssh-agent -s)"
> Agent pid 59566
```

2. got to `~/.ssh` and create the pair of keys

`ssh-keygen -t ed25519-sk -C "your_email@example.com"`

it will propt to chose a file name:

`> Enter a file in which to save the key (/Users/YOU/.ssh/id_ed25519_sk): [Press enter]`

then you can skip the passphrase

```
> Enter passphrase (empty for no passphrase): [Type a passphrase]
> Enter same passphrase again: [Type passphrase again]
```

3. create this file if does not exist

`touch ~/.ssh/config`

add the content

```
Host github.com
  AddKeysToAgent yes
  UseKeychain no
  IdentityFile ~/.ssh/id_ed25519
```

Note: `UseKeychain no` this should be yes if there is a passphrase for they key.

4. Add the public key to Github

https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account

copy the key

```

$ pbcopy < ~/.ssh/id_ed25519.pub
# Copies the contents of the id_ed25519.pub file to your clipboard
```

- Open Github
- Go to settings
- In the "Access" section of the sidebar, click ** SSH and GPG keys**.
- Click New SSH key or Add SSH key.
- In the "Title" field, add a descriptive label for the new key. For example, "Personal laptop".
- Select the type of key, either authentication or signing.
- In the "Key" field, paste your public key.
- Click Add SSH key.
