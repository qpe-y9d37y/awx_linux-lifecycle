#!/bin/bash

set -x

########################################################################
# Bash                                                   Quentin Petit #
# January 2020                                 <petit.quent@gmail.com> #
#                                                                      #
#                                                                      #
#                                                                      #
#                              stretch.sh                              #
#                                                                      #
#                                                                      #
#                                                                      #
# Current version: 0.1                                                 #
# Status: Development in progress                                      #
#                                                                      #
# This script purpose it to add, commit and push to git in one         #
# command.                                                             #
#                                                                      #
#                                                                      #
#                                                                      #
# Version history:                                                     #
# +----------+------------+------+-----------------------------------+ #
# |   Date   |   Author   | Vers | Comment                           | #
# +----------+------------+------+-----------------------------------+ #
# | 20200114 | Quentin P. | 0.1  | Starting development              | #
# +----------+------------+------+-----------------------------------+ #
#                                                                      #
########################################################################

#                                                                      #
#                               FUNCTIONS                              #
#                                                                      #

function usage {
  echo "usage: stretch.sh [-h] [FILES] [COMMENT]

Add, commit and push to git

arguments:
  -h, --help      show this help message and exit
  FILES           files to add to git
  COMMENT         commit message"
}

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
#                                                                      #
#                               BEGINNING                              #
#                                                                      #

# Check if help is requested
if [[ -z ${1} ]] || [[ ${1} == "-h" ]] || [[ ${1} == "--help" ]]; then
  usage && exit 0
fi

# Check if args are set correctly
if [[ -z ${2} ]]; then
  echo "Error: missing argument."
  usage && exit 1
else
  FILES=${1}
  COMMENT=${2}
fi

# Check if files exist
for file in ${FILES}; do
  if [[ ! -e ${file} ]]; then
    echo "Error: ${file} doesn't exist"
    usage && exit 1
  fi
done

# Git
git add ${FILES}
git commit -m "${COMMENT}"
git push

#                                                                      #
#                                  END                                 #
#                                                                      #
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
