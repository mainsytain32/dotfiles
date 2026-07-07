 if [[ -f ~/.bashrc ]] ; then
     . ~/.bashrc
 fi

# anyenv
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"

# ndenv
export PATH="$HOME/.ndenv/bin:$PATH"
eval "$(ndenv init -)"

# brew updateをしてphpが動かなくなり、いろいろためしてもだめだったから、2023/6/20時点で、一旦homebrewのphpを使用
export PATH="/usr/local/opt/php@7.4/bin:$PATH"
export PATH="/usr/local/opt/php@7.4/sbin:$PATH"
## phpenv
#export PATH="$HOME/.phpenv/bin:$PATH"
#eval "$(phpenv init -)"

export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
export PKG_CONFIG_PATH="/usr/local/opt/openssl@1.1/lib/pkgconfig:$PKG_CONFIG_PATH"

# mysql
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"

# flutter
export PATH="$PATH:$HOME/development/flutter/bin"

# vue-cli
export PATH="$HOME/.anyenv/envs/ndenv/versions/v10.9/lib/node_modules/vue-cli/bin:$PATH"

# java
export JAVA_HOME=`/usr/libexec/java_home -v "11"`
PATH=$JAVA_HOME/bin:$PATH


# Android Studio adb
export PATH=$PATH:/Users/maimac/Library/Android/sdk/platform-tools

export BASH_SILENCE_DEPRECATION_WARNING=1
