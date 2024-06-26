pkgs: fenix: withGUI:
with pkgs;
[
  # moved from nix-env
  awscli2
  bolt
  chromium
  cloc
  dolphin
  insomnia
  # libinput
  libreoffice
  ncdu
  nixpkgs-fmt
  perl
  openvpn
  tldr
  xsel
  # sway
  kanshi

  eza
  # tools for work
  postgresql
  postman
  #pritunl-client

  # basic tools
  gnome.gnome-screenshot
  ponymix

  # latex
  texmaker
  texlive.combined.scheme-full


  sublime
  clipit

  alacritty
  zip
  unzip
  nixfmt
  tmux
  tmuxPlugins.resurrect
  # zsh
  oh-my-zsh
  autojump
  vim
  neovim
  vimPlugins.vim-plug
  # google-chrome
  brave
  # code is in home.nix using code.fhs for cpptools
  # vscode
  # (vscode-with-extensions.override {
  #     vscodeExtensions = with vscode-extensions; [
  #       ms-vscode.cpptools
  #     ];
  #   })

  acpilight # xbacklight
  redshift # color temperature

  # rofi
  alsa-utils

  kubectl
  docker
  # awscli2

  # these files are meant to be installed in all scenarios
  bat
  binutils
  bottom
  cabal-install
  cmake

  dbus
  direnv
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
  python3Full
  go
  nodejs # for coc.nvim
  ranger
  # rnix-lsp
  # rust
  # fenix.complete.toolchain # nightly
  fenix.stable.toolchain
  gcc
  pkg-config
  openssl
  # cargo
  # rustc
  # rustup
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
  # calibre # can't build on 2024.04.20
  dropbox-cli
  # sway window sharing
  pipewire
  wireplumber
  xdg-desktop-portal-wlr

] ++ pkgs.lib.optionals pkgs.stdenv.isLinux [
  # dotnet
  (with dotnetCorePackages; combinePackages [ sdk_7_0 ])

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

