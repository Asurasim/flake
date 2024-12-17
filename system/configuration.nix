{ config, lib, pkgs, ... }:

{

  system.stateVersion = "24.11"; # Did you read the comment?

  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # GRUB, will change to systemd-boot when actually installing on my shiz
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";

  networking.hostName = "nixos-vm"; # PC name

  # Network "driver" (more like a control thingy for it (there was 2 of these but i deleted it cus fuck mid cli tools))
  # networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # What does the clock say
  # time.timeZone = "Europe/Amsterdam";

  # CUPS printing (this is off for VM testing - will eventually be on when installed on actual hardware)
  # services.printing.enable = true;

  # Audio
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput.enable = true;

  # User accounts
  # Don't forget to set a password with ‘passwd’.
  users.users.pram = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      tree
    ];
    initialPassword = "25565";
  };

  # All packages
  environment.systemPackages = with pkgs; [
    wget
  #  neovim
    kitty
  ];

  # SSH
  services.openssh.enable = true;

  # There is BY DEFAULT a firewall on NixOS, this is perfectly fine, however I will probably still need to port forward or some shit so here it is
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  programs = {
    hyprland = {
      enable = true;
      xwayland.enable = true;
    };

    neovim = {
      enable = true;
      defaultEditor = true;
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
    qemuGuest.enable = true;
  };
}

