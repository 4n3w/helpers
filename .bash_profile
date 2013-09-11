# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs
# Don't use this, it's for me.

LOCAL=$HOME/local

HOME_LIBRARIES=( JAVA_HOME GROOVY_HOME GRADLE_HOME )

NEWPATH=""

for HOME_LIBRARY in "${HOME_LIBRARIES[@]}"
do
    LIBRARY=$(echo "${HOME_LIBRARY%%_*}" | tr '[A-Z]' '[a-z]')
    export $HOME_LIBRARY=$LOCAL/$LIBRARY
    echo "Set: ${HOME_LIBRARY} to ${!HOME_LIBRARY}"
    NEWPATH=$LOCAL/$LIBRARY/bin:$NEWPATH
    echo "Add: $LOCAL/$LIBRARY/bin to PATH"
done

PATH=$NEWPATH:$PATH:$HOME/local/bin:$HOME/bin:
export PATH

