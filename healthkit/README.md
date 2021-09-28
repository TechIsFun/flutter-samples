# healthkit

## Setup
1. Append the Info.plist with the following 2 entries
```
<key>NSHealthShareUsageDescription</key>
<string>We will sync your data with the Apple Health app to give you better insights</string>
<key>NSHealthUpdateUsageDescription</key>
<string>We will sync your data with the Apple Health app to give you better insights</string>
```
2. Enable "HealthKit" inside the "Capabilities" tab in XCode