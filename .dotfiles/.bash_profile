parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

print_git_branch() {
  [ "$(parse_git_branch)" != "" ] && echo "$(parse_git_branch) " || echo ""
}

export PS1="\[\033[;00m\]┌── [\d \t] \[\e[32m\]\h@ubuntu\e[0m: \[\033[38;5;6m\]\w \[\e[91m\]\$(print_git_branch)\[\e[00m\]\n\[\033[;00m\]└─\$\[\033[0m\] "
