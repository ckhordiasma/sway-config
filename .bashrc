#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export EDITOR=vim
. "$HOME/.cargo/env"

export MOZ_USE_XINPUT2=1

source ~/.bash_aliases


# make vs code work better in wayland
export ELECTRON_OZONE_PLATFORM_HINT=wayland
export ELECTRON_ENABLE_FEATURES=WaylandWindowDecorations

parse_git_branch() {
	git_branch=$(git branch --show-current 2>/dev/null)
	if [ ! -z $git_branch ]; then
		echo " \[\033[34m\]($git_branch)"
	fi
}

parse_pwd() {
if [ $(pwd | wc -m) -gt 30 ]; then
	echo "\W"
else echo "\u@\h \w"
fi
}

make_ps1(){
export PS1="[$(parse_pwd)$(parse_git_branch)\[\033[00m\]]\$ "
}
# makes the PS1 prompt dynamic for things like \W and \w
PROMPT_COMMAND=make_ps1
# PS1="[\u@\h \W ($(parse_git_branch))]\$ "

# Ruby exports
export GEM_HOME=$HOME/gems
export PATH=$HOME/gems/bin:$PATH
export PATH=$HOME/.local/share/gem/ruby/3.0.0/bin:$PATH

# add personal bin dir
export PATH=$HOME/bin:$PATH
# start ssh agent
eval $(ssh-agent -s) > /dev/null

# bash completion (requires bash-completion package)
source <(kubectl completion bash)

export PATH=/usr/share/sway-contrib:$PATH
export XDG_SCREENSHOTS_DIR=$HOME/screenshots

# alias terraform='docker run --rm -it --env-file $PWD/.env -v $PWD:$PWD hashicorp/terraform:latest -chdir=$PWD'
#alias ansible-docker='docker run --rm -it -v $PWD:/app -w "/app" kodama-ansible:0.4 '
#alias ansible-playbook='ansible-docker ansible-playbook'
#alias ansible-vault='ansible-docker ansible-vault'

export PATH=/opt/piavpn/bin:$PATH

PATH="/home/chkodama/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/chkodama/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/chkodama/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/chkodama/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/chkodama/perl5"; export PERL_MM_OPT;

export KUBECONFIG=/home/chkodama/work/kubelogin-config/combined-kubeconfig.yaml
