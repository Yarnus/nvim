

# About
![nvim](https://img.shields.io/badge/require%20neovim-v0.5.1-red)
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


# TODO
- [ ] Optimized neovim start up time based on each file
- [ ] Add guide and more screent

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
