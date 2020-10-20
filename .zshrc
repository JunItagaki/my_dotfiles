# Created by newuser for 5.4.2

# prompt
PROMPT='%m:%c %n$ '

# パスを追加したい場合
export PATH="$HOME/bin:$PATH"

# 日本語を使用
export LANG=ja_JP.UTF-8

#ヒストリーサイズ設定
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
PATH=${PATH}:~/bin

#ヒストリの一覧を読みやすい形に変更
HISTTIMEFORMAT="[%Y/%M/%D %H:%M:%S] "

# 入力したコマンドがすでにコマンド履歴に含まれる場合、履歴から古いほうのコマンドを削除する
setopt hist_ignore_all_dups

# ヒストリーに重複を表示しない
setopt histignorealldups

# 同時に起動したzshの間でヒストリを共有
setopt share_history

----------------------------------------------------------------------------------

# zplug settings
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

# plugins
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/zsh_reload", from:oh-my-zsh
zplug "zsh-users/zsh-autosuggestions"
zplug "mafredri/zsh-async", from:github
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme
zplug "zsh-users/zsh-syntax-highlighting"

 Install plugins if there are plugins that have not been installed
 if ! zplug check --verbose; then
     printf "Install? [y/N]: "
     if read -q; then
         echo; zplug install
     fi
 fi

# Then, source plugins and add commands to $PATH
zplug load --verbose

------------------------------------------------------------------------------------

# 補完機能を有効にする
autoload -Uz compinit
compinit -u
if [ -e /usr/local/share/zsh-completions ]; then
  fpath=(/usr/local/share/zsh-completions $fpath)
fi

# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# 補完候補を詰めて表示
setopt list_packed

#補完のリストの、選択している部分を塗りつぶす
zstyle ':completion:*' menu select

#補完でカラーを使用する
autoload -Uz colors
colors
zstyle ':completion:*' list-colors "${LS_COLORS}"

# コマンドがスペースで始まる場合、コマンド履歴に追加しない
# 例： <Space>echo hello と入力
setopt hist_ignore_space

# コマンドのスペルを訂正
setopt correct
# ビープ音を鳴らさない
setopt no_beep
# cd した先のディレクトリをディレクトリスタックに追加する
# ディレクトリスタックとは今までに行ったディレクトリの履歴のこと
# `cd +<Tab>` でディレクトリの履歴が表示され、そこに移動できる
setopt auto_pushd

#alias
alias be='bundle exec'
alias bi='bundle install'
alias bemi='bundle exec rake db:migrate'

alias relogin='exec $SHELL -l'

alias vi='vim'

alias rs='rails s'
alias rc='rails c'
alias bers='bundle exec rails s'
alias bers='bundle exec rails c'

alias vimb='vim ~/.dotfiles/.bashrc'
alias vimz='vim ~/.dotfiles/.zshrc'

alias ls='ls -l'
alias la="ls -a"

alias gitb='git branch'
alias gitc='git checkout'
alias gits='git status'
alias gitfp='git fetch --prune'

alias dc='docker-compose'
alias dcup='docker-compose up'
alias dcstop='docker-compose stop'

# direnv
export EDITOR=vim
eval "$(direnv hook zsh)"

# node.js
export PATH=$HOME/.nodebrew/current/bin:$PATH

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

