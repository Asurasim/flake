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

    # xorg.xlsclients  # Check if a window is running x11
    # gh # GitHub CLI

    lazygit # Terminal git ui - this is the best form of git I have ever used
    appimage-run  # Required to run appimages
    p7zip # 7-zip

  ];

  home.file = {

    ".config/nvim" = {  # File path starting at home directory
      source = ./nvim; # Navigates through my "nix" project folder
      recursive = true; # Required to copy a folder
    };
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Change configs for individual software
  programs = {

    bash = {
      enable = true;
    };

    yazi = {
      enable = true;
    };

    kitty = {
      enable = true;
    };

    firefox = {
      enable = true;
    };

    git = {
      enable = true;
    };

    neovim = {
      enable = true; # Must be enabled for plugins to load
      plugins = with pkgs.vimPlugins; [
        nvim-tree-lua   # File manager within nvim
        toggleterm-nvim # Open a terminal withing nvim
        vimwiki         # Adds useful stuff for reading/writing notes
        vim-sleuth      # Auto-adjusts the tab amount based on the current working file
      ];
    };
  };
}
