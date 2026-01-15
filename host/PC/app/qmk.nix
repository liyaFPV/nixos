{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    vial
    qmk
    qmk-udev-rules
  ];

  services.udev.packages = with pkgs; [
    vial
    qmk-udev-rules
  ];
}