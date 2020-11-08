ScanTarget=$GITHUB_WORKSPACE
/tools/appinspector analyze -c high -s "$ScanTarget" -f json -o ApplicationInspector.json
cat ApplicationInspector.json
