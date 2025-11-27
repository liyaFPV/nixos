{config, pkgs, ...}:

{
	imports =
    [
      ./home.nix
      ./zsh.nix
    ];

  environment.systemPackages = [
	pkgs.kitty
	pkgs.nautilus
	pkgs.firefox
	pkgs.waybar
	pkgs.rofi-wayland
	pkgs.git
	pkgs.telegram-desktop
	pkgs.htop
	pkgs.neofetch
	pkgs.hyprpaper
	pkgs.freecad-wayland
	pkgs.blender
	pkgs.vscode
	pkgs.flatpak
	pkgs.qbittorrent-enhanced
	pkgs.vlc
	pkgs.steam
	pkgs.chromium
	pkgs.boxes
	pkgs.orca-slicer
	pkgs.libreoffice-qt6
	pkgs.filezilla
	pkgs.arduino-ide
	pkgs.obsidian
	pkgs.python314
	pkgs.gimp
	pkgs.kdePackages.kdenlive
	pkgs.wget
	pkgs.curl
	pkgs.nerd-fonts.zed-mono
    pkgs.hyprlock
	pkgs.eww
 ];
}
