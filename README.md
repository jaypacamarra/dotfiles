# dotfiles
These are the configuration files for my preferred development environment.

## Requirements
- Vim >= 0.9.0
- ruby >= 2.6
- GNU Stow >= 2.0.0
- fzf

program = "/usr/bin/zsh"

Install zsh plugins:

```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/Aloxaf/fzf-tab ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tab
```

## Install
This will create symlinks to the target directory defined in the stow directory.

For example, you can install the neovim configuration with:
```
stow nvim
```

## Uninstall
This will remove the symlinks that was created with `stow` for nvim:
```
stow -D nvim
```

## File Organization and Structure
```
~/code/			# no projects directly under this dir.
	apps/		# apps i use or install from source.
	view/		# read-only.
	<client>/	# professional work. one per client or employer.
	contrib/	# github forks i contribute to (except my own).
	my/		# personal projects.
	junk/		# R&D. Temp experiments.
~/bin/			# scripts, possibly symlinks.
```
