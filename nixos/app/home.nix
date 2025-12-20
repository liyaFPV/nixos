{ config, pkgs, lib, ... }:

{
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  services.xserver.enable = false;

  services.getty.autologinUser = "liyavr";

  programs.hyprland.enable = true;
  programs.hyprlock.enable = true;
  programs.hypridle.enable = true;
}
