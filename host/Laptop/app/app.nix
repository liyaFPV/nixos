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
	pkgs.telegram-desktop
	pkgs.htop
	pkgs.neofetch
	pkgs.hyprpaper
	pkgs.freecad-wayland
	pkgs.flatpak
	pkgs.qbittorrent-enhanced
	pkgs.vlc
	pkgs.chromium
	pkgs.orca-slicer
	pkgs.libreoffice-qt6
	pkgs.filezilla
	pkgs.arduino-ide
	pkgs.python314
	pkgs.gimp
	pkgs.kdePackages.kdenlive
	pkgs.wget
	pkgs.curl
	pkgs.nerd-fonts.zed-mono
    pkgs.hyprlock
	pkgs.hyprpicker
	pkgs.pulseaudio
	pkgs.xp-pen-g430-driver
	pkgs.neofetch
 ];
} 
