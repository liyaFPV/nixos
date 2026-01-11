{ config, pkgs, lib, ... }:

{
  fonts.fonts = with pkgs; [
    fira-code-nerd-font
  ];
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };
  services.greetd = {
  enable = true;

  settings.default_session = {
    command = "hyprland";
    user = "liyavr";
  };
  };

  services.xserver.enable = false;

  services.getty.autologinUser = "liyavr";

  programs.hyprland.enable = true;
  programs.hyprlock.enable = true;
  services.openssh.enable = true;
}
