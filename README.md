

# About
![nvim](https://img.shields.io/badge/require%20neovim-v0.7.0-red)
![language](https://img.shields.io/github/languages/top/Yarnus/nvim)
![Neovim Configuration Test](https://img.shields.io/github/workflow/status/Yarnus/nvim/Neovim%20Configuration%20Test?label=paker%20compile&logo=Github)
![last commit](https://img.shields.io/github/last-commit/Yarnus/nvim?color=yellow)

- My personal nvim configuration written in lua.
![preview](https://i.imgur.com/GQJEB85.png)


# Credit
- This project is originally base on [Avimitin/nvim](https://github.com/Avimitin/nvim)  ( I highly recommend it to be your first template.)
- It's originally inspired by
  - [theniceboy/nvim](https://github.com/theniceboy/nvim)
  - [siduck76/NvChad](https://github.com/siduck76/NvChad)
  - [glepnir/nvim](https://github.com/glepnir/nvim)

Anyway, take a look at their contribution, which is really fantastic.

# Installation
1. neovim v0.7 or later (please follow [neovim installation](https://github.com/neovim/neovim/wiki/Installing-Neovim).) 
2. nerdfont (most of chars are based on nerd font, therefore it's highly recommended to install [nerdfont](https://www.nerdfonts.com/font-downloads) for impressive icon support.)
3. other neovim dependency (for more details, please use `:checkhealth` in neovim.)
  - Install `pip3` and run `pip3 install --user pynvim`
  - Install `node` and run `npm install -g neovim`
4. run neovim then do `:PackerInstall`, after that run `:PackerCompile`
5. restart neovim and installation done. (ATM, some lsp/tree-sitter will download automatically.)

# TODO
- [x] Trouble-shooting for terrible `elixir` rendering
- [ ] Optimized neovim start up time based on each file
- [ ] Add more docs and screenshot

## Start up time test data
> Base on MBP 13 (2018, i5 2.3Ghz / 8 / 256)
```text
# Open only buffer
# nvim --startuptime /tmp/nvim-startuptime && tail -n 1 /tmp/nvim-startuptime | awk -F: '{print $1}'
# test it 3 times
041.010  000.008
040.462  000.002
042.642  000.002

# Open README.md
# nvim README.md --startuptime /tmp/nvim-startuptime && tail -n 1 /tmp/nvim-startuptime | awk -F: '{print $1}'
092.200  000.002
098.288  000.003
095.921  000.003

```
