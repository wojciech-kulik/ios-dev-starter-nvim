# ios-dev-starter-nvim

This a repository with a sample config that provides all features required to develop iOS and macOS apps in Neovim.

## Requirements

- [XcodeProjectCLI](https://github.com/wojciech-kulik/XcodeProjectCLI) - to manage Xcode project file
- [xcode-build-server](https://github.com/SolaWing/xcode-build-server) - build your project in Xcode, clone the repository, unzip, and run this tool for your project
- [pymobiledevice3](https://github.com/doronz88/pymobiledevice3) - to debug on physical devices and/or run apps on devices below iOS 17
- [SwiftLint](https://github.com/realm/SwiftLint) - code linter
- [SwiftFormat](https://github.com/nicklockwood/SwiftFormat) - code formatter
- [xcbeautify](https://github.com/cpisciotta/xcbeautify) - Xcode logs formatter
- [coreutils](https://formulae.brew.sh/formula/coreutils) - allows to print macOS app logs without attached debugger

## Installation

Please make sure to install all dependencies and get familiar with [README.md from xcodebuild.nvim repository](https://github.com/wojciech-kulik/xcodebuild.nvim).

```
brew install xcp xcode-build-server xcbeautify swiftformat swiftlint pipx rg jq coreutils
pipx install pymobiledevice3
```

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
- `<leader>tt` - toggle Trouble

## Full Tutorial

This repository is a complementary project for my blog post: [The Complete Guide To iOS & macOS Development In Neovim](https://wojciechkulik.pl/ios/the-complete-guide-to-ios-macos-development-in-neovim).

Please read it to learn how to use this config.

## Xcodebuild.nvim

If you already have your setup, you may want to check out just my [xcodebuild.nvim](https://github.com/wojciech-kulik/xcodebuild.nvim) plugin that adds actions like build, run, and test for iOS and macOS apps to your Neovim.
