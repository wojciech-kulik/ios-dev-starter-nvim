# ios-dev-starter-nvim

This a repository with a sample config that provides all features required to develop iOS and macOS apps in Neovim.

## Requirements

- [codelldb](https://github.com/vadimcn/codelldb/releases) - download latest release for DARWIN and unzip `vsix` file. Then make sure that the path in `nvim-dap/init.lua` points to this folder
- [Xcodeproj](https://github.com/CocoaPods/Xcodeproj) - install via gem
- SwiftLint - install via Homebrew
- SwiftFormat - install via Homebrew
- xcbeautify - install via Homebrew
- [xcode-build-server](https://github.com/SolaWing/xcode-build-server) - build your project in Xcode, clone the repository, unzip, and run this tool for your project

## Trying Out This Config

If you want to just try this config without affecting your own. You can check out this repository to your `~/.config` directory and run:

```bash
NVIM_APPNAME=ios-dev-starter-nvim nvim
```

## Basic Key Bindings

`<leader>` = `space`

- `<leader>X` - open `xcodebuild.nvim` picker with project actions
- `<leader>xf` - to open Project Manager and manage files
- `<leader>dd` - build, run & debug app
- `<leader>dt` - debug tests
- `<leader>xr` - build & run
- `<leader>xb` - build project
- `<leader>xt` - run tests
- `<leader>xc` - toggle code coverage
- `<leader>xC` - show code coverage report
- `<leader>b` - toggle breakpoint
- `<leader>e` - nvim-tree
- `<leader>fg` - Telescope grep
- `<leader>ff` - Telescope find file

## Full Tutorial

This repository is a complementary project for my blog post: [The Complete Guide To iOS & macOS Development In Neovim](https://wojciechkulik.pl/ios/the-complete-guide-to-ios-macos-development-in-neovim).

Please read it to learn how to use this config.

## Xcodebuild.nvim

If you already have your setup, you may want to check out just my [xcodebuild.nvim](https://github.com/wojciech-kulik/xcodebuild.nvim) plugin that adds actions like build, run, and test for iOS and macOS apps to your Neovim.
