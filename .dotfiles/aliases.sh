alias gpu="git push -u"
alias gst="git status"
alias gam="git ls-files --modified | xargs git add"
alias gcs="git commit -S -m"
alias gas="git commit -S --amend"
alias gcm="git commit -m"
alias gco="git checkout"
alias gaf="git add"
alias gdc="git diff --cached"
alias gdf="git diff"

alias gphm="git push -u origin master"
alias gpcb='git push origin `git rev-parse --abbrev-ref HEAD`'
alias gplm="git pull origin master"

# Worded alises
alias whatsmyip="curl 'https://api.ipify.org?format=text' -w '\n'"

# Personalization Refresh
alias rpr="cat < $PERSONALIZATION_DIR/.bash_profile > ~/.bash_profile && source ~/.bash_profile"
alias tns="sudo hwclock -s"
