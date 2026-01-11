{ config, pkgs, lib, ... }:

{
  fonts.fonts = with pkgs; [
    nerd-fonts.fira-code       # FiraCode Nerd Font
    # nerd-fonts.jetbrains-mono # можно раскомментировать, если нужно
    # nerd-fonts.zed-mono       # можно добавить ещё один
  ];

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  services.greetd.enable = true;
  services.greetd.settings.default_session = {
    command = "hyprland";
    user = "liyavr";
  };

  services.xserver.enable = false;
  services.getty.autologinUser = "liyavr";

  programs.hyprland.enable = true;
  programs.hyprlock.enable = true;
  services.openssh.enable = true;
}
