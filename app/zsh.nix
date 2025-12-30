{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    promptInit = ''
      source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
      [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
    '';
  };

  environment.systemPackages = with pkgs; [
    zsh-powerlevel10k
  ];

  users.users.liyavr.shell = pkgs.zsh;
}

