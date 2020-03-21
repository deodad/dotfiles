alias g=git
alias v=vim
alias vi=vim
alias ls=exa
alias k=kubectl
alias kb=kubebox
alias copy='xclip -sel clip'
alias ng='ngrok http 3978 -hostname=askhr-tony.ngrok.io -bind-tls=true'
alias sha='gnome-screenshot -a'
alias atom='ELECTRON_TRASH=trash-cli atom'

rmd () {
  pandoc $1 | lynx -stdin
}


