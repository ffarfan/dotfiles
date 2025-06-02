# Various Utils
alias ll='command ls -lh'

alias bc='bcompare'

export PATH="$HOME/.local/bin:$PATH"

# Enable timestamps on history
export HISTTIMEFORMAT="%F %T "

# CLI Colors
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Added by Miniconda2 4.3.21 installer
export PATH="$HOME/miniconda2/bin:$PATH"

# Added Maven path
MAVEN_VERSION="3.5.3"
export PATH="/opt/apache-maven-${MAVEN_VERSION}/bin:$PATH"

# Added TK-Inter path
export PATH="/usr/local/opt/tcl-tk/bin:$PATH"

# Added Homebrew's sbin
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
eval "$(/opt/homebrew/bin/brew shellenv)"

# Add Sublime Text's CLI
export PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin:$PATH"

# Added Python's local path
export PATH="$HOME/Library/Python/$(ls "$HOME/Library/Python" | sort -V | tail -n 1)/bin:$PATH"

# Add Postgres paths and variables
export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/postgresql@15/lib"
export CPPFLAGS="-I/opt/homebrew/opt/postgresql@15/include"

# Checkout Directories
CHECKOUT_DIR="$HOME/checkout"

# ORT dir aliases
alias ort="cd \"${CHECKOUT_DIR}/oncomine-reporter-tests/okr_regression_tests/\""

# OVAT Latest Executable Alias
OVAT_VERSION="3.4.1"
alias ovat="$HOME/Downloads/ovat-${OVAT_VERSION}/ovat"

# OVAT dir aliases
OVAT_DIR="${CHECKOUT_DIR}/oncomine-variant-annotation-tool"
alias ov="cd \"${OVAT_DIR}/\""
alias rset="cd \"${OVAT_DIR}/oncomine-rulesets/src/main/resources/content/ionreporter70\""
alias rset520="cd \"${OVAT_DIR}/oncomine-rulesets/src/main/resources/content/ionreporter520\""
alias scripts="cd \"${OVAT_DIR}/ovat/src/main/resources/scripts/\""
alias dc="cd \"${OVAT_DIR}/ovat/src/main/resources/test_artifacts/data_consistency\""
alias content="cd \"${OVAT_DIR}/ovat/src/main/resources/content_builds\""
alias vcfs="cd \"${OVAT_DIR}/oncomine-rulesets/src/test/resources/vcf\""
alias ovat-utils="cd \"${CHECKOUT_DIR}/ovat-utilities\""

# AXMAN dir aliases
alias axman="cd \"${CHECKOUT_DIR}/actionability-content/\""

# VNS dir aliases
alias vns="cd \"${CHECKOUT_DIR}/variant-name-service\""

# UHF dir aliases
alias uhf="cd \"${CHECKOUT_DIR}/uhf\""

# ONE-AI dir aliases
alias oneai="cd \"${CHECKOUT_DIR}/OncoExplorer-Ai\""

# Util to display tsv cols
cols() {
    head -n1 "$1" | tr '\t' '\n' | nl -ba
}

# Customization of pep8 routine
my_pep8() {
    pycodestyle --max-line-length=120 --ignore=E127,E128,E402,E722,W504 --exclude=venv "$1"
}

# Alias for vulture to always apply min-confidence
alias vulture='vulture --min-confidence 61'

# Combine mkdir & cd; create directory and immediately cd into it
mkcd() {
    mkdir -m -- "$1" && cd -P -- "$1"
}

# Get current branch in git repo
function parse_git_branch() {
    BRANCH=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
    if [ -n "${BRANCH}" ]; then
        STAT=$(parse_git_dirty)
        echo "[${BRANCH}${STAT}] "
    else
        echo ""
    fi
}

# Get current status of git repo
function parse_git_dirty {
    status=$(git status 2>&1 | tee)
    dirty=$(echo -n "${status}" | grep "modified:" &> /dev/null; echo "$?")
    untracked=$(echo -n "${status}" | grep "Untracked files" &> /dev/null; echo "$?")
    ahead=$(echo -n "${status}" | grep "Your branch is ahead of" &> /dev/null; echo "$?")
    newfile=$(echo -n "${status}" | grep "new file:" &> /dev/null; echo "$?")
    renamed=$(echo -n "${status}" | grep "renamed:" &> /dev/null; echo "$?")
    deleted=$(echo -n "${status}" | grep "deleted:" &> /dev/null; echo "$?")
    bits=""
    [ "${renamed}" == "0" ] && bits=">${bits}"
    [ "${ahead}" == "0" ] && bits="!${bits}"
    [ "${newfile}" == "0" ] && bits="+${bits}"
    [ "${untracked}" == "0" ] && bits="?${bits}"
    [ "${deleted}" == "0" ] && bits="x${bits}"
    [ "${dirty}" == "0" ] && bits="*${bits}"
    [ -n "${bits}" ] && echo " ${bits}" || echo ""
}

# Copy current dir to clipboard
function cpwd {
    pwd  # Print curr dir before copying to clipboard
    pwd | tr -d "\r\n" | pbcopy
}

export PS1="\u@\h:\w \[\e[32m\]\$(parse_git_branch)\[\e[m\]$ "

# JEnv Configuration
alias j11='jenv global 11'
alias j17='jenv global 17.0.15'

export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"
