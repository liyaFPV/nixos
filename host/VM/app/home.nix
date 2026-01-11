{ config, pkgs, lib, ... }:

{
  fonts.fonts = with pkgs; [
    nerd-fonts.fira-code       # FiraCode Nerd Font
  ];

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  services.greetd.enable = true;
  services.xserver.enable = false;

  programs.hyprland.enable = true;
  programs.hyprlock.enable = true;
  services.openssh.enable = true;
}
