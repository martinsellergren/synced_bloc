# synced_bloc plugin

A [bloc](https://pub.dev/packages/flutter_bloc) that is synced through platform channels.

## Overview

Transform any bloc into a sync master and access it anywhere within the app where platform channels are accessible. You can for example share a bloc between different flutter instances and even access it in native code. This works by transforming states and events to json and sending it over platform channels.

Note: currently only android supported.

## Motivation

So far I've discovered two scenarios where this package is of great help:
- Add-to-app scenario
  - Maintain app dependencies in dart and share them with any flutter instances and native code.
  - See [example/add_to_android_app](https://github.com/mase7569/synced_bloc/tree/master/example/add_to_android_app)
- Hosting native views
  - Maintain the view's state in dart and share it with native code. No need for pigeon setup or any native state management.
  - See [example/host_native_android_view](https://github.com/mase7569/synced_bloc/tree/master/example/host_native_android_view)

## Usage

### Transform any bloc into a sync master

1) Use `with SyncMasterMixin`
2) First call in constructor: `setupSyncMaster(...)`

Example:
```dart
class AuthBloc extends Bloc<AuthEvent, AuthState> with SyncMasterMixin {
  AuthBloc() : super(const _LoggedOut()) {
    setupSyncMaster(
        masterId: 'AuthBloc',
        stateToJson: (state) => state.toJson(),
        eventFromJson: (json) => AuthEvent.fromJson(json));
    on<_LogIn>(_onLogIn);
    on<_LogOut>(_onLogOut);
  }

  Future<void> _onLogIn(_LogIn event, Emitter<AuthState> emit) async {
    final state = this.state;
    if (state is! _LoggedOut) return;
    emit(state.copyWith(isLoginLoading: true, hasLoginError: false));
    await Future.delayed(const Duration(seconds: 1));
    emit(
        AuthState.loggedIn(userProfile: UserProfile(username: event.username)));
  }

  Future<void> _onLogOut(_LogOut event, Emitter<AuthState> emit) async {
    final state = this.state;
    if (state is! _LoggedIn) return;
    emit(state.copyWith(isLogoutLoading: true, hasLogoutError: false));
    await Future.delayed(const Duration(seconds: 1));
    emit(const AuthState.loggedOut());
  }
}
```

Create the bloc as usual, e.g:
```dart
AuthBloc authBloc = AuthBloc();
```

Note:
- masterId must be unique within app.
- stateToJson and eventFromJson is a breeze with freezed and json_serializable.

### Access the bloc in dart (e.g in another flutter instance)

1) Use `with SyncSlaveMixin`
2) First call in constructor `setupSyncSlave(...)`

Example:
```dart
class AuthBlocSlave extends Bloc<AuthEvent, AuthState>
    with SyncSlaveMixin
    implements AuthBloc {

  AuthBlocSlave({required String id, AuthState? initialState})
      : super(initialState ?? const AuthState.loggedOut()) {
    setupSyncSlave(
        masterId: 'AuthBloc', //AuthBloc is the masterId
        slaveId: id,
        stateFromJson: (json) => AuthState.fromJson(json),
        eventToJson: (event) => event.toJson());
  }

  // Either
  // If important that slave's state is completely in sync right from the start.
  static Future<AuthBlocSlave> create({required String id}) async {
    AuthState masterState = await SyncSlaveMixin.getMasterState(
        masterId: 'AuthBloc', fromJson: (json) => AuthState.fromJson(json));
    return AuthBlocSlave(id: id, initialState: masterState);
  }

  // Or
  // Here, slave's initial state might not be same as master's, but will automatically transition
  // to master's state in just a few milliseconds.
  // Note, in this case you might just as well use the constructor with a default parameter for initial
  // State.
  static AuthBlocSlave create({required String id}) {
    return AuthBlocSlave(id: id, initialState: const AuthState.loggedOut());
  }
}
```

Create the SyncSlave (note: the type is AuthBloc, just as master's):
```dart
AuthBloc authBloc = AuthBlocSlave.create(id: 'whatever');
```

Note:
- Each master can have any number of slaves.
- (masterId, slaveId) must to be unique within app.
- stateFromJson, eventToJson is a breeze with freezed and json_serializable.
- Use a different library (i.e dart-file) than sync master's library - otherwise you'll see a compile time error.

### Access the bloc in native code

Simply:

```kotlin
NativeSyncSlave.withMasterId("AuthBloc") //AuthBloc is the masterId
```

You might wanna refine this "bloc" a bit since its state and events are all json. You could e.g create a new native bloc object which handles converting json-to-native for the state and native-to-json for events. It's usually easy to convert between json and native objects, just use a tool such as https://jsonformatter.org/json-to-kotlin.

[An example of this here](https://github.com/mase7569/synced_bloc/blob/master/example/host_native_android_view/android/app/src/main/kotlin/dev/masel/host_native_android_view/CompassBloc.kt)

## Add-to-app scenario

### Motivation

- [Add-to-app official docs](https://docs.flutter.dev/development/add-to-app)
- [Using multiple instances is convenient and officially recommended](https://docs.flutter.dev/development/add-to-app/multiple-flutters)
- [As mentioned here, communication between instances is handled using platform channels](https://docs.flutter.dev/development/add-to-app/multiple-flutters#communication).

So, how can this package help here? Again, **let's take auth handling as an example**.

So, you start of with native implementations of your app. At this point, there is auth state handling implemented natively. Now you want to add flutter modules which depend on auth state. One way is to make the module depend on platform channel interfaces to get the auth state from native platform using communication over platform channel with e.g [pigeon](https://pub.dev/packages/pigeon). Some limitations with this approach though:
- Accessing the state will always be async, as platform channels are async.
- Non-trivial to listen to auth changes in the module (as you might have other modules which also want to listen to auth changes, and platform channels can only have one handler so sending messages over a platform channel from native to dart can only be intercepted by one module).
- Need to setup the communication in dart and native code (Pigeon will help but still some work).
- Once it's time to move the modules into a flutter platform, it's not perfectly trivial to do so as the modules depend on platform channel based interfaces, and now instead need to communicate with the flutter platform.

With this package, the whole process is simplified. Instead of above method, start by creating a sync master AuthBloc in dart and let any flutter modules and native views depend on this AuthBloc instead of any native auth handling implementation. Now, actually all limitations with previous method mentioned above are eliminated.

### Ehm, some more details please

On native app startup, create (and cache) any flutter modules you have - including a **dependency maintainer** module. The dependency maintainer doesn't have any ui, it only creates and maintains dependency objects (sync master blocs!). It's running during the whole app lifecycle and provides dependencies to other modules/ native views. Anyone can access the AuthBloc by creating a sync slave. Any native view (i.e not yet migrated to flutter) that needs to access e.g the auth state should make use of the dependency maintainer's AuthBloc for auth handling instead of the old native implementation, so the AuthBloc is correctly updated etc.

Please see [example/add_to_android_app](https://github.com/mase7569/synced_bloc/tree/master/example/add_to_android_app) for more details.

## FAQ

### Can I sync blocs between isolates

No, unfortunately flutter doesn't currently support setting up method call handlers in other isolates than the main isolate. Checkout https://pub.dev/packages/isolate_bloc instead.