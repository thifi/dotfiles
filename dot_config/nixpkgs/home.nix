{ config, pkgs, lib, ... }:

{
  nixpkgs.config.allowUnfree = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.username = "itayg";
  home.homeDirectory = "/home/itayg";
  home.stateVersion = "21.05";

  home.sessionVariables = { EDITOR = "vim"; };
  home.sessionPath =
    [ "/home/itayg/go/bin" "/home/itayg/scripts" "/usr/share/code" ];

  home.packages = with pkgs; [

    # GUI
    arandr
    emacs
    meld

    # Cloud
    awscli
    google-cloud-sdk

    # Languages
    #
    # NOTE: pkgs.node is annoying.
    #       npm install -g doesn't work well.
    #
    cmake
    dhall
    dhall-json
    dhall-lsp-server
    go
    rustup
    yarn

    # CLI
    autorandr
    bat
    broot
    ccrypt
    fasd
    fd
    gawk
    htop
    jq
    p7zip
    ripgrep
    tmux
    vim
    xclip

    # Nix
    nix-prefetch-github
    nix-tree
    nixfmt
  ];

  programs.fish = {
    enable = true;

    # Auto-exec tmux when launching fish
    # shellInit = "if test $TERM != \"screen-256color\"; exec tmux; end;";

    plugins = [
      {
        name = "bass";
        src = pkgs.fetchFromGitHub {
          owner = "edc";
          repo = "bass";
          rev = "df4a1ebf8c0536e4bd7b7828a4c0dcb2b7b5d22b";
          sha256 = "1dgydrza6lvx3dl9spkla1g728x5rr76mqrwk2afrl732439y6jl";
        };
      }
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
        name = "fish_logo";
        src = pkgs.fetchFromGitHub {
          owner = "laughedelic";
          repo = "fish_logo";
          rev = "dc6a40836de8c24c62ad7c4365aa9f21292c3e6e";
          sha256 = "09lvjjwajiysd5y4wvl3iq3md4bzi5f69kwb4xdvgr6s8yvx158d";
        };
      }
      {
        name = "plugin-foreign-env";
        src = pkgs.fetchFromGitHub {
          owner = "oh-my-fish";
          repo = "plugin-foreign-env";
          rev = "dddd9213272a0ab848d474d0cbde12ad034e65bc";
          sha256 = "00xqlyl3lffc5l0viin1nyp819wf81fncqyz87jx8ljjdhilmgbs";
        };
      }
      {
        name = "aws";
        src = pkgs.fetchFromGitHub {
          owner = "oh-my-fish";
          repo = "plugin-aws";
          rev = "25fa5c44f988dd46e77f9cdebbe4074ce77e97d4";
          sha256 = "03yqrb1l7wmp5hzig9klf9gsdg8ncrky0bkvynzy8jxy9yvhpg7j";
        };
      }
      {
        name = "bang-bang";
        src = pkgs.fetchFromGitHub {
          owner = "oh-my-fish";
          repo = "plugin-bang-bang";
          rev = "d45ae216969fa5c3eac0b6248119e8a1da56fe89";
          sha256 = "0jpcs8fpw9a69ai6mwhgikw77j03fhnixcl21yx1b5p65333pddc";
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

    shellAliases = {
      bd = "bg && disown";
      ip = "~/scripts/color-ip";
      oip = "/usr/sbin/ip";
      at = "alacritty-themes";
      cm = "chezmoi";
    };

    functions = {
      fish_greeting = "fish_logo";
      gitignore = "curl -sL https://www.gitignore.io/api/$argv";

      # broot fish wrapper
      # https://github.com/Canop/broot/issues/31
      br = ''
        set f (mktemp)
        broot --outcmd $f $argv
        if test $status -ne 0
            rm -f "$f"
            return "$code"
        end
        set d (cat "$f")
        rm -f "$f"
        eval "$d"
      '';
    };
  };

  xdg.configFile."fish/conf.d/plugin-theme-robbyrussell.fish".text =
    lib.mkAfter ''
      for f in $plugin_dir/*.fish
        source $f
      end
    '';

  programs.git = {
    enable = true;
    userName = "Itay Garin";
    userEmail = "thifixp@gmail.com";
    delta.enable = true;
    aliases = {
      b = "branch";
      ci = "commit";
      co = "checkout";
      d = "diff";
      di = "diff";
      dt = "difftool";
      l = "log";
      s = "status";
      st = "status";
    };
  };

  programs.fzf = {
    enable = true;
    enableFishIntegration = true;
  };
}
