
{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./app/app.nix
    ];
  # Bootloader.
  boot.loader.grub.enable = true;
  #boot.loader.grub.device = "/dev/vda";
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  networking.hostName = "liyavr"; # Define your hostname.
  #networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Yekaterinburg";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # Configure keymap in X11
  services.xserver = {
    enable = true;
    layout = "us,ru";        # Английская и русская раскладки
    xkbOptions = "grp:ctrl_shift_toggle";  # Переключение ctrl+Shift
  };


  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.liyavr = {
    isNormalUser = true;
    description = "LiyaVR";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #  wget
  ];
  nixpkgs.config.allowUnfree = true;
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [22];
  networking.firewall.allowedUDPPorts = [22];
  # Or disable the firewall altogether.
  networking.firewall.enable = false;


  system.stateVersion = "25.05"; # Did you read the comment?

  nix.settings.substituters = [
  "https://cache.nixos.org/"
  "https://nix-community.cachix.org"
  ];
  nix.settings.trusted-public-keys = [
    "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
    "nix-community.cachix.org-1:7C/oKkq1bA4np3Uu1CZ8sS5u1d5rHjVE7U2rA8m+E6s="
  ];

  nix.gc = {
  automatic = true;                 # включает автоматическую очистку
  dates = "weekly";                 # как часто (можно daily, weekly, monthly)
  options = "--delete-older-than 60d";  # удалить поколения старше 30 дней
  };
}
