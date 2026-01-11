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
	pkgs.htop
	pkgs.neofetch
	pkgs.hyprpaper
	pkgs.flatpak
	pkgs.chromium
	pkgs.libreoffice-qt6
	pkgs.filezilla
	pkgs.wget
	pkgs.curl
	pkgs.nerd-fonts.zed-mono
    pkgs.hyprlock
	pkgs.hyprpicker
	pkgs.pulseaudio
	pkgs.neofetch
	pkgs.cava
	pkgs.cmatrix
	pkgs.peaclock
	pkgs.usbutils
	pkgs.libinput
	pkgs.adwaita-icon-theme
	pkgs.vscode
 ];
} 
