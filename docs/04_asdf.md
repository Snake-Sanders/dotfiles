
# asdf

`brew install asdf`

## Configure asdf for ZHS

https://asdf-vm.com/guide/getting-started.html

Add asdf.sh to your `ZSH` terminal with:

`echo -e "\n. $(brew --prefix asdf)/libexec/asdf.sh" >> ${ZDOTDIR:-~}/.zshrc`

## Troubleshooting

**The problem**

After updating Homebrew ASDF cannot fine `mix`.
It shows the following errors

```
/Users/mac/.asdf/shims/mix: line 4: /opt/homebrew/opt/asdf/libexec/bin/asdf: No such file or directory
/Users/mac/.asdf/shims/mix: line 4: exec: /opt/homebrew/opt/asdf/libexec/bin/asdf: cannot execute: No such file or directory
```
**The Solution**

```sh
# Remove and regenerate the shims
rm -rf ~/.asdf/shims
asdf reshim
```

* Source ref: 
https://braytonium.com/2023/01/09/asdf-seems-broken-after-homebrew-upgrade/ 

