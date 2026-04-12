{
  flake.modules.nixos.base = { ... }: {

    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    time.timeZone = "America/New_York";
    i18n.defaultLocale = "en_US.UTF-8";

    networking.hostName = "yor-zarad";
    networking.useDHCP = true;

    security.sudo.wheelNeedsPassword = false;

    system.stateVersion = "24.11";

  };
}
