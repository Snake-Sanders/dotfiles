# Phoenix

## Troubleshooting

if some of the dependencies does not want to compile try these:

mix local.hex
mix archive.install hex phx_new
rm -rf _build deps
mix do deps.get, compile
