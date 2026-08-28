let
  username = "mimir";
in {
  inherit username;
  flakePath = "/home/${username}/.config/nixos";
}
