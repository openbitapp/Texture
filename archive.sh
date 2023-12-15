SCHEME_NAME=AsyncDisplayKit
CONFIGURATION=release
IOS_DEVICE_ARCHIVE_PATH=./archives/ios.xcarchive
IOS_SIMULATOR_ARCHIVE_PATH=./archives/ios-sim.xcarchive
FRAMEWORK_NAME="$SCHEME_NAME"
XC_FRAMEWORK_PATH=./AsyncDisplayKit.xcframework

# Archiving for iOS Device
xcodebuild clean archive \
-scheme "${SCHEME_NAME}" \
-configuration "${CONFIGURATION}" \
-sdk iphoneos \
-archivePath "${IOS_DEVICE_ARCHIVE_PATH}" \
-destination generic/platform=iOS \
SKIP_INSTALL=NO \
BUILD_LIBRARY_FOR_DISTRIBUTION=YES

# Archiving for iOS Simulator
xcodebuild clean archive \
-scheme "${SCHEME_NAME}" \
-configuration "${CONFIGURATION}" \
-sdk iphonesimulator \
-archivePath "${IOS_SIMULATOR_ARCHIVE_PATH}" \
-destination generic/platform="iOS Simulator" \
SKIP_INSTALL=NO \
BUILD_LIBRARY_FOR_DISTRIBUTION=YES

# Creating XCFramework
xcodebuild -create-xcframework \
-framework "${IOS_DEVICE_ARCHIVE_PATH}/Products/Library/Frameworks/${FRAMEWORK_NAME}.framework" \
-framework "${IOS_SIMULATOR_ARCHIVE_PATH}/Products/Library/Frameworks/${FRAMEWORK_NAME}.framework" \
-output "${XC_FRAMEWORK_PATH}"