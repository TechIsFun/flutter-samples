#!/usr/bin/env bash

############
# https://github.com/microsoft/appcenter/blob/master/sample-build-scripts/flutter/ios-build/appcenter-post-clone.sh
###########

# fail if any command fails
set -e
# debug log
set -x

cd ..
git clone -b stable https://github.com/flutter/flutter.git
export PATH=`pwd`/flutter/bin:$PATH

flutter channel stable
flutter doctor

echo "Installed flutter to `pwd`/flutter"

flutter pub get

# build
flutter build ios --release --no-codesign --build-number APPCENTER_BUILD_ID

# execute tests
flutter test

