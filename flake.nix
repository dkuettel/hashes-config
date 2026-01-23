{
  description = "nixos systems";

  inputs = {
    nixpkgs.url = "github:dkuettel/nixpkgs/stable";
    flake-utils.url = "github:numtide/flake-utils";
    dep.url = "github:dkuettel/hashes-dep/main";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
      dep,
    }:
    flake-utils.lib.eachDefaultSystem (system: {
      packages.default = dep.packages.${system}.default;
    });
}
