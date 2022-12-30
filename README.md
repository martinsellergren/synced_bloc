# synced_bloc

A bloc (https://pub.dev/packages/flutter_bloc) that is synced anywhere within the app.

## Add to app module dependencies
This plugin is very helpful to simplify adding modules to existing an existing app ()...

We need to add multiple modules into the native app (one for handing dependencies, others for ui replacements). So we need an "umbrella" module (which expose multiple modules through entry-points in main.dart) such as this: https://github.com/flutter/samples/blob/main/add_to_app/multiple_flutters/multiple_flutters_module/lib/main.dart, and follow official instructions to add it to an app: https://docs.flutter.dev/development/add-to-app/android/project-setup


### Umbrella

```dart
@pragma('vm:entry-point')
void dependencyMaintainer() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Dependencies.create();
  runApp(const MaterialApp());
}
```

## Todo
- cubit support