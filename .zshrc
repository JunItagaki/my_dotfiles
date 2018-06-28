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

#入力途中の履歴補完を有効化する
autoload -Uz history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^b" history-beginning-search-forward-end

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

# プロンプト表示
autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '[%b]'
zstyle ':vcs_info:*' actionformats '[%b|%a]'
# ユーザ名@ホスト名
PROMPT='%n@%m %# '
# 現在時刻
RPROMPT=$'%{\e[38;5;251m%}%D{%b %d}, %*%{\e[m%}'
TRAPALRM() {
  zle reset-prompt
}
precmd () {
  # 1行あける
  print
  # カレントディレクトリ
  local right=' %{\e[38;5;2m%} %~ %{\e[m%}'
  # バージョン管理されてた場合、ブランチ名
  vcs_info
  local left="%{\e[38;5;32m%}${vcs_info_msg_0_}%{\e[m%}"
  # スペースの長さを計算
  # テキストを装飾する場合、エスケープシーケンスをカウントしないようにします
  local invisible='%([BSUbfksu]|([FK]|){*})'
  local leftwidth=${#${(S%%)left//$~invisible/}}
  local rightwidth=${#${(S%%)right//$~invisible/}}
  local padwidth=$(($COLUMNS - ($leftwidth + $rightwidth) % $COLUMNS))

  print -P $left${(r:$padwidth:: :)}$right
}


# cd した先のディレクトリをディレクトリスタックに追加する
# ディレクトリスタックとは今までに行ったディレクトリの履歴のこと
# `cd +<Tab>` でディレクトリの履歴が表示され、そこに移動できる
setopt auto_pushd

#alias
alias cdru='cd /Users/itagakijun/desktop/projects/private/Ruby'
alias cdpy='cd /Users/itagakijun/desktop/projects/private/Python'
alias cdpro='cd /Users/itagakijun/desktop/projects'
alias cdrails='cd /Users/itagakijun/Desktop/projects/private/Rails'
alias cdpri='cd /Users/itagakijun/Desktop/projects/private'

alias be='bundle exec'
alias bi='bundle install'
alias bemi='bundle exec rake db:migrate'

alias relogin='exec $SHELL -l'

alias rr='rake routes'

alias rs='rails s'
alias rc='rails c'
alias bers='bundle exec rails s'
alias bers='bundle exec rails c'

alias vimb='vim ~/.dotfiles/.bashrc'
alias vimz='vim ~/.dotfiles/.zshrc'

alias ls='ls -l'

alias gitb='git branch'
alias gitc='git checkout'
alias gits='git status'
