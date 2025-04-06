{ consts, ... }:
{
  # sops configuration
  sops.defaultSopsFile = "../secrets/secrets.yaml";
  sops.defaultSopsFormat = "yaml";
  sops.age.keyFile = "/home/${consts.user.name}/.config/sops/age/keys.txt";
}