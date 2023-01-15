# [add_to_android_app](https://github.com/mase7569/synced_bloc/tree/master/example/add_to_android_app)

Showcasing bloc syncing when adding flutter modules to an existing native android app.

- Each module live in its own flutter instance.
- One flutter instance is dedicated to being the dependencyMaintainer, which creates and provides dependencies to other flutter instances/ the native platform.
- 2 dependencies: AuthBloc and ThemeBloc (sync masters).
- 3 tabs:
  - First tab is migrated to flutter and displays auth state from AuthBloc.
  - Second tab also migrated and displays and manipulates auth state (notice how auth state in first tab reacts to changes).
  - Third tab is not migrated, it's an ordinary native fragment, which toggles theme. Notice how the native code here accesses and manipulates the dart code's ThemeBloc, and how the other tabs react to the theme changes.

# [host_native_android_view](https://github.com/mase7569/synced_bloc/tree/master/example/host_native_android_view)

Showcasing bloc syncing when hosting a native android view.

The compass view here is a native android view. The compass view's state (CompassBloc) is created and maintained in dart, and shared with native code. Native code mirrors the bloc's state to render the ui, and also manipulates the state (setting compass degrees according to hardware sensors).

# [flutter_app](https://github.com/mase7569/synced_bloc/tree/master/example/flutter_app)

Just a dummy app with multiple sync masters and sync slaves.