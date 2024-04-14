{ config, pkgs, lib, ... }:
with lib;
let
  python-debug = pkgs.python3.withPackages (p: with p; [ debugpy ]);
in
{
    programs.neovim = {
        package = pkgs.neovim;
    enable = true;
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;

    extraConfig = ''
            let g:python_debug_home = "${python-debug}"
        :luafile ~/.config/nvim/lua/init.lua
      '';
    };

}
