{ config, pkgs, lib, ... }:

{
  fonts.fonts = with pkgs; [
    nerd-fonts.fira-code       # FiraCode Nerd Font
    # nerd-fonts.jetbrains-mono # можно раскомментировать, если нужно
    # nerd-fonts.zed-mono       # можно добавить ещё один
  ];
  environment.systemPackages = [
    pkgs.gdm
    pkgs.xwayland-satellite
    pkgs.xdg-desktop-portal-gnome
    pkgs.xdg-desktop-portal-gtk
    pkgs.gnome-keyring
  ];

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };
  programs.niri.enable = true;
  services.openssh.enable = true;
}
