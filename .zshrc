#### If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/xsummer/.oh-my-zsh"

#=========================================================================================
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="ys"

#robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

#=========================================================================================
# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

#=========================================================================================
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
plugins=(
   # autojump
    zsh-syntax-highlighting
    zsh-autosuggestions
    git)

source $ZSH/oh-my-zsh.sh

[[ -s ~/.autojump/etc/profile.d/autojump.sh ]] && . ~/.autojump/etc/profile.d/autojump.sh
source /Users/xsummer/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /Users/xsummer/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

#=========================================================================================
# aliases
#alias archey-en='nvim /usr/local/archey-osx'
#alias mac='archey-en'
alias py3='python3'
alias py='python'
alias hi='bash ~/xsummer.sh'
alias blog='hexo clean && hexo g -d'
alias gblog='cd ~/github/xsummer.github.io'
alias gitup='./Github_upload.sh'
alias fg1='fg %1'
alias fg2='fg %2'
alias mkdir='mkdir -p'
#alias cp='cp -i'
alias kext='sudo kextcache -i /'
alias alc='git clone https://github.com/acidanthera/AppleALC.git ~/Desktop/AppleALC'
alias xr='defaults -currentHost write -globalDomain AppleFontSmoothing -int 3'
alias hidpi='sh -c "$(curl -fsSL https://raw.githubusercontent.com/xzhih/one-key-hidpi/master/hidpi.sh)"'

alias ssmd='sudo spctl --master-disable'
alias vivo="scrcpy"
alias vzh='vimtutor -g zh'
alias bs='brew search'
alias rhl='sudo rm -rf /usr/local/var/homebrew/locks'
alias ll='ls -al'
alias lg='ll | grep'
alias cl='clear'
alias nv='nvim'
alias vim='nvim'
alias vi='nvim'
alias v='nvim'
alias vz='nvim ~/.zshrc'
alias vv='nvim ~/.config/nvim/init.vim'
alias sz='source ~/.zshrc'
alias ra='ranger'
alias rf='rm -rf'
alias uz='unzip'
alias ip='ipconfig'
alias bcl='brew cleanup'
alias bi='brew install'
alias bri='brew reinstall'
alias bu='brew uninstall'
alias bci='brew cask install'
##==============================================================================
##==============================================================================
alias ghds='cd ~/Desktop/scripts'
alias ghdc='cd ~/Desktop/C_prog'
alias ghd='cd ~/Desktop/'
alias gh='cd ~'
alias gfv='cd ~/.config/nvim/'
alias ge='cd /etc'
alias gusd='cd /usr/shell/doc'
alias gfr='cd ~/.config/ranger/'
alias gf='cd ~/.config'
alias ghf='cd ~/Documents/'
alias ghl='cd ~/Downloads/'
alias gsf='cd /srv/ftp/'
alias gsfu='cd /srv/ftp/upload/'
alias gsfd='cd /srv/ftp/download/'
alias c.='cd ..'
alias c..='cd ...'

#=========================================================================================
#bindkey
bindkey -v
bindkey -M vicmd "i" vi-insert
#bindkey -M vicmd "i" vi-insert-bol
bindkey -M vicmd "h" vi-backward-char
bindkey -M vicmd "l" vi-forward-char
bindkey -M vicmd "b" vi-backward-word  #移动到前一个单词的开头
bindkey -M vicmd "W" vi-forward-blank-word  #移动到下一个单词的开头(非空字符)
bindkey -M vicmd "w" vi-forward-word  #移动到下一个单词的开头
bindkey -M vicmd "E" vi-forward-blank-word-end #移到当前单词的词尾，已经在则移到下一个单词的词尾(非空字符)
bindkey -M vicmd "e" vi-forward-word-end #移到下一个单词的词尾
bindkey -M vicmd "l" vi-forward-word
bindkey -M vicmd "^" vi-beginning-of-line
bindkey -M vicmd "$" vi-end-of-line
bindkey -M vicmd "j" down-line-or-history
bindkey -M vicmd "k" up-line-or-history

#source
#source /usr/local/bin/.zshrc
#source ~/.fonts/*.sh#

#export
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles
export RUBY_VAR=/Library/Ruby/Gems/2.3.0
export RUBY_GEMS=/Users/xsummer/.gem/ruby/2.3.0
export RUBY_LIB_GEMS=/System/Library/Frameworks/Ruby.framework/Versions/2.3/usr/lib/ruby/gems/2.3.0
export NPM_GLOBAL=~/.npm-global/bin
#Algolia Admin API Key
export HEXO_ALGOLIA_INDEXING_KEY=cf824c6588d2371b9f6a09037e7a7e6a
export PATH=$PATH:$RUBY_VAR:$RUBY_GEMS:$RUBY_LIB_GEMS:$NPM_GLOBAL:$HEXO_ALGOLIA_INDEXING_KEY

