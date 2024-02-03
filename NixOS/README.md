# NixOS configuration

My NixOS configuration using Nix flakes

## Rebuild system

- from `<repo>/NixOS`:

```bash
user@host:~$ sudo nixos-rebuild switch --flake .#nixos-test
```

- from outside:

```bash
user@host:~$ sudo nixos-rebuild switch
```

## Helpful resources

A big thanks to Ryan Yin for these really helpful resources:

- [NixOS & Flakes Book](https://nixos-and-flakes.thiscute.world/)

- [NixOS Configuration example](https://github.com/ryan4yin/nix-config/tree/i3-kickstarter)