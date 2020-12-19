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

    pkgs.fzf
    pkgs.fasd
    pkgs.ripgrep
    pkgs.bat
    pkgs.fd
    pkgs.nixfmt
  ];

  programs.fish = {
    enable = true;
    plugins = [{
      name = "fasd";
      src = pkgs.fetchFromGitHub {
        owner = "oh-my-fish";
        repo = "plugin-fasd";
        rev = "38a5b6b6011106092009549e52249c6d6f501fba";
        sha256 = "06v37hqy5yrv5a6ssd1p3cjd9y3hnp19d3ab7dag56fs1qmgyhbs";
      };
    }];
  };
}
