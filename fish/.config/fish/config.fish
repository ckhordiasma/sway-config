#
# ~/.config/fish/config.fish
#

if not status is-interactive
    exit
end

set -gx EDITOR vim

# cargo provides a fish-native env file
test -f $HOME/.cargo/env.fish; and source $HOME/.cargo/env.fish

set -gx MOZ_USE_XINPUT2 1

# make vs code work better in wayland
set -gx ELECTRON_OZONE_PLATFORM_HINT wayland
set -gx ELECTRON_ENABLE_FEATURES WaylandWindowDecorations

# Ruby paths
set -gx GEM_HOME $HOME/gems
fish_add_path $HOME/gems/bin
fish_add_path $HOME/.local/share/gem/ruby/3.0.0/bin

# personal bin dir
fish_add_path $HOME/bin

# start ssh agent (only if one isn't already running for this session)
if not set -q SSH_AUTH_SOCK
    eval (ssh-agent -c) > /dev/null
end

# kubectl completions
if type -q kubectl
    kubectl completion fish | source
end

fish_add_path /usr/share/sway-contrib
set -gx XDG_SCREENSHOTS_DIR $HOME/screenshots

fish_add_path /opt/piavpn/bin

# perl5 local::lib
fish_add_path $HOME/perl5/bin
set -gx PERL5LIB $HOME/perl5/lib/perl5
set -gx PERL_LOCAL_LIB_ROOT $HOME/perl5
set -gx PERL_MB_OPT "--install_base \"$HOME/perl5\""
set -gx PERL_MM_OPT "INSTALL_BASE=$HOME/perl5"

set -gx KUBECONFIG $HOME/work/kubelogin-config/combined-kubeconfig.yaml

# aliases live in conf.d/aliases.fish (auto-sourced by fish)
