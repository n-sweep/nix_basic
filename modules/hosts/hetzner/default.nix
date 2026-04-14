{ self, inputs, ... }:
let
  username = "n";
  hostname = "yor-zarad";
  # addr = "${username}@${hostname}";
  system = "x86_64-linux";
  systemStateVersion = "24.11";
in {
  flake.nixosConfigurations.${hostname} = inputs.nixpkgs.lib.nixosSystem {
    inherit system;
    specialArgs = { inherit hostname username; };
    modules = with self.modules.nixos; [
      inputs.disko.nixosModules.disko

      base
      disko-base
      openssh
      tmux
      users

      {
        hardware.facter.reportPath = ./facter.json;
        system.stateVersion = systemStateVersion;
      }

    ];
  };

  # flake.homeConfigurations."${addr}"= inputs.home-manager.lib.homeManagerConfiguration {
  #   pkgs = inputs.nixpkgs.legacyPackages.${system};
  #
  #   # strip out `self` to avoid infinite recursion
  #   extraSpecialArgs = { inputs = builtins.removeAttrs inputs [ "self" ]; };
  #
  #   modules = with self.modules.homeManager; [
  #
  #     {
  #       home.username = username;
  #       home.homeDirectory = "/home/${username}";
  #     }
  #
  #     base
  #     workstation
  #
  #   ];
  # };

}
