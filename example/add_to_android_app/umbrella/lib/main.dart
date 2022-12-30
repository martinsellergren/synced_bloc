import 'package:example_data/example_data.dart';
import 'package:flutter/material.dart';

import 'completely_migrated_flutter_app.dart';
import 'dependencies.dart';
import 'pages/account_page.dart';
import 'pages/home_page.dart';

@pragma('vm:entry-point')
void dependencyMaintainer() async {
  WidgetsFlutterBinding.ensureInitialized();
  Dependencies();
}

/// The home page is migrated to flutter, and so replaced inside the native app.
@pragma('vm:entry-point')
void homePage() {
  WidgetsFlutterBinding.ensureInitialized();
  final dependencies = Dependencies(syncSlaveId: 'HomePage');
  runApp(MaterialApp(home: HomePage(dependencies: dependencies)));
}

/// Theme page remains to be migrated so keep using native version.
@pragma('vm:entry-point')
void themePage() {
  runApp(const Placeholder());
}

/// Also migrated and replaced in native app.
@pragma('vm:entry-point')
void accountPage() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
      home: AccountPage(
    authBloc: AuthBlocSlave(id: 'HomePage'),
    themeBloc: ThemeBlocSlave(id: 'HomePage'),
  )));
}

// Finally, when whole thing is migrated to flutter platform
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final dependencies = Dependencies();
  runApp(CompletelyMigratedFlutterApp(dependencies: dependencies));
}
