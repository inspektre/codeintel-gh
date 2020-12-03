#!/bin/bash

# $1 is the path relative to repo root to scan
# $2 is the output path relative to repo root.
# $3 is the output format
# $4 is the comma separated list to pass to ignore
# $5 is the arguments

# if [ ${3,,} = "html" ]; then
#     echo "html output is not supported in the GitHub Action."
#     exit -1
# fi

# if [ "$1" = "GITHUB_WORKSPACE" ]; then
# else
#     ScanTarget=$GITHUB_WORKSPACE/$1
# fi

# if [ "$2" = "AppInspectorResults" ]; then
#     OutputPath=$GITHUB_WORKSPACE/AppInspectorResults.json
# else
#     OutputPath=$GITHUB_WORKSPACE/$2
# fi

ScanTarget=$GITHUB_WORKSPACE
OutputPath=$GITHUB_WORKSPACE/AppInspectorResults.json

cd $GITHUB_WORKSPACE
pwd
ls -al $GITHUB_WORKSPACE

/tools/appinspector analyze -s $ScanTarget -o $OutputPath -f $3 $IgnoreArg $5
