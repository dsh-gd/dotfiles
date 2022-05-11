# ls aliases
alias ll='ls -lah'

# aliases to protect against overwriting
alias cp='cp -i'
alias mv='mv -i'

# git related aliases
alias gs='git status'
alias ga='git add'
alias gc='git commit'

# -p make parent dirs as needed
alias mkdir='mkdir -p'

# create a directory and cd into it
mcd() {
    mkdir "${1}" && cd "${1}" || exit
}

# Python virtual environment
alias ve='python3 -m venv ./venv'
alias va='source ./venv/bin/activate'
