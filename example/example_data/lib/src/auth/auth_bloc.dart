import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:synced_bloc/synced_bloc.dart';

part 'auth_bloc.freezed.dart';
part 'auth_bloc.g.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> with SyncMasterMixin {
  AuthBloc() : super(const _LoggedOut()) {
    setupSyncMaster(
        masterId: 'auth',
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
