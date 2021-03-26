###############################################################################
# Variables to determine the the command to clone external repositories.
# For each repo there are a set of variables:
#      *_REPO:   URL to the repository in GitHub.
#      *_BRANCH: Name of the branch you wish to clone;
#                Set to 'master' to pull the master branch.
#      *_HASH:   Value of the specific hash you wish to clone;
#                Set to 'head' to pull the head of the branch you want.
# THe CV32E40P repo also has a variable to clone a specific tag:
#      *_TAG:    Value of the specific tag you wish to clone;
#                Will override the HASH unless set to "none".
#                

export SHELL = /bin/bash

CV_CORE_REPO   ?= https://github.com/openhwgroup/cv32e40p
CV_CORE_BRANCH ?= master
CV_CORE_HASH   ?= 120ac3e
CV_CORE_TAG    ?= cv32e40p_v1.0.0
#CV32E40P_TAG    ?= none

RISCVDV_REPO    ?= https://github.com/google/riscv-dv
RISCVDV_BRANCH  ?= master
RISCVDV_HASH		?= 0b625258549e733082c12e5dc749f05aefb07d5a

COMPLIANCE_REPO   ?= https://github.com/riscv/riscv-compliance
COMPLIANCE_BRANCH ?= master
# 2020-08-19
COMPLIANCE_HASH   ?= c21a2e86afa3f7d4292a2dd26b759f3f29cde497
