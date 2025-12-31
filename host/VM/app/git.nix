{ pkgs, username, ... }:
{
  programs.git = {
    enable = true;

    settings = {
      user = {
        name = "liyaFPV";
        email = "lbkmzc942@gmail.com";
      };
    };
  };
}