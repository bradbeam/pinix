{ config, pkgs, lib, ... }:
{
  imports = [
    ./users.nix
    ./network.nix
    ./pkgs.nix
    ./coredns-ads.nix
    ./coredns-ads-config.nix
  ];

  # NixOS wants to enable GRUB by default
  boot.loader.grub.enable = false;

  # if you have a Raspberry Pi 2 or 3, pick this:
  boot.kernelPackages = pkgs.linuxPackages_5_4;

  # A bunch of boot parameters needed for optimal runtime on RPi 3b+
  boot.kernelParams = ["cma=256M"];
  boot.loader.raspberryPi.enable = true;
  boot.loader.raspberryPi.version = 3;
  boot.loader.raspberryPi.uboot.enable = true;
  boot.loader.raspberryPi.firmwareConfig = ''
    gpu_mem=256
  '';

  # File systems configuration for using the installer's partition layout
  fileSystems = {
    "/" = {
      device = "/dev/disk/by-label/NIXOS_SD";
      fsType = "ext4";
    };
  };

  # Preserve space by sacrificing documentation and history
  nix.gc.automatic = true;
  nix.gc.options = "--delete-older-than 30d";
  boot.cleanTmpDir = true;

  # Configure basic SSH access
  services.openssh = {
    enable = true;
    permitRootLogin = lib.mkForce "no";
    passwordAuthentication = false;
  };

  environment.variables.EDITOR = "vim";
  time.timeZone = "UTC";

  security.sudo.wheelNeedsPassword = false;

  environment.systemPackages = with pkgs; [
    vim
    raspberrypi-tools
  ];

  hardware.bluetooth.enable = false;

  swapDevices = [ { device = "/swapfile"; size = 2048; } ];

  nixpkgs.overlays = [
    (_self: super: {
      coredns-ads =
        super.callPackage ./coredns-ads-pkg.nix { };
    })
  ];
}
