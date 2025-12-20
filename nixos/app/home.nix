{config, pkgs, lib, ...}:

{
  nix.gc = {
  automatic = true;                 # включает автоматическую очистку
  dates = "weekly";                 # как часто (можно daily, weekly, monthly)
  options = "--delete-older-than 30d";  # удалить поколения старше 30 дней
  };
 services.xserver={
  enable=true;
   displayManager.gdm={
   enable=true;
   wayland=true;
  };
 };
 programs.hyprland.enable = true;
}