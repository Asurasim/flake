{ lib, ... }:

with lib;
rec {
  # I don't know what I'm doing yet, I'm just copying off of another persons flakes
  mkOpt =
    type: default: description:
    mkOption { inherit type default description; };

  mkOpt' = type: default: mkOpt type default null;

  mkBoolOpt = mkOpt types.bool;

  mkBoolOpt' = mkOpt' types.bool;

  # Quickly enable option
  enabled = {
    enable = true;
  };

  # Quickly disable
  disabled = {
    enable = false;
  };
}
