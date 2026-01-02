#!/bin/zsh

for f in $ZSH_CUSTOM/plugins/aliases/functions/*.zsh; do source $f; done ;

alias dc='docker compose'
alias rezsh='source ~/.zshrc'

alias h="history"

alias ll="ls -altr"

hr() {
  echo "------------------------------------------------------------"
}

mkcd() {
  mkdir -p $1
  cd $1
}

aptupgrade() {
  sudo apt update
  sudo apt upgrade
}

openssl_cert_debug() {
  domain=$1
  if [ -z "$domain" ]; then
    echo "Usage: openssl_cert_debug <domain>"
    return 1
  fi
  openssl s_client -connect $domain:443 -showcerts -servername $domain </dev/null 2>/dev/null | openssl x509 -text -noout
}