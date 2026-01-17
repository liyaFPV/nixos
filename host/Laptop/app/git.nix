{ config, pkgs, ... }:

let
  home-manager = fetchTarball {
    url = "https://github.com/nix-community/home-manager/archive/release-25.11.tar.gz";
  };
in
{
  imports = [
    (import "${home-manager}/nixos")
  ];

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;

  home-manager.users.yourUserName = {
    programs.git = {
      enable = true;
      userName  = "LiyaFPV";
      userEmail = "lbkmzc942@gmail.com";
    };
  };
}
