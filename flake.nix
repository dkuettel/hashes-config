{
  description = "nixos systems";

  inputs = {
    nixpkgs.url = "github:dkuettel/nixpkgs/stable";
    flake-utils.url = "github:numtide/flake-utils";
    nvim.url = "github:dkuettel/hashes-dep/main";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
      nvim,
    }:
    flake-utils.lib.eachDefaultSystem (system: {
      packages.default = nvim.packages.${system}.default;
    });
}
