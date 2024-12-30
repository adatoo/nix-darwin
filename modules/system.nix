{ pkgs, ... }:

  ###################################################################################
  #
  #  macOS's System configuration
  #
  #  All the configuration options are documented here:
  #    https://daiderd.com/nix-darwin/manual/index.html#sec-options
  #
  ###################################################################################
{
    system = {
        stateVersion = 5;
        # activationScripts are executed every time you boot the system or run `nixos-rebuild` / `darwin-rebuild`.
        activationScripts.postUserActivation.text = ''
            # activateSettings -u will reload the settings from the database and apply them to the current session,
            # so we do not need to logout and login again to make the changes take effect.
            /System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
        '';

        defaults = {
            SoftwareUpdate.AutomaticallyInstallMacOSUpdates = true;  # automatically install macOS updates
            menuExtraClock.Show24Hour = true;  # show 24 hour clock

            # customize dock
            dock = {
                autohide = false;
                show-recents = false;  # disable recent apps
                wvous-tr-corner = 10;  # top right corner - put display to sleep
                persistent-apps = [
                    "/System/Applications/Launchpad.app"
                    "/System/Cryptexes/App/System/Applications/Safari.app"
                    "/Applications/Google Chrome.app"
                    "/Applications/Raindrop.io.app"
                    "/System/Applications/Preview.app"
                    "/System/Applications/Mail.app"
                    "/System/Applications/Calendar.app"
                    "/System/Applications/Messages.app"
                    "/Applications/Craft.app"
                    "/System/Applications/Notes.app"
                    "/Applications/draw.io.app"
                    "/System/Applications/Reminders.app"
                    "/Applications/Mindnode.app"
                    "/Applications/Visual Studio Code.app"
                    "/Applications/Fork.app"
                    "/Applications/Kaleidoscope.app"
                    "/Applications/Postgres.app"
                    "/System/Applications/Utilities/Terminal.app"
                    "/Applications/Xcode.app"
                    "/Applications/Playgrounds.app"
                    "/Applications/SF Symbols.app"
                ];
            };

            # customize finder
            finder = {
                AppleShowAllExtensions = true;  # show all file extensions
                AppleShowAllFiles = true;  # show hidden files
                NewWindowTarget = "Home";  # set default folder to home
                FXPreferredViewStyle = "clmv";  # set default view style to column view
                FXEnableExtensionChangeWarning = false;  # disable warning when changing file extension
                _FXSortFoldersFirst = true;  # sort folders first
                _FXSortFoldersFirstOnDesktop = true;  # sort folders first on desktop
                _FXShowPosixPathInTitle = false;  # show full path in finder title
                ShowPathbar = true;  # show path bar
                ShowStatusBar = true;  # show status bar
                QuitMenuItem = false;  # enable quit menu item
            };
    
            # customize trackpad
            trackpad = {
                Clicking = true;  # enable tap to click
                TrackpadRightClick = true;  # enable two finger right click
                TrackpadThreeFingerDrag = true;  # enable three finger drag
            };

            CustomUserPreferences = {
                NSGlobalDomain = {
                    # Add a context menu item for showing the Web Inspector in web views
                    WebKitDeveloperExtras = true;
                };
                "com.apple.finder" = {
                    ShowExternalHardDrivesOnDesktop = true;
                    ShowHardDrivesOnDesktop = false;
                    ShowMountedServersOnDesktop = true;
                    ShowRemovableMediaOnDesktop = true;
                    _FXSortFoldersFirst = true;
                    # When performing a search, search the current folder by default
                    FXDefaultSearchScope = "SCcf";
                };
                "com.apple.desktopservices" = {
                    # Avoid creating .DS_Store files on network or USB volumes
                    DSDontWriteNetworkStores = true;
                    DSDontWriteUSBStores = true;
                };
                # "com.apple.Safari" = {
                #     # Privacy: don’t send search queries to Apple
                #     UniversalSearchEnabled = false;
                #     SuppressSearchSuggestions = true;
                #     # Press Tab to highlight each item on a web page
                #     WebKitTabToLinksPreferenceKey = true;
                #     ShowFullURLInSmartSearchField = true;
                #     # Prevent Safari from opening ‘safe’ files automatically after downloading
                #     AutoOpenSafeDownloads = false;
                #     ShowFavoritesBar = false;
                #     IncludeInternalDebugMenu = true;
                #     IncludeDevelopMenu = true;
                #     WebKitDeveloperExtrasEnabledPreferenceKey = true;
                #     WebContinuousSpellCheckingEnabled = true;
                #     WebAutomaticSpellingCorrectionEnabled = false;
                #     AutoFillFromAddressBook = false;
                #     AutoFillCreditCardData = false;
                #     AutoFillMiscellaneousForms = false;
                #     WarnAboutFraudulentWebsites = true;
                #     WebKitJavaEnabled = false;
                #     WebKitJavaScriptCanOpenWindowsAutomatically = false;
                #     "com.apple.Safari.ContentPageGroupIdentifier.WebKit2TabsToLinks" = true;
                #     "com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled" = true;
                #     "com.apple.Safari.ContentPageGroupIdentifier.WebKit2BackspaceKeyNavigationEnabled" = false;
                #     "com.apple.Safari.ContentPageGroupIdentifier.WebKit2JavaEnabled" = false;
                #     "com.apple.Safari.ContentPageGroupIdentifier.WebKit2JavaEnabledForLocalFiles" = false;
                #     "com.apple.Safari.ContentPageGroupIdentifier.WebKit2JavaScriptCanOpenWindowsAutomatically" = false;
                # };
                # "com.apple.mail" = {
                #     # Disable inline attachments (just show the icons)
                #     DisableInlineAttachmentViewing = true;
                # };
                "com.apple.SoftwareUpdate" = {
                    AutomaticCheckEnabled = true;
                    # Check for software updates daily, not just once per week
                    ScheduleFrequency = 1;
                    # Download newly available updates in background
                    AutomaticDownload = 1;
                    # Install System data files & security updates
                    CriticalUpdateInstall = 1;
                };
            };

            loginwindow = {
                GuestEnabled = false;  # disable guest user
                SHOWFULLNAME = false;  # show full name in login window
            };
        };
    };

    # Add ability to used TouchID for sudo authentication
    security.pam.enableSudoTouchIdAuth = true;

    # Create /etc/zshrc that loads the nix-darwin environment.
    # this is required if you want to use darwin's default shell - zsh
    programs.zsh.enable = true;
    programs.fish.enable = true;

    # Set your time zone.
    time.timeZone = "Europe/London";
}