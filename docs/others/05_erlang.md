# Erlang

There is a specific plug for `asdf`.

## First read the installation

https://github.com/asdf-vm/asdf-erlang

https://github.com/asdf-vm/asdf-erlang#before-asdf-install

## Installation

### Dependencies

- preinstallation, adding the source url for the plug.

brew install autoconf
brew install wxwidgets
brew install libxslt fop
brew install openssl

asdf plugin add erlang https://github.com/asdf-vm/asdf-erlang.git

### installing erlang using the plug 

To skip the Java dependency during installation use:

`export KERL_CONFIGURE_OPTIONS="--disable-debug --without-javac"`

if you have a mix project with `.tool-version` file, then navigate to the directory
and run the command there, it will pick up the right version from it.

`asdf install` pulls from app's .tool-versions file, but this will not work if 
you also need elixir, which is not yet installed. So you need to set the version.

otherwise specify the version yourself:

asdf install erlang <version>
asdf install erlang 26.1.2

- now set one version as globals

`asdf global erlang 26.1.2`

- check the path

if in a new terminal `which erl` does not work, then make
sure that the asdf executable is in the path of your terminal.
I my case iTerm and ZSH. Go back to installing asdf steps.

## Troubleshooting

in case mix complains about missing ssl library
uninstall erlang with:

`asdf uninstall erlang 26.1.2`

Reinstall specifying the version of ssh

```bash
export KERL_CONFIGURE_OPTIONS="--without-javac --with-ssl=$(brew --prefix openssl@3)"

asdf install erlang 26.1.2
```
