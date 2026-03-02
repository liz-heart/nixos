 {
description = "Nixos";

inputs = {
 nixpkgs.url = "nixpkgs/nixos-25.11";
 home-manager = {
  url = "github:nix-community/home-manager/release-25.11";
  inputs.nixpkgs.follows = "nixpkgs";
 };
 catppuccin = {
  url = "github:catppuccin/nix"; 
  inputs.nixpkgs.follows = "nixpkgs";
 };
 quickshell = {
  url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
  inputs.nixpkgs.follows = "nixpkgs";
 };
};

outputs = { self, nixpkgs, home-manager, catppuccin , quickshell , ... }: {
 nixosConfigurations.my-nixos = nixpkgs.lib.nixosSystem {
  system = "x86_64-linux";
  modules = [
   ./configuration.nix
   home-manager.nixosModules.home-manager {
    home-manager = {
     useGlobalPkgs = true;
     useUserPackages = true;
     extraSpecialArgs = { inherit catppuccin quickshell; };
     users.munchnix = {
      imports = [
       catppuccin.homeModules.catppuccin 
       ./home/default.nix
	 ];
	};
     backupFileExtension = "backup";
     };
    }
   ];
  };
 };
}
