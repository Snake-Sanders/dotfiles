return {
  "mrcjkb/rustaceanvim",
  opts = {
    server = {
      settings = {
        default_settings = {
          ["rust-analyzer"] = {
            -- Force rust-analyzer to use the stable toolchain for analysis
            extraEnv = { RUSTUP_TOOLCHAIN = "stable" },
            -- Optional: Explicitly set the command if needed
            -- command = { "rustup", "run", "stable", "rust-analyzer" },
          },
        },
        ["rust-analyzer"] = {
          linkedProjects = { "Cargo.toml" },
          cargo = {
            allFeatures = false,
            allTargets = false,
            buildScripts = { enable = false },
            loadOutDirsFromCheck = false,
          },
          check = {
            allTargets = false,
            command = "check",
            extraArgs = { "--no-deps" },
          },
          checkOnSave = false,
          procMacro = {
            enable = false,
            ignored = {
              mockall = { "automock", "mock" },
              ethosu_rs_macro = { "load_model" },
            },
          },
          files = {
            excludeDirs = { "target", "cross/target", ".git" },
          },
          diagnostics = {
            enable = true,
          },
        },
      },
    },
  },
}
