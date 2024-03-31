{ config, lib, pkgs, ... }:

let
  vimsettings = import ./vim.nix; # not used
  packages = import ./packages.nix;
  fenix = import (fetchTarball "https://github.com/nix-community/fenix/archive/main.tar.gz") {};

  inherit (lib) mkIf;
  inherit (pkgs.stdenv) isLinux isDarwin;

in {
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "qiang";
  home.homeDirectory = "/home/qiang";

  home.sessionVariables = { EDITOR = "vim"; };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.11";

  nixpkgs.config.allowUnfree = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.packages = packages pkgs fenix true;
  services.swayidle = {
    enable = true;
    systemdTarget = "";
    timeouts = [
          { timeout = 6; command = "${pkgs.swaylock}/bin/swaylock -fF"; }
          { timeout = 9; command = "${pkgs.systemd}/bin/systemctl suspend"; }
        ];
    events = [
    { event = "lock"; command = "lock"; }
    { event = "before-sleep"; command = "${pkgs.swaylock}/bin/swaylock -fF"; }

     ];

  };
  services.kanshi = {
    enable = true;
    # systemdTarget = "hyprland-session.target";
    systemdTarget = "";
    profiles = {
      home2 = {
        outputs = [
          {
            criteria = "eDP-1";
            status = "disable";
          }
          {
            criteria = "DP-7";
            status = "enable";
            position = "0,0";
          }
          {
            criteria = "DP-8";
            status = "enable";
            position = "2560,0";
          }
        ];
      };
      home3 = {
        outputs = [
          {
            criteria = "eDP-1";
            status = "enable";
            position = "0,0";
          }
          {
            criteria = "DP-7";
            status = "enable";
            position = "1920,0";
          }
          {
            criteria = "DP-8";
            status = "enable";
            position = "4480,0";
          }
        ];
      };
      office3r = {
        outputs = [
          {
            criteria = "eDP-1";
            status = "disable";
            position = "0,0";
          }
          {
            criteria = "DP-5";
            status = "enable";
            position = "1440,615";
          }
          {
            criteria = "DP-6";
            status = "enable";
            position = "4000,615";
          }
          {
            criteria = "DP-7";
            status = "enable";
            position = "0,0";
            transform = "90";
          }
        ];
      };
    };
  };

  programs.vscode = {
    enable = true;
    package = pkgs.vscode;
    # to use cpptools, which has pre-compiled binaries
    # it breaks rust-analyzer
    # alternatively close all vscode and open the fhs one from shell
    # ussing: nix-shell -p vscode-fhs
    # package = pkgs.vscode.fhs;
  };


  # programs.neovim = vimsettings pkgs;
  programs.zsh = {
    enable = true;
    dotDir = ".config/zsh_nix";
    enableAutosuggestions = true;
    syntaxHighlighting = {
      enable = true;
    };
    # chang cursor shape depending on vi mode
    # initExtra = ''
    #   source ${pkgs.zsh-vi-mode}/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh
    # '';
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "vi-mode" "autojump" "fzf" "kubectl" "direnv" "docker" "copyfile" ];
      theme = "robbyrussell";
      # theme = "trapd00r";
    };
    # history.size = 12000;
    # history.expireDuplicateFirst = true;
    history = {
      size = 12000;
      expireDuplicatesFirst = true;
    };
    shellAliases = {
      k = "kubectl";
      kg = "kubectl get po";
      kd = "kubectl delete pod";
      kdp = "kubectl describe pod";
      kl = "kubectl logs -f";
      kll = "kubectl logs -f -l=";
      kdev = "kubectl config use-context smk-dev";
      kmn = "kubectl config use-context minikube";
      kstg =
        "kubectl config use-context arn:aws:eks:eu-west-1:928238300371:cluster/Staging-Master";
      kci =
        "kubectl config use-context arn:aws:eks:eu-west-1:928238300371:cluster/CI-Master";
      kprod =
        "kubectl config use-context arn:aws:eks:eu-west-1:928238300371:cluster/Production-Master";
      guc = "git log origin/master..HEAD";
      gpo = "git rev-parse --abbrev-ref HEAD | xargs git push origin -f";
      kt = "kubetail";
      cb = "cargo build";
      ct = "cargo test";
      cr = "cargo run";
      jll = "jl -format=logfmt";
      chrome = "google-chrome-stable --profile-directory=\"Profile 1\"";
      brave = "brave --profile-directory=\"Profile 1\"";
      vpnon = "~/vpnon.sh";
      vpnoff = "~/vpnoff.sh";
    };
  };
  # programs.git = {
  #   enable = true;
  #   # userName = "qiang";
  #   # core.editor = "vim";
  # };

  xdg.enable = true;

  xsession = {
    enable = true;
    windowManager.i3 = rec {
      enable = true;
      package = pkgs.i3; # i3-gaps
      config = {
        modifier = "Mod4";
        # bars = [ ];
        gaps = {
          inner = 12;
          outer = 5;
          smartGaps = true;
          smartBorders = "off";
        };

        startup = [
          { command = "exec --no-startup-id redshift";} # start redshift
          { command = "exec --no-startup-id dropbox start";} # start dropbox
          { command = "exec --no-startup-id clipit";}
          # { command = "exec setxkbmap -option ctrl:nocaps"; }
        ]
        ;
        assigns = {
          # "1: web" = [{ class = "^Firefox$"; }];
        };

        keybindings = import ./i3-keybindings.nix config.modifier;
      };
      extraConfig = ''
          floating_minimum_size 75 x 50
          floating_maximum_size -1 x -1
      '';
    };
  };


  # fzf still not working after sourcing in zshrc
  # for nix-zsh, this is not the default zshrc that defined earlier in this file
  home.file.".zshrc" = {
    source = ./dotfile/zshrc;
  };
  home.file.".tmux.conf" = {
    source = ./dotfile/tmux/tmux.conf;
  };
  home.file.".tmux.conf.local" = {
    source = ./dotfile/tmux/tmux.conf.local;
  };

  # home.file.".config/git/config" = {
  #   source = ./dotfile/git_config;
  # };
  home.file.".vimrc" = { source = ./dotfile/vimrc; };

  home.file.".config/i3status/config" = {
    source = ./dotfile/i3status_config;
  };
  home.file.".config/rofi/config.rasi".text = ''
    configuration {
     modi: "window,drun,ssh,combi";
     font: "hack 26";
     combi-modi: "window,drun,ssh";
    }
    @theme "solarized"
  '';
  # dpi settings for sway
  home.file.".Xresources".text = ''
    Xft.dpi: 145
  '';
  home.file.".config/sway/config" = {
    source = ./dotfile/sway_config;
  };
  home.file.".config/alacritty.toml" = {
    source = ./dotfile/alacritty.toml;
  };
  home.file.".config/dunst/dunstrc" = {
    source = ./dotfile/dunstrc;
  };

  home.file.".vim/autoload/plug.vim" = { source = ./dotfile/plug.vim; };
  home.file.".aws/config" = {
    source = ./dotfile/aws_config;
  };
  home.file.".aws/credentials" = {
    source = ./dotfile/aws_credentials;
  };
  home.file.".config/redshift.conf" = {
    source = ./dotfile/redshift.conf;
  };
  # use apple SF fonts
  xdg.dataFile."fonts/" = {
    source = ./dotfile/apple_fonts;
  };

  programs.direnv.enable = true;

}
