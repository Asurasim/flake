{
  lib,
  pkgs,
  config,
  osConfig ? { },
  format  ? "unknown",
  namespace,
  ...
}:

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
