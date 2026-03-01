# Elixir

## requirements 
make sure you have installed `asdf` and `erlang`
erlang should be installed as asdf plugin!

## add the elixir asdf plugin

`asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git`

now you can list the versions to choose 
the one you want to install:

Example: 

* list 

`asdf list all erlang`

* install versions

`asdf install elixir 1.15.7-otp-26`

* set default version

`asdf global elixir 1.15.7-otp-26`
