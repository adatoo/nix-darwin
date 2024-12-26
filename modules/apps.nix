{ pkgs, ...}: {

    ##########################################################################
    #
    #  Install all apps and packages here.
    #
    #  NOTE: Your can find all available options in:
    #    https://daiderd.com/nix-darwin/manual/index.html
    #
    # TODO Fell free to modify this file to fit your needs.
    #
    ##########################################################################

    # Install packages from nix's official package repository.
    #
    # The packages installed here are available to all users, and are reproducible across machines, and are rollbackable.
    # But on macOS, it's less stable than homebrew.
    #
    # Related Discussion: https://discourse.nixos.org/t/darwin-again/29331
    environment.systemPackages = with pkgs; [
        git
    ];

    # TODO To make this work, homebrew need to be installed manually, see https://brew.sh
    #
    # The apps installed by homebrew are not managed by nix, and not reproducible!
    # But on macOS, homebrew has a much larger selection of apps than nixpkgs, especially for GUI apps!
    homebrew = {
        enable = true;

        onActivation = {
            autoUpdate = true;
            upgrade = true;
            # 'zap': uninstalls all formulae(and related files) not listed here.
            cleanup = "zap";
        };

        masApps = {
        # TODO Feel free to add your favorite apps here.
            Xcode = 497799835;
        };

        taps = [
            "homebrew/services"
        ];

        # `brew install`
        # TODO Feel free to add your favorite apps here.
        brews = [
            # cloud and devops cli tools
            "awscli"
            "tfenv"
            "tgenv"
            # database tools
            "dbmate"
            # javascript
            "deno"
            "node"
            "yarn"
            # shell tooling
            "direnv"
            # golang
            "go"
            "go-task"
            # python
            "uv"
            # data processing
            "jq"
            "sq"
            "yq"
        ];

        # `brew install --cask`
        # TODO Feel free to add your favorite apps here.
        casks = [
            "drawio"
            "dropdmg"
            "fork"
            "google-chrome"
            "hiddenbar"
            "iina"
            "orbstack"
            "postgres-unofficial"
            "postico"
            "raindropio"
            "sf-symbols"
            "swiftformat-for-xcode"
            "viscosity"
            "visual-studio-code"
            # NOT USED
            # "whatsapp"
            # "omnigraffle"
            # "postman"
        ];
    };
}