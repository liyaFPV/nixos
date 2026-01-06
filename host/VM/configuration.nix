{config, pkgs, ...}:

{
    imports = [
        ./hardware-configuration.nix
        ./app/app.nix
    ];
    #boot
    boot.loader.grub.enable = true;
    boot.loader.grub.devices = "/dev/vda";
    boot.loader.grub.useOSProber = true;

    #networking
    networking.hostName = "nixos";
    # networking.wireless.enable = true;
    networking.networkmanager.enable = true;
    networking.firewall.enable = false;
    networking.firewall.allowedTCPPorts = [];
    networking.firewall.allowedUDPPorts = [];

    services.openssh = {
        enable = true;
        ports = [ 22 ];
        settings = {
            PasswordAuthentication = true;
            AllowUsers = null;
            PermitRootLogin = "yes";
        };
   };

    #language and locale
    time.timeZone = "Asia/Yekaterinburg";

    i18n.defaultLocale = "en_US.UTF-8";
    i18n.extraLocaleSettings = {
        LC_ADDRESS = "ru_RU.UTF-8";
        LC_IDENTIFICATION = "ru_RU.UTF-8";
        LC_MEASUREMENT = "ru_RU.UTF-8";
        LC_MONETARY = "ru_RU.UTF-8";
        LC_NAME = "ru_RU.UTF-8";
        LC_NUMERIC = "ru_RU.UTF-8";
        LC_PAPER = "ru_RU.UTF-8";
        LC_TELEPHONE = "ru_RU.UTF-8";
        LC_TIME = "ru_RU.UTF-8";
    };
    #input
    services.xserver.xkb = {
        layout = "us";
        variant = "";
    };
    #users
    users.users.liyavr = {
        isNormalUser = true;
        description = "liyavr";
        extraGroups = [ "wheel" "networkmanager"];
    };

    #packages
    system.stateVersion = "25.11";
}