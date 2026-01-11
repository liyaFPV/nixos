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
	pkgs.kdePackages.dolphin
	pkgs.firefox
	pkgs.waybar
	pkgs.rofi
	pkgs.telegram-desktop
	pkgs.htop
	pkgs.neofetch
	pkgs.hyprpaper
	pkgs.flatpak
	pkgs.qbittorrent-enhanced
	pkgs.vlc
	pkgs.chromium
	pkgs.boxes
	pkgs.orca-slicer
	pkgs.libreoffice-qt6
	pkgs.filezilla
	pkgs.arduino-ide
	#pkgs.python314
	pkgs.kdePackages.kdenlive
	pkgs.wget
	pkgs.curl
	pkgs.nerd-fonts.zed-mono
    pkgs.hyprlock
	pkgs.hyprpicker
	pkgs.pulseaudio
	pkgs.xp-pen-g430-driver
	pkgs.neofetch
	pkgs.cava
	pkgs.cmatrix
    pkgs.peaclock
	pkgs.usbutils
	pkgs.libinput
	pkgs.adwaita-icon-theme
	pkgs.kdePackages.plasma-desktop
 ];
} 
