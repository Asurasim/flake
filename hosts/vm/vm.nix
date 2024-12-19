{ config, lib, pkgs, ... }:

{

  imports =
    [
      ../../modules/nixos/configuration.nix
    ];

  # mkForce allows modifying default values
  services = {

    # It's unlikely that I'll be printing from a vm
    printing.enable = lib.mkForce false;

    # Disable flatpak (Since vm isn't using a wm)
    flatpak = {
      enable = lib.mkForce false;
    };

    # Virtual Machine settings
    qemuGuest.enable = true; # This will need disabled when installed in an actual system
  };
}
