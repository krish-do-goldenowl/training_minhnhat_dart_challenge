# gallery_widgets

A Flutter project working on gallery widget tickets

## How to run fastlane

1. [Install fastlane](https://docs.fastlane.tools/)
2. Extract folder `upstore_credentials` from `upstore_credentials.zip` and put it in the `android` folder
3. Open 'android/fastlane/Fastlane' and un-comment:
   - Block ```
      previous_build_number = google_play_track_version_codes(
        track: "internal",
        json_key: json_key_file_path,
      )[0]
      current_build_number = previous_build_number + 1
      puts "current_build_number: #{current_build_number}"```
   to get the current version code on play store
   - Line `gradle(task: "clean bundleRelease")` to build a `app-release.aab` file at `build\app\outputs\bundle\release\`
   - Block ```
      upload_to_play_store(
        json_key: json_key_file_path,
        track: "internal",
        release_status: "draft",
        <!-- # skip_upload_changelogs: true, -->
        aab: "../build/app/outputs/bundle/release/app-release.aab"
      )```
   to upload the `app-release.aab` file to play store
4. Open terminal and run `cd android`
5. Run `fastlane deploy`