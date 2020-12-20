{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.username = "itayg";
  home.homeDirectory = "/home/itayg";
  home.stateVersion = "21.03";

  home.packages = [
    pkgs.meld
    pkgs.vim
    pkgs.emacs
    pkgs.google-chrome
    pkgs.alacritty
    pkgs.qbittorrent
    pkgs.keepass

    pkgs.awscli
    pkgs.google-cloud-sdk

    pkgs.fasd
    pkgs.ripgrep
    pkgs.bat
    pkgs.fd
    pkgs.jq
    pkgs.htop

    pkgs.nixfmt
    pkgs.nix-prefetch-github
  ];

  programs.fish = {
    enable = true;
    plugins = [
      {
        name = "fasd";
        src = pkgs.fetchFromGitHub {
          owner = "oh-my-fish";
          repo = "plugin-fasd";
          rev = "38a5b6b6011106092009549e52249c6d6f501fba";
          sha256 = "06v37hqy5yrv5a6ssd1p3cjd9y3hnp19d3ab7dag56fs1qmgyhbs";
        };
      }
      {
        name = "theme-robbyrussell";
        src = pkgs.fetchFromGitHub {
          owner = "oh-my-fish";
          repo = "theme-robbyrussell";
          rev = "28ed90189feb5a4177ce64d6be20070a84450a44";
          sha256 = "0xb0f631ydkprv3ff8yvrc0f68yqk8j7bvx7aa8za04fm5gyg05x";
        };
      }
    ];
  };

  programs.git = {
    enable = true;
    userName = "Itay Garin";
    userEmail = "thifixp@gmail.com";
    delta.enable = true;
    aliases = {
      b = "branch";
      co = "checkout";
      s = "status";
      st = "status";
      d = "diff";
      di = "diff";
      dt = "difftool";
      l = "log";
      ci = "commit";
    };
  };

  programs.fzf = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.broot = {
    enable = true;
    enableFishIntegration = true;
    verbs = [
      {
        key = "ctrl-j";
        execution = ":line_down";
      }
      {
        key = "ctrl-k";
        execution = ":line_up";
      }
    ];
  };
}
