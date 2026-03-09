{config, pkgs, ...}:

{
    imports =
    [
      ./home.nix
      ./zsh.nix
      ./git.nix
    ];

  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = [
	pkgs.kitty
	pkgs.nautilus
	pkgs.firefox
	pkgs.waybar
	pkgs.rofi
	pkgs.htop
	pkgs.python311
	pkgs.wget
	pkgs.curl
	pkgs.pulseaudio
	pkgs.neofetch
	pkgs.cava
	pkgs.cmatrix
    pkgs.peaclock
	pkgs.usbutils
	pkgs.libinput
	pkgs.adwaita-icon-theme
 ];
} 
