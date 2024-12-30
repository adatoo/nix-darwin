
{ hostname, user_id, user_name, user_fullname, pkgs, ... }:

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
        knownUsers = [ user_name ];
        users."${user_name}" = {
            home = "/Users/${user_name}";
            description = user_fullname;
            uid = user_id;
            shell = pkgs.fish;
        };
    };

    nix.settings.trusted-users = [ user_name ];
}