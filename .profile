export LS_COLORS=cxfxexdxbxegedabaggxad
export EDITOR=/usr/bin/vim
export PATH=/Users/fbenigni/java_home/bin:/opt/local/bin:/opt/local/sbin:/Users/fbenigni/bin:/usr/local/bin:$PATH
export JAVA_HOME=`/usr/libexec/java_home -v 11`

# base-files version 4.2-3

# ~/.profile: executed by the command interpreter for login shells.

# The latest version as installed by the Cygwin Setup program can
# always be found at /etc/defaults/etc/skel/.profile

# Modifying /etc/skel/.profile directly will prevent
# setup from updating it.

# The copy in your home directory (~/.profile) is yours, please
# feel free to customise it to create a shell
# environment to your liking.  If you feel a change
# would be benificial to all, please feel free to send
# a patch to the cygwin mailing list.

# User dependent .profile file


# This file is not read by bash(1) if ~/.bash_profile or ~/.bash_login
# exists.
#
# if running bash
if [ -n "${BASH_VERSION}" ]; then
  if [ -f "${HOME}/.bashrc" ]; then
    source "${HOME}/.bashrc"
  fi
fi

# as vim is not reading .vimrc when launched from another tool
export EDITOR=nano

source ${HOME}/.aliases
