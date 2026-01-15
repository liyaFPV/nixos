{ config, pkgs, ... }:

{
  imports = [
    <home-manager/nixos>
  ];

  home-manager.users.yourname = {
    home.stateVersion = "25.11";

    programs.git = {
      enable = true;
      settings.user = {
        name  = "LiyaFPV";
        email = "lbkmzc942@gmail.com";
      };
    };
  };
}
