# configs

These are my configs, feel free to look around

Most of the config files are for GNU/Linux programs, but there are some for MacOS too.

## Usage

Follow the instructions in [this article](https://www.atlassian.com/git/tutorials/dotfiles).
To setup gpg import your gpg key to using the `gpg --import <file>` command.
To setup ssh copy your private key to `~/.ssh/id_rsa` and generate the public
key using `ssh-keygen -f ~/.ssh/id_rsa -y > ~/.ssh/id_rsa.pub`.
To setup git you need to setup gpg, because commit signing is enabled by default.
To setup neovim install [vim-plug](https://github.com/junegunn/vim-plug) and
run `nvim -c :PlugInstall`.
To setup zsh install [oh-my-zsh](https://ohmyz.sh/#install).

## Credits and References

1. https://github.com/koekeishiya/yabai/blob/master/examples/skhdrc
2. https://github.com/FrankLA0203/Dotfiles/blob/master/.skhdrc
3. https://gitlab.com/dwt1
4. https://gitlab.com/LukeSmithxyz
