#!/bin/bash

protoc --dart_out=./lib ./protos/person.proto
protoc --swift_out=../ios-app/Flutter\ Add\ To\ App\ Sample/ ./protos/person.proto
