## ZSH SETUP
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"

export EDITOR='code'

alias zshconfig="$EDITOR ~/.zshrc"
alias ohmyzsh="$EDITOR ~/.oh-my-zsh"

export PATH="/usr/local/sbin:$PATH"
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:$PATH
export PATH=/Applications/MAMP/bin/php/php5.5.3/bin:$PATH
export PATH=$HOME/.composer/vendor/bin:$PATH

alias add-alias="$EDITOR ~/.zshrc"
alias add-server="$EDITOR ~/.ssh/config"
alias edit-hosts="sudo $EDITOR /etc/hosts"

alias install='sudo apt-get install'
alias update='sudo apt-get update'
alias remove='sudo apt-get remove'
# Get OS X Software Updates, and update installed Ruby gems, Homebrew, npm, and their installed packages
alias update-all='sudo softwareupdate -i -a; brew update; brew upgrade --all; brew cleanup; npm install npm -g; npm update -g; sudo gem update --system; sudo gem update'

alias auth="'cat >> ~/.ssh/authorized_keys' \ < ~/.ssh/id_dsa.pub"
alias key="/bin/cat ~/.ssh/id_rsa.pub | pbcopy"

## TMUX
	alias t="tmux"
	alias t-edit="$EDITOR ~/.tmux.conf"
	alias t-list='tmux list-sessions'
	alias t-new='tmux new -s'

## SERVERS
	# In ~/.ssh/config
	# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
	h=($h ${${${(@M)${(f)"$(cat ~/.ssh/config)"}:#Host *}#Host }:#*[*?]*})
	zstyle ':completion:*:(ssh|scp|sftp|rsh|rsync):*' hosts $h
	# [ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;

## LARAVEL
	alias art="php artisan"
	alias artisan="php artisan"
	alias a-routes="php artisan routes"
	alias art-routes="php artisan routes"
	alias routes="php artisan routes"
	alias a-migrate="php artisan migrate"
	alias art-migrate="php artisan migrate"
	alias migrate="php artisan migrate"
	alias a-rollback="php artisan migrate:rollback"
	alias rollback="php artisan migrate:rollback"
	alias a-autoload="php artisan dumpautoload"
	alias c-update="composer update"
	alias c-install="composer install"
	alias c-autoload="composer dump-autoload -o"

## HOMESTEAD
	function homestead() {
		( cd ~/Development/homestead && vagrant $* )
	}
	alias hs="homestead"
	alias hs-edit="cd ~/Development/homestead && $EDITOR Homestead.yaml"

## VAGRANT
	alias v='vagrant version && vagrant global-status'
	alias vst='vagrant status'
	alias vup='vagrant up'
	alias vdo='vagrant halt'
	alias vssh='vagrant ssh'
	alias vkill='vagrant destroy'

## WORDPRESS
	alias install-wp="wget http://wordpress.org/latest.tar.gz; tar -xzvf latest.tar.gz; rm latest.tar.gz; mv wordpress/* .; rm -r wordpress;"

## UTILITIES
	alias ..='cd ..'
	alias ...='cd ../../'
	alias ....='cd ../../../'
	alias .....='cd ../../../../'
	alias ......='cd ../../../../../'
	alias la="ls -a"
	alias redo='sudo !!'
	alias www='cd /var/www/'
	alias c="clear"
	alias h="cd ~/"
	alias d="cd ~/Documents"
	alias dl="cd ~/Downloads"
	alias dt="cd ~/Desktop"
	alias dev="cd ~/Development"

## MAC
	alias show-hidden='defaults write com.apple.finder AppleShowAllFiles -boolean true; killAll Finder'
	alias hide-hidden='defaults write com.apple.finder AppleShowAllFiles -boolean false; killAll Finder'
	alias flushdns='sudo killall -HUP mDNSResponder'
	alias iphone='open /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/Applications/iPhone\ Simulator.app'

## WEB SERVER
	alias logs='tail -n30 /var/log/apache2/error.log'
	alias a2-restart="sudo service apache2 restart"
	alias a2-reload="sudo service apache2 reload"

plugins=(git)
source $ZSH/oh-my-zsh.sh

