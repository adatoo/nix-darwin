{
    description = "Nix for macOS configuration";

    # This is the standard format for flake.nix. `inputs` are the dependencies of the flake,
    # Each item in `inputs` will be passed as a parameter to the `outputs` function after being pulled and built.
    inputs = {
        nixpkgs-darwin.url = "github:nixos/nixpkgs/nixpkgs-24.11-darwin";
        darwin = {
            url = "github:lnl7/nix-darwin";
            inputs.nixpkgs.follows = "nixpkgs-darwin";
        };
        home-manager = {
            url = "github:nix-community/home-manager/release-24.11";
            inputs.nixpkgs.follows = "nixpkgs-darwin";
        };
    };

    # The `outputs` function will return all the build results of the flake.
    # A flake can have many use cases and different types of outputs,
    # parameters in `outputs` are defined in `inputs` and can be referenced by their names.
    # However, `self` is an exception, this special parameter points to the `outputs` itself (self-reference)
    # The `@` syntax here is used to alias the attribute set of the inputs's parameter, making it convenient to use inside the function.
    outputs = inputs @ {
        self,
        nixpkgs,
        darwin,
        ...
    }: let
    # TODO replace with your own username, system and hostname
    user_id = 501;
    user_name = "adatoo";
    user_fullname = "Arif Datoo";
    system = "aarch64-darwin"; # aarch64-darwin or x86_64-darwin
    hostname = "arifs-macbook";

    specialArgs =
        inputs
        // {
            inherit hostname user_id user_name user_fullname;
        };
    in {
        darwinConfigurations."${hostname}" = darwin.lib.darwinSystem {
            inherit system specialArgs;
            modules = [
                ./modules/nix-core.nix
                ./modules/system.nix
                ./modules/apps.nix
                ./modules/host-users.nix
            ];
        };
    # nix code formatter
    formatter.${system} = nixpkgs.legacyPackages.${system}.alejandra;
    };
}