# dotfiles

Linux dotfiles using [dotdrop](https://dotdrop.readthedocs.io/en/latest/).

The `dotdrop` folder contains config files for the use of dotdrop. The files in the `dotfiles` contains dotfiles, mainly config files.

## How to use repo ?

Dotdrop must be installed.

To add files to the repo, you can use this command, at the root of this repository:
```sh
$> dotdrop import [path to file / folder] -c dotdrop/config.yaml
```

The config installation can then be done with one command at the repository root:
```sh
dotdrop install -p lukac-laptop -D -c dotdrop/config.yaml
```
