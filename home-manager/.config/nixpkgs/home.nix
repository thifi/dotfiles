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
  ];
}
