# ===========================================================
# All fish-shell aliases and functions
# ===========================================================

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
# start "Environment variables"
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
set -x BROWSER /usr/bin/google-chrome-stable
set -x EDITOR /usr/bin/vim
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
# end
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
# start "Purely fish related"
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
function fish_prompt --description "Write out the prompt"
	# Just calculate this once, to save a few cycles when displaying the prompt
	if not set -q __fish_prompt_hostname
		set -g __fish_prompt_hostname (hostname|cut -d . -f 1)
	end

	set -l color_cwd
	set -l suffix
	switch $USER
	case root toor
		if set -q fish_color_cwd_root
			set color_cwd $fish_color_cwd_root
		else
			set color_cwd $fish_color_cwd
		end
		set suffix '#'
	case '*'
		set color_cwd $fish_color_cwd
		set suffix '>'
	end

	echo -n -s (set_color $color_cwd) (prompt_pwd) (set_color normal) "$suffix "
        z --add "$PWD"
end


function fish_greeting
	set_color cyan
	echo -n $USER
	set_color normal
	echo -n ' at '
	set_color cyan
	echo (hostname)
end

function fish_user_key_bindings
    bind \n default_command
    bind \r default_command
end

function default_command
    string length --quiet (commandline)
    or commandline repeat
    commandline -f execute
end
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
# end
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
# start "General command-line"
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
alias e='exit'
alias l='ls'
alias cp='cp -r'
alias rmr='rm -r'
alias lah='ls -lah'
alias rmf="sudo rm -r"
alias mk="minikube"
alias h="howdoi"
#alias clipboard='xargs echo -n | xclip -selection clipboard'
alias xclip="xclip -selection c"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias sound="pavucontrol"
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

alias redshift-more-red="redshift -t 3000K:2000K"

alias update-pair-programming="d build -t edwinvanrooij/pair-programming-websockets ~/Projects/pair-programming-websockets/.; and d build -t edwinvanrooij/pair-programming-http ~/Projects/pair-programming-http/.; and d build -t edwinvanrooij/pair-programming-client ~/pair-programming-client/.; and d push edwinvanrooij/pair-programming-client; and d push edwinvanrooij/pair-programming-http; and d push edwinvanrooij/pair-programming-websockets"

alias st="sudo systemctl"
alias system="sudo systemctl"
#alias sw="sudo eopkg"
alias software="sudo eopkg"

alias scrotclip="scrot -s ~/foo.png; and xclip ~/foo.png; and rm ~/foo.png"

alias clipboard="xargs echo -n | xclip -selection clipboard"

alias pwdc="pwd | clipboard"

alias grun="gradle build; and java -jar build/libs/*.jar"


#alias start-emulator='Android/Sdk/tools/emulator -avd Nexus_5X_API_28_x86 -use-system-libs &'
function start-emulator
    set -x ANDROID_SDK $HOME/Android/Sdk/
    set -x PATH $ANDROID_SDK/emulator $ANDROID_SDK/tools $PATH
    emulator -avd Nexus_5X_API_28_x86 
end

# Nvm this one, start from studio > sdk manager
function start-emulator-pc
    /home/eddy/Android/Sdk/emulator/emulator -avd Nexus_5X_API_28
end


#set: Warning: $PATH entry "/home/eddy/Android/Sdk/emulator:/home/eddy/Android/Sdk/tools:/usr/bin" is not valid (No such file or directory)   
#set: Did you mean 'set PATH $PATH /home/eddy/Android/Sdk/tools:/usr/bin'?

function ipc
    ifconfig | grep "inet addr:[0-9]{3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}" | awk '{print $2}' | cut -c 6-100 | clipboard
end

function ip
    ifconfig | grep "inet addr:[0-9]{3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}" | awk '{print $2}' | cut -c 6-100
end

function echoc
    echo $argv | clipboard
end

function catc
    cat $argv | clipboard
end

function md
    mkdir -p $argv; and cd $argv
end

function loop
    clear; eval $argv[1]; while sleep 1; clear; eval $argv[1]; end
end

function loop-long
    clear; eval $argv[1]; while sleep 5; clear; eval $argv[1]; end
end

function grep
	command grep -E --color=auto $argv[1..-1]
end

function youtube-playlist-dl
    youtube-dl --extract-audio --audio-format mp3 $argv[1]
end

function read_confirm
  while true
    read -l -p read_confirm_prompt confirm

    switch $confirm
      case Y y
        return 0
      case '' N n
        return 1
    end
  end
end

function read_confirm_prompt
  echo 'Do you want to continue? [y/N] '
end
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
# end
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

alias rabbitmq-server='sudo rabbitmq_server-*/sbin/rabbitmq-server'
alias rabbitmq-exchanges='sudo rabbitmq_server-*/sbin/rabbitmqctl list_exchanges'
alias rabbitmq-queues='sudo rabbitmq_server-*/sbin/rabbitmqctl list_queues'
alias rabbitmq-bindings='sudo rabbitmq_server-*/sbin/rabbitmqctl list_bindings'

alias c='clear'
alias cls='clear; and ls'
alias cla='clear; and ls -la'
alias clah='clear; and ls -lah'
alias lah='ls -ah'

# ========================
# start "Git related"
# ========================
alias clone='git clone'
alias pull='git pull'
alias push='git push'
function co
    git add -A; and git commit -m "$argv[1..-1]"
end
function cop
    co "$argv[1..-1]"; git push
end
# ========================
# end
# ========================

# Edit <file>
alias ef='vim ~/.config/fish/config.fish'
alias ei='vim ~/.config/i3/config'
alias ev='vim ~/.vimrc'
alias er='vim ~/dotfiles/README.md'

alias mux=byobu

alias tail-log='tail -f ~/dotfiles/data/log.txt'
alias grep-log='cat ~/dotfiles/data/log.txt | grep'

alias rm-sonarcube='docker container rm ( docker container stop (echo (docker container ps --all | grep sonarqube | awk \'{print $1;}\')))'


function log
    echo "[ "(date "+%d %B %H:%M:%S")" ]:  $argv[0..-1]" >> ~/dotfiles/data/log.txt
end

function sp --description 'Search process'
    ps aux | grep "$argv[1..-1]"
end

function repeat
    for x in $history[1..150]
        if [ $x != "repeat" ] 
		eval $x
		return
	end
    end
end

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
# end
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
# start "IDE functions"
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
function start-jenkins
    java -jar ~/jenkins.war --httpPort=8080 &
    disown
end

function charm
	    if count $argv > /dev/null
		/usr/local/bin/charm $argv &
	    else
		/usr/local/bin/charm . &
	    end
	    disown
end

function charmm
	    if count $argv > /dev/null
		/usr/local/bin/charm $argv &
	    else
		/usr/local/bin/charm . &
	    end
	    disown
end

function idea
	    if count $argv > /dev/null
		/usr/local/bin/idea $argv &
	    else
		/usr/local/bin/idea . &
	    end
	    disown
end

function ideaa
	    if count $argv > /dev/null
		/usr/local/bin/idea $argv &
	    else
		/usr/local/bin/idea . &
	    end
	    disown
end

function webstorm
	    if count $argv > /dev/null
		/usr/local/bin/webstorm $argv &
	    else
		/usr/local/bin/webstorm . &
	    end
	    disown
end

function studio
	    if count $argv > /dev/null
		/usr/local/bin/studio $argv &
	    else
		/usr/local/bin/studio . &
	    end
	    disown
end
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
# end
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

# Start X at login
if status is-login
    if test -z "$DISPLAY" -a $XDG_VTNR = 1
        exec startx -- -keeptty
    end
end
