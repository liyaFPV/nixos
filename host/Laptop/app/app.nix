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
	pkgs.rofi
	pkgs.telegram-desktop
	pkgs.htop
	pkgs.neofetch
	pkgs.flatpak
	pkgs.qbittorrent-enhanced
	pkgs.vlc
	pkgs.chromium
	pkgs.boxes
	pkgs.orca-slicer
	pkgs.libreoffice-qt6
	pkgs.filezilla
	pkgs.arduino-ide
	pkgs.python311
	pkgs.kdePackages.kdenlive
	pkgs.wget
	pkgs.curl
	pkgs.hyprpicker
	pkgs.pulseaudio
	pkgs.xp-pen-g430-driver
	pkgs.cava
	pkgs.cmatrix
    pkgs.peaclock
	pkgs.usbutils
	pkgs.libinput
	pkgs.adwaita-icon-theme
	pkgs.vscode
 ];
} 
