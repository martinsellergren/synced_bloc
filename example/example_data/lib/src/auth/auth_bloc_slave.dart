import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:synced_bloc/synced_bloc_mixin.dart';

import 'auth_bloc.dart';

class AuthBlocSlave extends Bloc<AuthEvent, AuthState>
    with SyncSlaveMixin
    implements AuthBloc {
  AuthBlocSlave({required String id, AuthState? initialState})
      : super(initialState ?? const AuthState.loggedOut()) {
    setupSyncSlave(
        masterId: 'AuthBloc',
        slaveId: id,
        stateFromJson: (json) => AuthState.fromJson(json),
        eventToJson: (event) => event.toJson());
  }

  static Future<AuthBlocSlave> create({required String id}) async {
    AuthState masterState = await SyncSlaveMixin.getMasterState(
        masterId: 'AuthBloc', fromJson: (json) => AuthState.fromJson(json));
    return AuthBlocSlave(id: id, initialState: masterState);
  }

  // static AuthBlocSlave create({required String id}) {
  //   return AuthBlocSlave(id: id, initialState: const AuthState.loggedOut());
  // }
}
