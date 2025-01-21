{
  lib,
  pkgs,
  namespace,
  ...
}:
with lib;
with lib.${namespace};
{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  roulette = {
    cli-apps = {
      neovim = enabled;
    };
  };

  system.stateVersion = "24.11";
}
