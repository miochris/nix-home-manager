pkgs: withGUI:
with pkgs;
[
  alacritty
  zip
  unzip
  nixfmt
  tmux
  tmuxPlugins.resurrect
  zsh
  oh-my-zsh
  autojump
  vim
  neovim
  vimPlugins.vim-plug
  google-chrome
  vscode

  acpilight # xbacklight
  redshift # color temperature

  rofi

  kubectl
  docker
  awscli2

  # these files are meant to be installed in all scenarios
  bat
  binutils
  bottom
  cabal-install
  cargo
  cmake

  dbus
  direnv
  exa
  fd
  git
  gitAndTools.hub
  ghc
  glances
  gnupg # gpg command
  gnumake
  hicolor-icon-theme # lutris
  htop

  manix
  nix-index
  nix-template
  nix-update
  perl # for fzf history
  python3
  ranger
  rnix-lsp
  rustc
  # stack broken

  tig
  tree
  watson
  wget

  # vim plugin dependencies
  fzf
  ripgrep
  elmPackages.elm-format

  # so neovim can copy to clipboard
  xclip

  # apps
  calibre
  dropbox-cli

] ++ pkgs.lib.optionals pkgs.stdenv.isLinux [
  # dotnet
  (with dotnetCorePackages; combinePackages [ sdk_3_1 sdk_5_0 ])

  mono
  niv
  ntfs3g
  usbutils

] ++ pkgs.lib.optionals withGUI [
  # intended to be installed with an X11 or wayland session
  brightnessctl
  enlightenment.terminology
  firefox
  (dwarf-fortress-packages.dwarf-fortress-full.override {
    dfVersion = "0.47.04";
    theme = dwarf-fortress-packages.themes.phoebus;
    enableIntro = false;
    enableFPS = true;
  })
  pavucontrol # pulseaudio configuration
  lutris
  nerdfonts
  obs-studio
  vlc

]

