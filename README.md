# Nix Files

### Found a cool guide to reload on a fresh machine
To install from installer iso:

1. Make the partitions / label them
2. Mount them
3. Run these commands

```
$ sudo git clone https://github.com/Asurasim/flake.git
$ cd flake
$ sudo nixos-install --flake .#home --root /mnt
$ sudo reboot
```
