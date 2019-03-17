#!/bin/sh

RESULT_BUNDLE_DIR=$1

if [[ ! -d "${RESULT_BUNDLE_DIR}/CleanAnalyzeTest.result" ]]; then
    echo "Generating CleanAnalyzeTest.result"
    xcodebuild -destination 'platform=iOS Simulator,name=iPhone XR,OS=12.1' -quiet -workspace iOSResultBundleApp.xcworkspace -scheme iOSResultBundleApp clean analyze test -resultBundlePath "${RESULT_BUNDLE_DIR}/CleanAnalyzeTest.result"
fi
