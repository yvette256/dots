# Dotfiles

## Setup

I use Arch, btw.

Use `rice path/to/image.png` to apply wallpaper and generated colorscheme.

### Primary
- Shell: [bash](https://www.gnu.org/software/bash/)
- Terminal emulator: [kitty](https://github.com/kovidgoyal/kitty)
- WM: [i3-gaps](https://github.com/Airblader/i3)
- Bar: [polybar](https://github.com/jaagr/polybar)
- Launcher: [dmenu-extended](https://github.com/MarkHedleyJones/dmenu-extended) + [rofi](https://github.com/DaveDavenport/rofi)
- Text editor: [(g)vim](https://www.archlinux.org/packages/extra/x86_64/gvim/)
- Notifications: [dunst](https://github.com/dunst-project/dunst)
- Color theme generation: [pywal](https://github.com/dylanaraps/pywal)

### Dependencies
- Network: [NetworkManager](https://www.archlinux.org/packages/extra/x86_64/networkmanager/), [nm-applet](https://www.archlinux.org/packages/extra/x86_64/network-manager-applet/).
- Fonts: [FontAwesome](https://aur.archlinux.org/packages/ttf-font-awesome/), [Inconsolata](https://www.archlinux.org/packages/community/any/ttf-inconsolata/), [DejaVu](https://www.archlinux.org/packages/extra/any/ttf-dejavu/), [Iosevka](https://github.com/be5invis/Iosevka).
- GTK: [Adwaita (cursor)](https://www.archlinux.org/packages/?name=gnome-themes-extra), [deepin-dark (icon)](https://www.archlinux.org/packages/community/any/deepin-icon-theme/).
- rofi: [rofi-calc](https://github.com/svenstaro/rofi-calc), [rofi-emoji](https://github.com/Mange/rofi-emoji).
- [xorg](https://www.archlinux.org/groups/x86_64/xorg/): [xclip](https://github.com/astrand/xclip), [xorg-xrdb](https://www.archlinux.org/packages/extra/x86_64/xorg-xrdb/), [xorg-xinput](https://www.archlinux.org/packages/extra/x86_64/xorg-xinput/).
- Compositor: [compton](https://github.com/chjj/compton).
- Term/vim: [powerline-shell](https://github.com/b-ryan/powerline-shell), [powerline-fonts](https://github.com/powerline/fonts), [vundle](https://github.com/VundleVim/Vundle.vim), [mkpdf](https://github.com/seifferth/mkpdf) for vimtex LaTeX compilation.
- Sound/display: [pulseaudio](https://www.archlinux.org/packages/?name=pulseaudio), [pulseaudio-alsa](https://www.archlinux.org/packages/extra/any/pulseaudio-alsa/), [light](https://github.com/haikarainen/light) to control backlight.
- pywal: [wpgtk](https://github.com/deviantfero/wpgtk), [imagemagick](https://github.com/ImageMagick/ImageMagick), [feh](https://www.archlinux.org/packages/extra/x86_64/feh/).
- Misc scripts: [xcwd](https://github.com/schischi/xcwd).
    - Power menu: [i3lock-fancy](https://github.com/meskarune/i3lock-fancy), [i3lock-color](https://github.com/PandorasFox/i3lock-color).
    - zathura-md: [zathura](https://www.archlinux.org/packages/community/x86_64/zathura/), [pandoc](https://github.com/jgm/pandoc), [entr](http://eradman.com/entrproject/), [fzf](https://github.com/junegunn/fzf).

### Additional
- Fetch: [aurafetch](https://gitlab.com/LionessAlana/aurafetch), [ufetch](https://gitlab.com/jschx/ufetch).
- [ranger](https://github.com/ranger/ranger): [w3m](https://www.archlinux.org/packages/extra/x86_64/w3m/), [highlight](https://github.com/tajmone/highlight).
- Misc: [thunar](https://www.archlinux.org/packages/extra/x86_64/thunar/), [okular](https://www.archlinux.org/packages/extra/x86_64/okular/), [vlc](https://www.videolan.org/vlc/), [yad](https://github.com/v1cont/yad).


## Managing Dotfiles

Below is a modified version of [jaagr](https://github.com/jaagr/dots)'s writeup.

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
