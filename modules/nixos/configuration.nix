{ config, lib, pkgs, inputs, ... }:

let
  userName = "pram";
in
{

  system.stateVersion = "24.11";

  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.default
    ];

  boot.loader = {

    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  # Audio
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  networking = {
    hostName = "nixos-vm";  # PC name
    #networkmanager.enable = true;  # Wifi

    firewall = {
      enable = false;
      #allowedTCPPorts = [ ... ];
      #allowedUDPPorts = [ ... ];
    };
  };

  time.timeZone = "Europe/Amsterdam";	# What does the clock say

  # User accounts
  # Don't forget to set a password with ‘passwd’.
  users.users.${userName} = {

    initialPassword = "25565";
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
  };

  home-manager = {
    
    users = {
      ${userName} = import ../home-manager/home.nix;
    };
  };

  services = {
    displayManager = {
      sddm = {
       enable = false;
	wayland.enable = true;
      };
    };

    xserver = {
      enable = false;
      xkb = {
        layout = "us";
	options = "eurosign:e,caps:escape";
      };
    };
  };
}

