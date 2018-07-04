source ~/.bashrc

export PATH="/usr/local/bin:$PATH"

# anyenv
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"

# mysql
export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"
