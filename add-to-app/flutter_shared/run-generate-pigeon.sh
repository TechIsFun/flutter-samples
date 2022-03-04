#!/bin/sh

flutter pub run pigeon --input pigeon/schema.dart \
  --dart_out lib/PigeonApi.dart \
  --objc_header_out ../ios-app/Flutter\ Add\ To\ App\ Sample/PigeonApi.h \
  --objc_source_out ../ios-app/Flutter\ Add\ To\ App\ Sample/PigeonApi.m \
  --java_out ../android-app/app/src/main/java/com/github/techisfun/PigeonApi.java \
  --java_package "com.github.techisfun"
