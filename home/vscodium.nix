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

      # --- React / React Native ---
      dsznajder.es7-react-js-snippets
      christian-kohler.path-intellisense

      # --- Angular ---
      angular.ng-template

      # --- Laravel / PHP ---
      bmewburn.vscode-intelephense-client
      onecentlin.laravel-blade
      ryannaddy.laravel-artisan

      # --- C# / .NET ---
      ms-dotnettools.csharp
      ms-dotnettools.csdevkit

      # --- Git / Misc ---
      eamodio.gitlens
      yzhang.markdown-all-in-one
      vscodevim.vim
    ];
  };
}
