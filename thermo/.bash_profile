alias ll='ls -lh'

export PATH=~/.local/bin:$PATH

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# added by Miniconda2 4.3.21 installer
export PATH="/Users/fernando.farfan/miniconda2/bin:$PATH"

# Added Maven path
export PATH="/opt/apache-maven-3.5.3/bin:$PATH"

# ORT dir aliases
alias ort='cd ~/checkout/ocp_end_to_end_tests/integrationTests/'

# DRA dir aliases
alias dra='cd ~/checkout/dra/'

# OVAT Latest Executable Alias
alias ovat='~/Downloads/ovat-2.7.14/ovat'
# OVAT dir aliases
alias rset='cd ~/checkout/oncomine-variant-annotation-tool/oncomine-rulesets/src/main/resources/content/ionreporter514'
alias scripts='cd ~/checkout/oncomine-variant-annotation-tool/ovat/src/main/resources/scripts/'
alias dc='cd ~/checkout/oncomine-variant-annotation-tool/ovat/src/main/resources/test_artifacts/data_consistency'
alias ov='cd ~/checkout/oncomine-variant-annotation-tool'
alias content='cd ~/checkout/oncomine-variant-annotation-tool/ovat/src/main/resources/content_builds'
alias vcfs='cd ~/checkout/oncomine-variant-annotation-tool/oncomine-rulesets/src/test/resources/vcf'

# LIFE LAB dir aliases
alias lifelab='cd ~/checkout/lifelab_support'
alias janssen='cd ~/checkout/lifelab_support/Janssen'
alias corelims='cd ~/checkout/lifelab_support/Corelims'

# Util to display tsv cols
cols() {
    head -n1 "$1" | tr '\t' '\n' | nl -ba
}

# Customization of pep8 routine
my_pep8() {
    pycodestyle --max-line-length=120 --ignore=E127,E128,E402,E722,W504 "$1"
}

export PATH="/usr/local/opt/tcl-tk/bin:$PATH"
