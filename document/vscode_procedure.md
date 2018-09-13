## MacOSで実施

### - 設定ファイル

```
# = 現在の設定があるPCでの操作
# 共有用フォルダ(今回の例では~/dotfiles/vscode)に今の設定ファイルを置く

mkdir -p ~/dotfiles/ ~/dotfiles/vscode
cd ~/Library/Application\ Support/Code/User/
mv ./settings.json ~/dotfiles/vscode/settings.json
mv ./keybindings.json ~/dotfiles/vscode/keybindings.json
ln -s ~/.dotfiles/vscode/settings.json ./settings.json
ln -s ~/.dotfiles/vscode/keybindings.json ./keybindings.json

# = 新しいPCでの操作
# 共有用フォルダにあるファイルからシンボリックリンクを貼る

cd ~/Library/Application\ Support/Code/User/
rm settings.json
ln -s ~/.dotfiles/vscode/settings.json ./settings.json
rm keybindings.json
ln -s ~/.dotfiles/vscode/keybindings.json ./keybindings.json
```

### - プラグインファイル

```
cd 〜/.dofiles/vscode
vim extensions
code --list-extensions > 〜/.dotfiles/vscode/extensions
※上書きの場合は > を >> 変更する

```

### プラグインインストール方法

```

cat ./extensions | while read line
do
  code --install-extension $line
done

```

