{ config, inputs, ... }: {
  flake.nixosConfigurations.hetzner = inputs.nixpkgs.lib.nixosSystem {

    system = "x86_64-linux";
    modules = with config.flake.modules.nixos; [
      inputs.disko.nixosModules.disko
      disko-hetzner
      hardware-hetzner
      base
      openssh
      users
    ];

  };
}
