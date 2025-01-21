inputs@{
  options,
  config,
  lib,
  pkgs,
  namespace,
  ...
}:
with lib;
with lib.${namespace};
let
  cfg = config.${namespace}.cli-apps.neovim;
in
{
  options.${namespace}.cli-apps.neovim = with types; {
    enable = mkBoolOpt false "Whether or not to enable neovim.";
  };

  config = mkIf cfg.enable {
    programs.neovim = {
      enable = true;
    };

    environment.variables = {
      EDITOR = "nvim";
    };
  };
}
