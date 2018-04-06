alias ll='ls -ltrh'

export PATH=~/.local/bin:$PATH

# added by Miniconda2 4.3.21 installer
export PATH="/Users/fernando.farfan/miniconda2/bin:$PATH"

# Added Maven path
export PATH="/opt/apache-maven-3.5.3/bin:$PATH"

# ORT dir aliases
alias ort='cd ~/checkout/ocp_end_to_end_tests/integrationTests/'

# OVAT dir aliases
alias rset='cd ~/checkout/oncomine-variant-annotation-tool/oncomine-rulesets/src/main/resources/content/ionreporter510'
alias scripts='cd ~/checkout/oncomine-variant-annotation-tool/ovat/src/main/resources/scripts/'
alias dc='cd ~/checkout/oncomine-variant-annotation-tool/ovat/src/main/resources/test_artifacts/data_consistency'
alias ov='cd ~/checkout/oncomine-variant-annotation-tool'
alias content='cd ~/checkout/oncomine-variant-annotation-tool/ovat/src/main/resources/content_builds'
alias vcfs='cd ~/checkout/oncomine-variant-annotation-tool/oncomine-rulesets/src/test/resources/vcf'

# Util to display tsv cols
cols() {
    head -n1 "$1" | tr '\t' '\n' | nl -ba
}

