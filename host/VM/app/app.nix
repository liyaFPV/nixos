{config, pkgs, ...}:

{
	imports =
    [
      ./home.nix
      ./zsh.nix
	  ./git.nix
    ];

  environment.systemPackages = [
	pkgs.kitty
	pkgs.kdePackages.dolphin
	pkgs.firefox
	pkgs.waybar
	pkgs.rofi-wayland
	pkgs.htop
	pkgs.neofetch
	pkgs.hyprpaper
	pkgs.flatpak
	pkgs.chromium
	pkgs.libreoffice-qt6
	pkgs.filezilla
	pkgs.python314
	pkgs.wget
	pkgs.curl
	pkgs.nerd-fonts.zed-mono
    pkgs.hyprlock
	pkgs.hyprpicker
	pkgs.pulseaudio
 ];
} 
