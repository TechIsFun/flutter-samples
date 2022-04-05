#!/usr/bin/env bash

##################
# https://github.com/microsoft/appcenter/blob/master/sample-build-scripts/flutter/android-build/appcenter-post-clone.sh
##################

cd ..

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

# build APK
echo "storePassword=$KEY_STORE_PASSWORD" >> android/key.properties
echo "keyPassword=$KEY_PASSWORD" >> android/key.properties
echo "keyAlias=$KEY_ALIAS" >> android/key.properties
echo "storeFile=keystore.jks" >> android/key.properties
flutter build apk --release --build-number $APPCENTER_BUILD_ID --build-number $((VERSION_CODE_OFFSET + APPCENTER_BUILD_ID))
flutter build appbundle --target-platform android-arm,android-arm64,android-x64 --build-number $((VERSION_CODE_OFFSET + APPCENTER_BUILD_ID))

# execute tests
flutter test

# copy the APK where AppCenter will find it
mkdir -p android/app/build/outputs/apk/;
cp build/app/outputs/apk/release/app-release.apk android/app/build/outputs/apk/
mkdir -p android/app/build/outputs/bundle/;
mv build/app/outputs/bundle/release/app-release.aab $_
