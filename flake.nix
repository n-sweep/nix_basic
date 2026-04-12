{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    flake-parts.url = "github:hercules-ci/flake-parts";
    import-tree.url = "github:vic/import-tree";
    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs: inputs.flake-parts.lib.mkFlake
    { inherit inputs; }
    {
      imports = [
        inputs.flake-parts.flakeModules.modules
        (inputs.import-tree ./modules)
      ];
    };
}
