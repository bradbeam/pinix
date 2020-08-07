{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    #coredns-ads
    vim
    raspberrypi-tools
  ];
}
