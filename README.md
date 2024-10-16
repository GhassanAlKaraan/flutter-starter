# Flutter Starter

An opinionated starter project for Flutter mobile apps.

Uses FVM stable (Flutter 3.24.3)

## Getting Started

1. **Get the template**

    ```bash
    git clone https://github.com/ghassanalkaraan/flutter-starter.git
    ```

2. **Install dependencies**

    ```bash
    flutter pub get
    ```

3. **Application Bundle Name**

   To change the application bundle name using [change_app_package_name](https://pub.dev/packages/change_app_package_name), run the following command:

   ```bash
   flutter pub run change_app_package_name:main <com.new.package.name>
   ```

4. **Application Name**

   Manually change your app's user-readable label - the `CFBundleName` and/or `CFBundleDisplayName` within the `Info.plist` (for iOS) and `android:label` field in your application node in `AndroidManifest.xml` (for Android).

   **NOTE**: You'll also need to change your package `name` and `description` within `pubspec.yaml`

5. **Application Icon**

    To change the application icon, you can use the [flutter_launcher_icons](https://pub.dev/packages/flutter_launcher_icons) package, copy the image you want to make your launcher icons out of to `assets/icon/icon.png.` then run the below:

    ```bash
    flutter pub run flutter_launcher_icons
    ```

6. **Application Splash Screen**

    To change the application splash screen, you can use the [flutter_native_splash](https://pub.dev/packages/flutter_native_splash) package, copy the image you want to make your splash screen out of to `assets/splash/splash.png.` then run the below:

    ```bash
    flutter pub run flutter_native_splash:create
    ```

7. **Environement Variables**

    To use environment variables, check out the [flutter_dotenv](https://pub.dev/packages/flutter_dotenv) package.

8. **Firebase Reporting**

   In this step, we are going to integrate different Firebase Reporting Tools into your app.

   * Create your Firebase project on the [Firebase Console](https://console.firebase.google.com/)
   * Download your `GoogleService-Info.plist` & `google-services.json` and drop them into their corresponding folders for iOS and Android. Then add them to `.gitignore`

9. **TODOs**

   Locate any `TODOs` and get that sorted.

10. **Start working**

   Now go start working on your app. Happy coding.

## Deploy

Before releasing your Android app, make sure to sign it by a [Keystore file](https://flutter.dev/docs/deployment/android#create-a-keystore)

More info to be added here soon...
