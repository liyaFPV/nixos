{ config, pkgs, lib, ... }:

{
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  services.xserver.displayManager.gdm.enable = true;
  programs.hyprland.enable = true;
  programs.hyprlock.enable = true;
  services.openssh.enable = true;
}
