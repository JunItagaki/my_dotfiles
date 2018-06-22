# Created by newuser for 5.4.2

# prompt
PROMPT='%m:%c %n$ '

# パスを追加したい場合
export PATH="$HOME/bin:$PATH"

#ヒストリーサイズ設定
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
PATH=${PATH}:~/bin

#ヒストリの一覧を読みやすい形に変更
HISTTIMEFORMAT="[%Y/%M/%D %H:%M:%S] "

# 同時に起動したzshの間でヒストリを共有
setopt share_history

#入力途中の履歴補完を有効化する
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end

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
autoload colors
zstyle ':completion:*' list-colors "${LS_COLORS}"

# コマンドのスペルを訂正
setopt correct
# ビープ音を鳴らさない
setopt no_beep

# branch表示

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

alias cdnex='cd /Users/itagakijun/desktop/projects/Nexceed'
alias cdtachi='cd /Users/itagakijun/desktop/projects/Nexceed/立川商店'
