# ios-dev-starter-nvim

This a repository with a sample config that provides all features required to develop iOS and macOS apps in Neovim.

## Requirements

- [codelldb](https://github.com/vadimcn/codelldb/releases) - download latest release for DARWIN and unzip `vsix` file. Then make sure that the path in `nvim-dap/init.lua` points to this folder
- SwiftLint - install via Homebrew
- SwiftFormat - install via Homebrew
- xcbeautify - install via Homebrew
- [xcode-build-server](https://github.com/SolaWing/xcode-build-server) - clone repository, unzip, and run it for your project
- make sure that the path to `sourcekit-lsp` in `nvim-lspconfig.lua` points to you Xcode.

## Basic Key Bindings

- `<leader>dd` - build, run & debug app
- `<leader>X` - open `xcodebuild.nvim` picker with project actions
- `<leader>xb` - build project
- `<leader>xt` - run tests
- `<C-b>` - toggle breakpoint

## Full Tutorial

This repository is a complementary project for my blog post: [The Complete Guide To iOS & macOS Development In Neovim](https://wojciechkulik.pl/ios/the-complete-guide-to-ios-macos-development-in-neovim). 

Please read it to learn how to use this config.

## Xcodebuild.nvim

If you already have your setup, you may want to check out just my [xcodebuild.nvim](https://github.com/wojciech-kulik/xcodebuild.nvim) plugin that adds actions like build, run, and test for iOS and macOS apps to your Neovim.
