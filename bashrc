# ~/.bashrc

# Variables
export LANG=en_GB.UTF-8
export EDITOR="vim"
export HISTCONTROL="ignoredups:ignoreboth"
export HISTFILESIZE="5000"
export PROMPT_COMMAND="history -a"

# Prompt
export PS1='\[\033[01;32m\]\u\[\033[01;34m\]::\[\033[01;31m\]\h \[\033[00;34m\]{ \[\033[01;34m\]\w \[\033[00;34m\]}\[\033[01;32m\]`__git_ps1` -> \[\033[00m\]'

# Bash aliases
alias ..='cd ..'
alias ...='cd ../../'
alias ax="chmod a+x"
alias cp='cp -iv'
alias dev="eval $(ssh-agent) ; ssh-add ~/.ssh/id_rsa"
alias ff='find . -type f -iname'
alias more="less"
alias ll="ls -lh"
alias ls="ls --color -hF"
alias lh='ls -lisAd .[^.]*'
alias hs='history|grep -i '
alias less="less -R --tabs=4"
alias mocp="mocp -T moca_theme"
alias mv="mv -i"
alias psf="ps aux | grep -v grep | grep $1"
alias rm='rm -Iv'
alias rms='shred -uz'
alias rs='rsync -avz --progress --delete-after'
alias tgz='tar -xvfz'
alias tbz='tar -jxvf'
alias zxf='tar -zxf'
alias unrar='rar e'

# Utils
md5check() { md5sum "$1" | grep "$2";}

# Snippets to convert from DOS (CRLF) <-> UNIX (LF)
dos2unix() { awk "{ sub(\"\r\$\", \"\"); print }" $1 > $2; }
unix2dos() { awk "sub(\"\$\", \"\r\")" $1 > $2; }

alias genpasswd="strings /dev/urandom | grep -o '[[:alnum:]]' | head -n 30 | tr -d '\n'; echo"
alias meminfo='free -m -l -t'
alias volume="amixer get Master | sed '1,4 d' | cut -d [ -f 2 | cut -d ] -f 1"
alias listen="lsof -P -i -n"
alias port='netstat -tulanp'

extract() {
    if [ -f $1 ] ; then
      case $1 in
        *.tar.bz2)   tar -xjf $1     ;;
        *.tar.gz)    tar -xzf $1     ;;
        *.bz2)       bunzip2 $1     ;;
        *.rar)       unrar e $1     ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar -xf $1      ;;
        *.tbz2)      tar -xjf $1     ;;
        *.tgz)       tar -xzf $1     ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1        ;;
        *)     echo "'$1' cannot be extracted via extract()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}


# Kubernetes aliases
# From https://ahmet.im/blog/kubectl-aliases/
alias k='kubectl'
alias kg='kubectl get'
alias kgpo='kubectl get pods'
alias kgpoj='kubectl get pods -o=json'
alias kgpon='kubectl get pods --namespace'
alias ksysgpooyamll='kubectl --namespace=kube-system get pods -o=yaml -l'
alias krm='kubectl delete'
alias krmf='kubectl delete -f'
alias krming='kubectl delete ingress'
alias krmingl='kubectl delete ingress -l'
alias krmingall='kubectl delete ingress --all-namespaces'


# Docker aliases
# Get latest container ID
alias dl="docker ps -l -q"

# Get container process
alias dps="docker ps"

# Get process included stop container
alias dpa="docker ps -a"

# Get images
alias di="docker images"

# Get container IP
alias dip="docker inspect --format '{{ .NetworkSettings.IPAddress }}'"

# Run deamonized container, e.g., $dkd base /bin/echo hello
alias dkd="docker run -d -P"

# Run interactive container, e.g., $dki base /bin/bash
alias dki="docker run -i -t -P"

# Execute interactive container, e.g., $dex base /bin/bash
alias dex="docker exec -i -t"

# Stop all containers
dstop() { docker stop $(docker ps -a -q); }

# Remove all containers
drm() { docker rm $(docker ps -a -q); }

# Stop and Remove all containers
alias drmf='docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)'

# Remove all images
dri() { docker rmi $(docker images -q); }

# Dockerfile build, e.g., $dbu tcnksm/test
dbu() { docker build -t=$1 .; }

# Show all alias related docker
dalias() { alias | grep 'docker' | sed "s/^\([^=]*\)=\(.*\)/\1 => \2/"| sed "s/['|\']//g" | sort; }

# Bash into running container
dbash() { docker exec -it $(docker ps -aqf "name=$1") bash; }

# Set shell options
shopt -s histappend
shopt -s autocd
shopt -s cdable_vars
shopt -s cdspell
shopt -s checkwinsize
shopt -s cmdhist
shopt -s dotglob
shopt -s expand_aliases
shopt -s extglob
shopt -s hostcomplete
shopt -s nocaseglob

set show-all-if-ambiguous on


# Autocompleters
source ~/.bash_git-completion
source ~/.bash_git
complete -C 'aws_completer' aws

# Kubernetes kubectl autocompleter
source <(kubectl completion bash)

# Terraform autocompleter
_terraform()
{
   local cmds cur colonprefixes
   cmds="apply console destroy env fmt get graph import init \
      output plan providers push refresh show state taint \
      untaint validate version state workspace"

   COMPREPLY=()
   cur=${COMP_WORDS[COMP_CWORD]}
   colonprefixes=${cur%"${cur##*:}"}
   COMPREPLY=( $(compgen -W '$cmds'  -- $cur))
   local i=${#COMPREPLY[*]}
   while [ $((--i)) -ge 0 ]; do
      COMPREPLY[$i]=${COMPREPLY[$i]#"$colonprefixes"}
   done

        return 0
} &&

complete -F _terraform terraform

# Serverless autocompleter
_serverless()
{
   local cmds cur colonprefixes
   cmds="config create deploy info install invoque logs metrics \
      package plugin print remove rollback slstats emit run"

   COMPREPLY=()
   cur=${COMP_WORDS[COMP_CWORD]}
   colonprefixes=${cur%"${cur##*:}"}
   COMPREPLY=( $(compgen -W '$cmds'  -- $cur))
   local i=${#COMPREPLY[*]}
   while [ $((--i)) -ge 0 ]; do
      COMPREPLY[$i]=${COMPREPLY[$i]#"$colonprefixes"}
   done

        return 0
} &&

complete -F _serverless serverless

# Chef autocompleter
_chef()
{
   local cmds cur colonprefixes
   cmds="exec env gem generate shell-init install update \
      push push-archive show-policy diff provision export \
      clean-policy-revisions clean-policy-cookbooks \
      delete-policy-group delete-policy undelete verify"

   COMPREPLY=()
   cur=${COMP_WORDS[COMP_CWORD]}
   colonprefixes=${cur%"${cur##*:}"}
   COMPREPLY=( $(compgen -W '$cmds'  -- $cur))
   local i=${#COMPREPLY[*]}
   while [ $((--i)) -ge 0 ]; do
      COMPREPLY[$i]=${COMPREPLY[$i]#"$colonprefixes"}
   done

        return 0
} &&

complete -F _chef chef

# Chef - knife autocompleter
_knife()
{
   local cmds cur colonprefixes
   cmds="opc bootstrap client configure cookbook 'data bag' \
      decrypt encrypt environment exec help index job node \
      null osc_user delete deps diff download edit list show upload xargs \
      raw 'recipe list' rehash role search serve spork ssh ssl status \
      supermarket tag user vault windows winrmwsman"

   COMPREPLY=()
   cur=${COMP_WORDS[COMP_CWORD]}
   colonprefixes=${cur%"${cur##*:}"}
   COMPREPLY=( $(compgen -W '$cmds'  -- $cur))
   local i=${#COMPREPLY[*]}
   while [ $((--i)) -ge 0 ]; do
      COMPREPLY[$i]=${COMPREPLY[$i]#"$colonprefixes"}
   done

        return 0
} &&

complete -F _knife knife
