{ config, pkgs, ... }:

{
  # Let Home Manger do its thing
  programs.home-manager.enable = true;

  # This is pretty self explanatory I think
  home.username = "pram";
  home.homeDirectory = "/home/pram";

  # Keep this the same as system version I think??
  home.stateVersion = "24.11";

  # User packages
  home.packages = with pkgs; [
    gh # GitHub CLI
    lazygit
    # Override example
    # What's an override? Well I think it's for installing only a part of a package (e.g. a single font from a collection)
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # Script example
    # Adds a command to run a script using this stuff
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Dot File Configuration
  home.file = {
    # Copies directory to nixstore, then symlinks - File needs to be "git add"-ed to copy to nixstore
    ".config/nvim" = {
      source = ../dotfiles/nvim;
      recursive = true;
      # onChange = builtins.readFile ./nvim.sh
    };

    # Set text in file
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Environment Variables
  # If using a terminal not installed through Home Manager, source "hm-session-vars.sh"
  # stored at one of these locations:
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  #  /etc/profiles/per-user/pram/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "nvim";
  };

  programs = {
    git = {
      enable = true;
    };

    neovim.plugins = [
      pkgs.vimPlugins.nvim-tree-lua { plugin = pkgs.vimPlugins.vim-startify; }
    ];
  };
}
