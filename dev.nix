{ pkgs, ... }: {
	# https://idx.dev/reference/getting-started/
	channel = "stable-23.11"; # https://nix-channels.hercules-ci.com/
	idx.previews.nixV2 = true;
	idx.previews.enable = true;
	idx.workspace.onCreate.npm-install = "npm install";
	# Use "idx" to manage extensions:
	#   idx.extensions = [
	#     "vscodevim.vim"
	#   ];
	#
	# More info on packages:
	#   https://search.nixos.org/packages
	packages = [
		pkgs.jdk21
		pkgs.maven
	];
	#
	# More info on options:
	#   https://search.nixos.org/options
	nixpkgs.config.packageOverrides = pkgs: {
		# Example of overriding a package:
		#   my-package = pkgs.my-package.overrideAttrs (oldAttrs: {
		#     # ...
		#   });
	};
}
