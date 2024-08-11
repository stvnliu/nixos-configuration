# Print an optspec for argparse to handle cmd's options that are independent of any subcommand.
function __fish_nh_global_optspecs
	string join \n v/verbose h/help V/version
end

function __fish_nh_needs_command
	# Figure out if the current invocation already has a command.
	set -l cmd (commandline -opc)
	set -e cmd[1]
	argparse -s (__fish_nh_global_optspecs) -- $cmd 2>/dev/null
	or return
	if set -q argv[1]
		# Also print the command, so this can be used to figure out what it is.
		echo $argv[1]
		return 1
	end
	return 0
end

function __fish_nh_using_subcommand
	set -l cmd (__fish_nh_needs_command)
	test -z "$cmd"
	and return 1
	contains -- $cmd[1] $argv
end

complete -c nh -n "__fish_nh_needs_command" -s v -l verbose -d 'Show debug logs'
complete -c nh -n "__fish_nh_needs_command" -s h -l help -d 'Print help'
complete -c nh -n "__fish_nh_needs_command" -s V -l version -d 'Print version'
complete -c nh -n "__fish_nh_needs_command" -f -a "os" -d 'NixOS functionality'
complete -c nh -n "__fish_nh_needs_command" -f -a "home" -d 'Home-manager functionality'
complete -c nh -n "__fish_nh_needs_command" -f -a "search" -d 'Searches packages by querying search.nixos.org'
complete -c nh -n "__fish_nh_needs_command" -f -a "clean" -d 'Enhanced nix cleanup'
complete -c nh -n "__fish_nh_needs_command" -f -a "completions" -d 'Generate shell completion files into stdout'
complete -c nh -n "__fish_nh_using_subcommand os; and not __fish_seen_subcommand_from switch boot test build info" -s v -l verbose -d 'Show debug logs'
complete -c nh -n "__fish_nh_using_subcommand os; and not __fish_seen_subcommand_from switch boot test build info" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c nh -n "__fish_nh_using_subcommand os; and not __fish_seen_subcommand_from switch boot test build info" -f -a "switch" -d 'Build and activate the new configuration, and make it the boot default'
complete -c nh -n "__fish_nh_using_subcommand os; and not __fish_seen_subcommand_from switch boot test build info" -f -a "boot" -d 'Build the new configuration and make it the boot default'
complete -c nh -n "__fish_nh_using_subcommand os; and not __fish_seen_subcommand_from switch boot test build info" -f -a "test" -d 'Build and activate the new configuration'
complete -c nh -n "__fish_nh_using_subcommand os; and not __fish_seen_subcommand_from switch boot test build info" -f -a "build" -d 'Build the new configuration'
complete -c nh -n "__fish_nh_using_subcommand os; and not __fish_seen_subcommand_from switch boot test build info" -f -a "info" -d 'Show an overview of the system\'s info'
complete -c nh -n "__fish_nh_using_subcommand os; and __fish_seen_subcommand_from switch" -s D -l diff-provider -d 'Closure diff provider' -r
complete -c nh -n "__fish_nh_using_subcommand os; and __fish_seen_subcommand_from switch" -s H -l hostname -d 'Output to choose from the flakeref. Hostname is used by default' -r
complete -c nh -n "__fish_nh_using_subcommand os; and __fish_seen_subcommand_from switch" -s s -l specialisation -d 'Name of the specialisation' -r
complete -c nh -n "__fish_nh_using_subcommand os; and __fish_seen_subcommand_from switch" -s n -l dry -d 'Only print actions, without performing them'
complete -c nh -n "__fish_nh_using_subcommand os; and __fish_seen_subcommand_from switch" -s a -l ask -d 'Ask for confirmation'
complete -c nh -n "__fish_nh_using_subcommand os; and __fish_seen_subcommand_from switch" -s u -l update -d 'Update flake inputs before building specified configuration'
complete -c nh -n "__fish_nh_using_subcommand os; and __fish_seen_subcommand_from switch" -l no-nom -d 'Don\'t use nix-output-monitor for the build process'
complete -c nh -n "__fish_nh_using_subcommand os; and __fish_seen_subcommand_from switch" -s S -l no-specialisation -d 'Don\'t use specialisations'
complete -c nh -n "__fish_nh_using_subcommand os; and __fish_seen_subcommand_from switch" -s v -l verbose -d 'Show debug logs'
complete -c nh -n "__fish_nh_using_subcommand os; and __fish_seen_subcommand_from switch" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c nh -n "__fish_nh_using_subcommand os; and __fish_seen_subcommand_from boot" -s D -l diff-provider -d 'Closure diff provider' -r
complete -c nh -n "__fish_nh_using_subcommand os; and __fish_seen_subcommand_from boot" -s H -l hostname -d 'Output to choose from the flakeref. Hostname is used by default' -r
complete -c nh -n "__fish_nh_using_subcommand os; and __fish_seen_subcommand_from boot" -s s -l specialisation -d 'Name of the specialisation' -r
complete -c nh -n "__fish_nh_using_subcommand os; and __fish_seen_subcommand_from boot" -s n -l dry -d 'Only print actions, without performing them'
complete -c nh -n "__fish_nh_using_subcommand os; and __fish_seen_subcommand_from boot" -s a -l ask -d 'Ask for confirmation'
complete -c nh -n "__fish_nh_using_subcommand os; and __fish_seen_subcommand_from boot" -s u -l update -d 'Update flake inputs before building specified configuration'
complete -c nh -n "__fish_nh_using_subcommand os; and __fish_seen_subcommand_from boot" -l no-nom -d 'Don\'t use nix-output-monitor for the build process'
complete -c nh -n "__fish_nh_using_subcommand os; and __fish_seen_subcommand_from boot" -s S -l no-specialisation -d 'Don\'t use specialisations'
complete -c nh -n "__fish_nh_using_subcommand os; and __fish_seen_subcommand_from boot" -s v -l verbose -d 'Show debug logs'
complete -c nh -n "__fish_nh_using_subcommand os; and __fish_seen_subcommand_from boot" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c nh -n "__fish_nh_using_subcommand os; and __fish_seen_subcommand_from test" -s D -l diff-provider -d 'Closure diff provider' -r
complete -c nh -n "__fish_nh_using_subcommand os; and __fish_seen_subcommand_from test" -s H -l hostname -d 'Output to choose from the flakeref. Hostname is used by default' -r
complete -c nh -n "__fish_nh_using_subcommand os; and __fish_seen_subcommand_from test" -s s -l specialisation -d 'Name of the specialisation' -r
complete -c nh -n "__fish_nh_using_subcommand os; and __fish_seen_subcommand_from test" -s n -l dry -d 'Only print actions, without performing them'
complete -c nh -n "__fish_nh_using_subcommand os; and __fish_seen_subcommand_from test" -s a -l ask -d 'Ask for confirmation'
complete -c nh -n "__fish_nh_using_subcommand os; and __fish_seen_subcommand_from test" -s u -l update -d 'Update flake inputs before building specified configuration'
complete -c nh -n "__fish_nh_using_subcommand os; and __fish_seen_subcommand_from test" -l no-nom -d 'Don\'t use nix-output-monitor for the build process'
complete -c nh -n "__fish_nh_using_subcommand os; and __fish_seen_subcommand_from test" -s S -l no-specialisation -d 'Don\'t use specialisations'
complete -c nh -n "__fish_nh_using_subcommand os; and __fish_seen_subcommand_from test" -s v -l verbose -d 'Show debug logs'
complete -c nh -n "__fish_nh_using_subcommand os; and __fish_seen_subcommand_from test" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c nh -n "__fish_nh_using_subcommand os; and __fish_seen_subcommand_from build" -s D -l diff-provider -d 'Closure diff provider' -r
complete -c nh -n "__fish_nh_using_subcommand os; and __fish_seen_subcommand_from build" -s H -l hostname -d 'Output to choose from the flakeref. Hostname is used by default' -r
complete -c nh -n "__fish_nh_using_subcommand os; and __fish_seen_subcommand_from build" -s s -l specialisation -d 'Name of the specialisation' -r
complete -c nh -n "__fish_nh_using_subcommand os; and __fish_seen_subcommand_from build" -s n -l dry -d 'Only print actions, without performing them'
complete -c nh -n "__fish_nh_using_subcommand os; and __fish_seen_subcommand_from build" -s a -l ask -d 'Ask for confirmation'
complete -c nh -n "__fish_nh_using_subcommand os; and __fish_seen_subcommand_from build" -s u -l update -d 'Update flake inputs before building specified configuration'
complete -c nh -n "__fish_nh_using_subcommand os; and __fish_seen_subcommand_from build" -l no-nom -d 'Don\'t use nix-output-monitor for the build process'
complete -c nh -n "__fish_nh_using_subcommand os; and __fish_seen_subcommand_from build" -s S -l no-specialisation -d 'Don\'t use specialisations'
complete -c nh -n "__fish_nh_using_subcommand os; and __fish_seen_subcommand_from build" -s v -l verbose -d 'Show debug logs'
complete -c nh -n "__fish_nh_using_subcommand os; and __fish_seen_subcommand_from build" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c nh -n "__fish_nh_using_subcommand os; and __fish_seen_subcommand_from info" -s v -l verbose -d 'Show debug logs'
complete -c nh -n "__fish_nh_using_subcommand os; and __fish_seen_subcommand_from info" -s h -l help -d 'Print help'
complete -c nh -n "__fish_nh_using_subcommand home; and not __fish_seen_subcommand_from switch build info" -s v -l verbose -d 'Show debug logs'
complete -c nh -n "__fish_nh_using_subcommand home; and not __fish_seen_subcommand_from switch build info" -s h -l help -d 'Print help'
complete -c nh -n "__fish_nh_using_subcommand home; and not __fish_seen_subcommand_from switch build info" -f -a "switch" -d 'Build and activate a home-manager configuration'
complete -c nh -n "__fish_nh_using_subcommand home; and not __fish_seen_subcommand_from switch build info" -f -a "build" -d 'Build a home-manager configuration'
complete -c nh -n "__fish_nh_using_subcommand home; and not __fish_seen_subcommand_from switch build info" -f -a "info" -d 'Show an overview of the installation'
complete -c nh -n "__fish_nh_using_subcommand home; and __fish_seen_subcommand_from switch" -s D -l diff-provider -d 'Closure diff provider' -r
complete -c nh -n "__fish_nh_using_subcommand home; and __fish_seen_subcommand_from switch" -s c -l configuration -d 'Name of the flake homeConfigurations attribute, like username@hostname' -r
complete -c nh -n "__fish_nh_using_subcommand home; and __fish_seen_subcommand_from switch" -s b -l backup-extension -d 'Move existing files by backing up with the extension' -r
complete -c nh -n "__fish_nh_using_subcommand home; and __fish_seen_subcommand_from switch" -s n -l dry -d 'Only print actions, without performing them'
complete -c nh -n "__fish_nh_using_subcommand home; and __fish_seen_subcommand_from switch" -s a -l ask -d 'Ask for confirmation'
complete -c nh -n "__fish_nh_using_subcommand home; and __fish_seen_subcommand_from switch" -s u -l update -d 'Update flake inputs before building specified configuration'
complete -c nh -n "__fish_nh_using_subcommand home; and __fish_seen_subcommand_from switch" -l no-nom -d 'Don\'t use nix-output-monitor for the build process'
complete -c nh -n "__fish_nh_using_subcommand home; and __fish_seen_subcommand_from switch" -s v -l verbose -d 'Show debug logs'
complete -c nh -n "__fish_nh_using_subcommand home; and __fish_seen_subcommand_from switch" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c nh -n "__fish_nh_using_subcommand home; and __fish_seen_subcommand_from build" -s D -l diff-provider -d 'Closure diff provider' -r
complete -c nh -n "__fish_nh_using_subcommand home; and __fish_seen_subcommand_from build" -s c -l configuration -d 'Name of the flake homeConfigurations attribute, like username@hostname' -r
complete -c nh -n "__fish_nh_using_subcommand home; and __fish_seen_subcommand_from build" -s b -l backup-extension -d 'Move existing files by backing up with the extension' -r
complete -c nh -n "__fish_nh_using_subcommand home; and __fish_seen_subcommand_from build" -s n -l dry -d 'Only print actions, without performing them'
complete -c nh -n "__fish_nh_using_subcommand home; and __fish_seen_subcommand_from build" -s a -l ask -d 'Ask for confirmation'
complete -c nh -n "__fish_nh_using_subcommand home; and __fish_seen_subcommand_from build" -s u -l update -d 'Update flake inputs before building specified configuration'
complete -c nh -n "__fish_nh_using_subcommand home; and __fish_seen_subcommand_from build" -l no-nom -d 'Don\'t use nix-output-monitor for the build process'
complete -c nh -n "__fish_nh_using_subcommand home; and __fish_seen_subcommand_from build" -s v -l verbose -d 'Show debug logs'
complete -c nh -n "__fish_nh_using_subcommand home; and __fish_seen_subcommand_from build" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c nh -n "__fish_nh_using_subcommand home; and __fish_seen_subcommand_from info" -s v -l verbose -d 'Show debug logs'
complete -c nh -n "__fish_nh_using_subcommand home; and __fish_seen_subcommand_from info" -s h -l help -d 'Print help'
complete -c nh -n "__fish_nh_using_subcommand search" -s l -l limit -d 'Number of search results to display' -r
complete -c nh -n "__fish_nh_using_subcommand search" -s c -l channel -d 'Name of the channel to query (e.g nixos-23.11, nixos-unstable)' -r
complete -c nh -n "__fish_nh_using_subcommand search" -s f -l flake -d 'Flake to read what nixpkgs channels to search for' -r -f -a "(__fish_complete_directories)"
complete -c nh -n "__fish_nh_using_subcommand search" -s v -l verbose -d 'Show debug logs'
complete -c nh -n "__fish_nh_using_subcommand search" -s h -l help -d 'Print help'
complete -c nh -n "__fish_nh_using_subcommand clean; and not __fish_seen_subcommand_from all user profile" -s v -l verbose -d 'Show debug logs'
complete -c nh -n "__fish_nh_using_subcommand clean; and not __fish_seen_subcommand_from all user profile" -s h -l help -d 'Print help'
complete -c nh -n "__fish_nh_using_subcommand clean; and not __fish_seen_subcommand_from all user profile" -f -a "all" -d 'Cleans root profiles and calls a store gc'
complete -c nh -n "__fish_nh_using_subcommand clean; and not __fish_seen_subcommand_from all user profile" -f -a "user" -d 'Cleans the current user\'s profiles and calls a store gc'
complete -c nh -n "__fish_nh_using_subcommand clean; and not __fish_seen_subcommand_from all user profile" -f -a "profile" -d 'Cleans a specific profile'
complete -c nh -n "__fish_nh_using_subcommand clean; and __fish_seen_subcommand_from all" -s k -l keep -d 'At least keep this number of generations' -r
complete -c nh -n "__fish_nh_using_subcommand clean; and __fish_seen_subcommand_from all" -s K -l keep-since -d 'At least keep gcroots and generations in this time range since now' -r
complete -c nh -n "__fish_nh_using_subcommand clean; and __fish_seen_subcommand_from all" -s n -l dry -d 'Only print actions, without performing them'
complete -c nh -n "__fish_nh_using_subcommand clean; and __fish_seen_subcommand_from all" -s a -l ask -d 'Ask for confimation'
complete -c nh -n "__fish_nh_using_subcommand clean; and __fish_seen_subcommand_from all" -l nogc -d 'Don\'t run nix store --gc'
complete -c nh -n "__fish_nh_using_subcommand clean; and __fish_seen_subcommand_from all" -l nogcroots -d 'Don\'t clean gcroots'
complete -c nh -n "__fish_nh_using_subcommand clean; and __fish_seen_subcommand_from all" -s v -l verbose -d 'Show debug logs'
complete -c nh -n "__fish_nh_using_subcommand clean; and __fish_seen_subcommand_from all" -s h -l help -d 'Print help'
complete -c nh -n "__fish_nh_using_subcommand clean; and __fish_seen_subcommand_from user" -s k -l keep -d 'At least keep this number of generations' -r
complete -c nh -n "__fish_nh_using_subcommand clean; and __fish_seen_subcommand_from user" -s K -l keep-since -d 'At least keep gcroots and generations in this time range since now' -r
complete -c nh -n "__fish_nh_using_subcommand clean; and __fish_seen_subcommand_from user" -s n -l dry -d 'Only print actions, without performing them'
complete -c nh -n "__fish_nh_using_subcommand clean; and __fish_seen_subcommand_from user" -s a -l ask -d 'Ask for confimation'
complete -c nh -n "__fish_nh_using_subcommand clean; and __fish_seen_subcommand_from user" -l nogc -d 'Don\'t run nix store --gc'
complete -c nh -n "__fish_nh_using_subcommand clean; and __fish_seen_subcommand_from user" -l nogcroots -d 'Don\'t clean gcroots'
complete -c nh -n "__fish_nh_using_subcommand clean; and __fish_seen_subcommand_from user" -s v -l verbose -d 'Show debug logs'
complete -c nh -n "__fish_nh_using_subcommand clean; and __fish_seen_subcommand_from user" -s h -l help -d 'Print help'
complete -c nh -n "__fish_nh_using_subcommand clean; and __fish_seen_subcommand_from profile" -s k -l keep -d 'At least keep this number of generations' -r
complete -c nh -n "__fish_nh_using_subcommand clean; and __fish_seen_subcommand_from profile" -s K -l keep-since -d 'At least keep gcroots and generations in this time range since now' -r
complete -c nh -n "__fish_nh_using_subcommand clean; and __fish_seen_subcommand_from profile" -s n -l dry -d 'Only print actions, without performing them'
complete -c nh -n "__fish_nh_using_subcommand clean; and __fish_seen_subcommand_from profile" -s a -l ask -d 'Ask for confimation'
complete -c nh -n "__fish_nh_using_subcommand clean; and __fish_seen_subcommand_from profile" -l nogc -d 'Don\'t run nix store --gc'
complete -c nh -n "__fish_nh_using_subcommand clean; and __fish_seen_subcommand_from profile" -l nogcroots -d 'Don\'t clean gcroots'
complete -c nh -n "__fish_nh_using_subcommand clean; and __fish_seen_subcommand_from profile" -s v -l verbose -d 'Show debug logs'
complete -c nh -n "__fish_nh_using_subcommand clean; and __fish_seen_subcommand_from profile" -s h -l help -d 'Print help'
complete -c nh -n "__fish_nh_using_subcommand completions" -s s -l shell -d 'Name of the shell' -r -f -a "{bash\t'',elvish\t'',fish\t'',powershell\t'',zsh\t''}"
complete -c nh -n "__fish_nh_using_subcommand completions" -s v -l verbose -d 'Show debug logs'
complete -c nh -n "__fish_nh_using_subcommand completions" -s h -l help -d 'Print help'
