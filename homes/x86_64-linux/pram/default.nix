{
  lib,
  pkgs,
  config,
  osConfig ? { },
  format  ? "unknown",
  namespace,
  ...
}:
with lib.${namespace};
{
  roulette = {
    user = {
      enable = true;
      name = "pram";
    };
    cli-apps = {
      neovim = enabled;
    };
  }; 
}
