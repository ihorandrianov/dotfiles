alias vi="nvim"
alias vim="nvim"
alias lsa="eza -la"
alias ls="eza"
alias sqlite3="/usr/local/opt/sqlite/bin/sqlite3"
abbr -a yr 'cal -y'
abbr -a c cargo
abbr -a e nvim
abbr -a m make

set -e PATH
set -gx PATH /usr/local/bin /usr/bin /bin /usr/sbin /sbin
# Add other directories you need
set -gx PATH /usr/local/go/bin $PATH
set -gx PATH /Applications/Ghostty.app/Contents/MacOS $PATH
set -gx PATH ~/.cargo/bin $PATH
set -gx PATH $HOME/nvim-macos-x86_64/bin/ $PATH
eval $(opam env)
fish_add_path /usr/local/opt/sqlite/bin
fish_vi_key_bindings

# Fish git prompt
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate ''
set __fish_git_prompt_showupstream 'none'
set -g fish_prompt_pwd_dir_length 3

set fish_greeting
# Added by Windsurf
fish_add_path /Users/ihorandrianov/.codeium/windsurf/bin

function mkcd --description "Make a directory and change into it"
    mkdir -p $argv[1]
    cd $argv[1]
end

function fish_prompt
	set_color brblack
	echo -n "["(date "+%H:%M")"] "
	set_color blue
	echo -n (HostName)
	if [ $PWD != $HOME ]
		set_color brblack
		echo -n ':'
		set_color yellow
		echo -n (basename $PWD)
	end
	set_color green
	printf '%s ' (__fish_git_prompt)
	set_color red
	echo -n '| '
	set_color normal
end
