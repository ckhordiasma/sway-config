# dotfiles

Personal config files, managed with [GNU Stow](https://www.gnu.org/software/stow/).

Each top-level directory is a stow package — `stow <pkg>` symlinks its contents into `~`, mirroring the package's internal structure.

## install

```bash
git clone git@github.com:ckhordiasma/dot-config.git ~/dotfiles
cd ~/dotfiles
stow *           # or pick specific packages: stow bash niri
```

If `~` already has the file you're trying to stow, either delete it first or use `stow --adopt <pkg>` to pull the existing file into the package (then `git diff` to review).

## packages

| Package   | Contents |
|-----------|----------|
| `bash`    | `.bash_profile`, `.bashrc`, `.profile` |
| `niri`    | niri compositor config + xdg-desktop-portal configs |
| `nvim`    | neovim config |
| `sway`    | sway, swaylock, i3bar-river configs |
| `scripts` | helper shell scripts under `~/.config/scripts/` |

## uninstall

```bash
cd ~/dotfiles
stow -D <pkg>    # removes symlinks for that package
```

## adding a new package

1. Make a new directory at the repo root, e.g. `alacritty/`
2. Mirror the path inside it: `alacritty/.config/alacritty/alacritty.toml`
3. `stow alacritty`
