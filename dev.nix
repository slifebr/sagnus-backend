{ pkgs, ... }: {
  channel = "stable-23.11";
  packages = [
    pkgs.jdk21
    pkgs.zip
    pkgs.unzip
    pkgs.maven
  ];
  env = {};
  services = {};
}