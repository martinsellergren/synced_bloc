import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:synced_bloc/synced_bloc_mixin.dart';

import 'auth_bloc.dart';

class AuthBlocSubscriber extends Bloc<AuthEvent, AuthState>
    with SyncSubscriberMixin
    implements AuthBloc {
  AuthBlocSubscriber({required String id, AuthState? initialState})
      : super(initialState ?? const AuthState.loggedOut()) {
    setupSyncSubscriber(
        masterId: 'auth',
        subscriberId: id,
        stateFromJson: (json) => AuthState.fromJson(json),
        eventToJson: (event) => event.toJson());
  }

  static Future<AuthBlocSubscriber> create({required String id}) async {
    AuthState masterState = await SyncSubscriberMixin.getMasterState(
        masterId: 'auth', fromJson: (json) => AuthState.fromJson(json));
    return AuthBlocSubscriber(id: id, initialState: masterState);
  }
}
