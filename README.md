
Training App - A Flutter App for trainig (using video_player package)

Introduction

This is a Flutter app designed to provide a platform for learning through video-based sport exercises . It utilizes the powerful `video_player` package to stream and display videos effectively.

Features

- Video Playback: Play video content smoothly using the `video_player` package.
- [Optional Features (add as you implement them)]
    - Video Controls (play/pause, seek bar)
    - Playlist Management
    - classification of exercises

Setup

1. Prerequisites:
    - Ensure you have Flutter installed following the official guide: [https://docs.flutter.dev/get-started/install](https://docs.flutter.dev/get-started/install)
    - Basic understanding of Flutter development.

2. Dependencies:

   ```yaml
   dependencies:
     flutter:
       sdk: flutter

     # Video Player Package
     video_player: ^2.9.1  # Update to the latest version
   ```

   Add the above dependency (`video_player`) to your `pubspec.yaml` file.

3. Permissions (Android):

   If you're using network-based videos on Android, add the following permission to your `AndroidManifest.xml` file:

   ```xml
   <uses-permission android:name="android.permission.INTERNET" />
   ```

Running the App

1. Open your project in a code editor.
2. Run the app on a physical device or emulator using `flutter run`.

License

This project is licensed under the MIT License. See the `LICENSE` file for details.

Further Exploration

- Explore the `video_player` package documentation for more advanced video playback features: [https://pub.dev/packages/video_player](https://pub.dev/packages/video_player)

