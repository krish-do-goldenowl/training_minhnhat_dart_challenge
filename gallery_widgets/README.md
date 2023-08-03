# gallery_widgets

A Flutter project working on gallery widget tickets

## How to run fastlane

1. [Install fastlane](https://docs.fastlane.tools/)
2. Run `flutter build aab` or `flutter build apk --release` at least once to generate the needed gradlew files
3. Extract folder `upstore_credentials` from `upstore_credentials.zip` and put it in the `android` folder
4. Open terminal and run `cd android`
5. Run `fastlane deploy`
6. If upload failed, try to increase the version code (and version name if want to) in `android/app/build.gradle` manually and run `fastlane deploy` again