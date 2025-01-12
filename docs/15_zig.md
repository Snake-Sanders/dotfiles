# Zig

## Install the laguage

`brew install zig`

## Add LSP 

```sh
cd ~/src/github
git clone https://github.com/zigtools/zls
cd zls
```

now use the tag version compatible to the zig version.
Example for zig 0.13 use the same git tag.

```sh
git checkout 0.13.0
```

then compile

```sh
zig build -Doptimize=ReleaseSafe
```

Add the following settings in neovim plug configuration `local servers = {...`

```lua
-- Zig
zls = {
    -- omit the following line if `zls` is in your PATH
    cmd = { '/Users/mac/src/github/zls/zig-out/bin/zls' },
    settings = {
	zls = {
	   -- Whether to enable build-on-save diagnostics
           --
           -- Further information about build-on save:
           -- https://zigtools.org/zls/guides/build-on-save/
           -- enable_build_on_save = true,
           -- omit the following line if `zig` is in your PATH
           -- zig_exe_path = '/path/to/zig_executable'
        },
    },
},
```

also add `zig` to the list of `ensure_installed` in Treesitter config

