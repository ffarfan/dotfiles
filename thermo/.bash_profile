# Various Utils
alias ll='ls -lh'

alias bc='bcompare'

export PATH=~/.local/bin:$PATH

# Enable timestamps on history
export HISTTIMEFORMAT="%F %T "

# Add Lucene to Java class path
export CLASSPATH=$CLASSPATH:~/lucene-8.4.1/core/lucene-core-8.4.1.jar:~/lucene-8.4.1/queryparser/lucene-queryparser-8.4.1.jar:~/lucene-8.4.1/analysis/common/lucene-analyzers-common-8.4.1.jar:~/lucene-8.4.1/demo/lucene-demo-8.4.1.jar:

# CLI Colors
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Added by Miniconda2 4.3.21 installer
export PATH="/Users/fernando.farfan/miniconda2/bin:$PATH"

# Added Maven path
export PATH="/opt/apache-maven-3.5.3/bin:$PATH"

# Added TK-Inter path
export PATH="/usr/local/opt/tcl-tk/bin:$PATH"

# Checkout Directories
CHECKOUT_DIR=$HOME"/checkout"

# ORT dir aliases
alias ort='cd ${CHECKOUT_DIR}/ocp_end_to_end_tests/integrationTests/'

# DRA dir aliases
alias dra='cd ${CHECKOUT_DIR}/dra/'

# OVAT Latest Executable Alias
OVAT_VERSION='3.0.11'
alias ovat='~/Downloads/ovat-${OVAT_VERSION}/ovat'
# OVAT dir aliases
OVAT_DIR=$CHECKOUT_DIR'/oncomine-variant-annotation-tool'
alias ov='cd ${OVAT_DIR}/'
alias rset='cd ${OVAT_DIR}/oncomine-rulesets/src/main/resources/content/ionreporter514'
alias scripts='cd ${OVAT_DIR}/ovat/src/main/resources/scripts/'
alias dc='cd ${OVAT_DIR}/ovat/src/main/resources/test_artifacts/data_consistency'
alias content='cd ${OVAT_DIR}/ovat/src/main/resources/content_builds'
alias vcfs='cd ${OVAT_DIR}/oncomine-rulesets/src/test/resources/vcf'

# LIFE LAB dir aliases
LIFELAB_DIR=$CHECKOUT_DIR'/lifelab_support'
alias lifelab='cd ${LIFELAB_DIR}'
alias janssen='cd ${LIFELAB_DIR}/Janssen'
alias corelims='cd ${LIFELAB_DIR}/Corelims'

# AXMAN dir aliases
alias axman='cd ${CHECKOUT_DIR}/actionability-content/'

# Util to display tsv cols
cols() {
    head -n1 "$1" | tr '\t' '\n' | nl -ba
}

# Customization of pep8 routine
my_pep8() {
    pycodestyle --max-line-length=120 --ignore=E127,E128,E402,E722,W504 "$1"
}

# Combine mkdir & cd; create directory and immediately cd into it
mkcd() {
    mkdir -m -- "$1" && cd -P -- "$1"
}

# Get current branch in git repo
function parse_git_branch() {
    BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
    if [ ! "${BRANCH}" == "" ]
    then
        STAT=`parse_git_dirty`
        echo "[${BRANCH}${STAT}] "
    else
        echo ""
    fi
}

# Get current status of git repo
function parse_git_dirty {
    status=`git status 2>&1 | tee`
    dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
    untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
    ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
    newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
    renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
    deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
    bits=""
    if [ "${renamed}" == "0" ]; then
        bits=">${bits}"
    fi
    if [ "${ahead}" == "0" ]; then
        bits="!${bits}"
    fi
    if [ "${newfile}" == "0" ]; then
        bits="+${bits}"
    fi
    if [ "${untracked}" == "0" ]; then
        bits="?${bits}"
    fi
    if [ "${deleted}" == "0" ]; then
        bits="x${bits}"
    fi
    if [ "${dirty}" == "0" ]; then
        bits="*${bits}"
    fi
    if [ ! "${bits}" == "" ]; then
        echo " ${bits}"
    else
        echo ""
    fi
}

export PS1="\w \[\e[32m\]\`parse_git_branch\`\[\e[m\]$ "
