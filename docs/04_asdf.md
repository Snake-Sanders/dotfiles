
# asdf

`brew install asdf`

## Configure asdf for ZHS

https://asdf-vm.com/guide/getting-started.html

Add asdf.sh to your `ZSH` terminal with:

`echo -e "\n. $(brew --prefix asdf)/libexec/asdf.sh" >> ${ZDOTDIR:-~}/.zshrc`
