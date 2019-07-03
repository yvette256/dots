# Dotfiles

## Setup

I use Arch, btw.

Use `rice path/to/image.png` to apply wallpaper and generated colorscheme.  

### Primary:
- Shell: [bash](https://www.gnu.org/software/bash/)
- Terminal emulator: [termite](https://github.com/thestinger/termite)
- WM: [i3-gaps](https://github.com/Airblader/i3)  
- Bar: [polybar](https://github.com/jaagr/polybar)  
- Launcher: [dmenu-extended](https://github.com/MarkHedleyJones/dmenu-extended) with [rofi](https://github.com/DaveDavenport/rofi)  
- Text editor: [vim](https://github.com/vim/vim)
- Notifications: [dunst](https://github.com/dunst-project/dunst)  
- Color theme generation: [pywal](https://github.com/dylanaraps/pywal)  

### Dependencies:
- Network: [NetworkManager](https://www.archlinux.org/packages/extra/x86_64/networkmanager/), [nm-applet](https://www.archlinux.org/packages/extra/x86_64/network-manager-applet/)
- Fonts: [FontAwesome](https://aur.archlinux.org/packages/ttf-font-awesome/), [Inconsolata](https://www.archlinux.org/packages/community/any/ttf-inconsolata/), [DejaVu](https://www.archlinux.org/packages/extra/any/ttf-dejavu/), [Iosveka](https://github.com/be5invis/Iosevka).
- [rofi](https://github.com/davatorium/rofi): [rofi-calc](https://github.com/svenstaro/rofi-calc), [rofimoji](https://github.com/fdw/rofimoji).
- [xorg](https://www.archlinux.org/groups/x86_64/xorg/): [xclip](https://github.com/astrand/xclip), [xorg-xrdb](https://www.archlinux.org/packages/extra/x86_64/xorg-xrdb/), [xorg-xinput](https://www.archlinux.org/packages/extra/x86_64/xorg-xinput/) for configuring input devices (such as touchpad). 
- [powerline-shell](https://github.com/b-ryan/powerline-shell), [vundle](https://github.com/VundleVim/Vundle.vim) for managing vim plugins, [mkpdf](https://github.com/seifferth/mkpdf) for LaTeX compilation.
- [xcwd](https://github.com/schischi/xcwd), [i3lock-fancy](https://github.com/meskarune/i3lock-fancy)
- [pulseaudio](https://www.archlinux.org/packages/?name=pulseaudio), [light](https://github.com/haikarainen/light) to control backlight when `xbacklight` doesn't work, [compton](https://github.com/chjj/compton).
- [imagemagick](https://github.com/ImageMagick/ImageMagick), [wpgtk](https://github.com/deviantfero/wpgtk) for Pywal GTK theme, [feh](https://www.archlinux.org/packages/extra/x86_64/feh/).

## Managing Dotfiles

Credit for this below method belongs to [jaagr](https://github.com/jaagr/dots), below is a slightly modified version of their writeup. Files are kept at their intended location, without the need for symlinks.

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
