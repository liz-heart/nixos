{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;

    extensions = with pkgs.vscode-extensions; [
      # --- Core / Formatting ---
      esbenp.prettier-vscode
      dbaeumer.vscode-eslint
      editorconfig.editorconfig

      # --- Docker ---
      ms-azuretools.vscode-docker

      # --- Angular ---
      angular.ng-template

      # --- Laravel / PHP (packaged only) ---
      bmewburn.vscode-intelephense-client

      # --- C# / .NET ---
      ms-dotnettools.csharp
      ms-dotnettools.csdevkit

      # --- Git / Misc ---
      eamodio.gitlens
      yzhang.markdown-all-in-one
      vscodevim.vim
      christian-kohler.path-intellisense
    ];
  };
}
