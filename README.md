# Dotfiles

## Setup (Arch Linux)

Use `wal -ig path/to/image.png && wal-set` to generate and apply colorscheme.  

### Primary:
- Shell: [bash](https://www.gnu.org/software/bash/)
- Terminal emulator: [termite](https://github.com/thestinger/termite)
- WM: [i3-gaps](https://github.com/Airblader/i3)  
- Bar: [polybar](https://github.com/jaagr/polybar)  
- Launcher: [dmenu-extended](https://github.com/MarkHedleyJones/dmenu-extended) with [rofi](https://github.com/DaveDavenport/rofi)  
- Text editor: [vim](https://github.com/vim/vim)
- Notifications: [dunst](https://github.com/dunst-project/dunst)  
- File manager: [ranger](https://github.com/ranger/ranger)  
- Browser: [firefox](https://www.archlinux.org/packages/extra/x86_64/firefox/)  
- Color theme generation: [pywal](https://github.com/dylanaraps/pywal)  

### Dependencies:
- [pulseaudio](https://www.archlinux.org/packages/?name=pulseaudio), for volume control.
- [NetworkManager](https://www.archlinux.org/packages/extra/x86_64/networkmanager/) and [nm-applet](https://www.archlinux.org/packages/extra/x86_64/network-manager-applet/), for network.
- [xclip](https://github.com/astrand/xclip) for copying to clipboard.
- [imagemagick](https://github.com/ImageMagick/ImageMagick) for pywal.
- [gnupg](https://www.archlinux.org/packages/core/x86_64/gnupg/) for network.
- [FontAwesome](https://aur.archlinux.org/packages/ttf-font-awesome/), [Inconsolata](https://www.archlinux.org/packages/community/any/ttf-inconsolata/), [DejaVu](https://www.archlinux.org/packages/extra/any/ttf-dejavu/), fonts.
- [light](https://github.com/haikarainen/light), to control backlight when `xbacklight` doesn't work.
- [compton](https://github.com/chjj/compton), for compositing.
- [powerline-shell](https://github.com/b-ryan/powerline-shell), for shell prompt.
- [oomox](https://github.com/themix-project/oomox), for pywal gtk theme.
- [xorg-xrdb](https://www.archlinux.org/packages/extra/x86_64/xorg-xrdb/), for resources.
- [xorg-xinput](https://www.archlinux.org/packages/extra/x86_64/xorg-xinput/), for configuring input devices (such as touchpad). 

## Managing Dotfiles

Credit for this below method belongs to [jaagr](https://github.com/jaagr/dots), below is a slightly modified version of their writeup. Files will be kept at their intended location, without the need for symlinks.

#### Alias
~~~ sh
alias dots='git --git-dir=$HOME/.dots.git/ --work-tree=$HOME'
~~~

#### Setup
~~~ sh
git init --bare $HOME/.dots.git
dots remote add origin https://github.com/helloquat/dots.git
~~~

#### Configuration
~~~ sh
dots config status.showUntrackedFiles no

# Useful aliases
dots config alias.untracked "status -u ."
dots config alias.untracked-at "status -u"
~~~

#### Usage
~~~ sh
# Use the dots alias like you would use the git command
dots status
dots add --update ...
dots commit -m "..."
dots push

# Adding file to repository
dots add $HOME/.config/file

# Listing files (not tracked by git)
dots untracked
dots untracked-at $HOME/path/to/foo/bar
dots status -u .config/

# Listing files (tracked by git)
dots ls-files
dots ls-files .config/polybar/
~~~

#### Replication
~~~ sh
git clone --recursive --separate-git-dir=$HOME/.dots.git https://github.com/helloquat/dots.git /tmp/dots
rsync -rvl --exclude ".git" /tmp/dots/ $HOME/
rm -r /tmp/dots
dots submodule update --init --recursive $HOME/
~~~
