
{ hostname, username, pkgs, ... }:

#############################################################
#
#  Host & Users configuration
#
#############################################################

{
    networking.hostName = hostname;
    networking.computerName = hostname;
    system.defaults.smb.NetBIOSName = hostname;

    users = { 
        knownUsers = [ username ];
        users."${username}" = {
            home = "/Users/${username}";
            description = username;
            uid = 501;
            shell = pkgs.fish;
        };
    };

    nix.settings.trusted-users = [ username ];
}