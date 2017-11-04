# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/bin

export PATH

# Stuff & Thangs
#

#MFA for AWS
function mfa { 
	eval $(python ~/.mfa.py $1 $2); 
	}

#PWGEN alias
function pw {
	pwgen -s -y 16 --num-passwords=1
	}

function vssh {
  vault read -field=value secret/user/prod/ssh_keys/$1 > ~/.ssh/temp.pem
    chmod 600 ~/.ssh/temp.pem
      ssh -i ~/.ssh/temp.pem $2
      }

# Search History
alias hg='history | grep -i '

# Git aliases
alias gac='git add . && git commit -m'
alias gs='git status'
alias gc='git checkout'
alias gb='git branch'

# Ensure user-installed binaries take precedence
export PATH=/usr/local/bin:$PATH
