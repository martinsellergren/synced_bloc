part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const AuthState._();

  const factory AuthState.loggedOut({
    @Default(false) bool isLoginLoading,
    @Default(false) bool hasLoginError,
  }) = _LoggedOut;

  const factory AuthState.loggedIn({
    required UserProfile userProfile,
    @Default(false) bool isLogoutLoading,
    @Default(false) bool hasLogoutError,
  }) = _LoggedIn;

  factory AuthState.fromJson(Map<String, dynamic> json) =>
      _$AuthStateFromJson(json);

  bool get isLoggedIn =>
      map(loggedOut: (value) => false, loggedIn: (value) => true);

  bool get isLoading => map(
      loggedOut: (value) => value.isLoginLoading,
      loggedIn: (value) => value.isLogoutLoading);
}

@freezed
class UserProfile with _$UserProfile {
  const factory UserProfile({
    required String username,
  }) = _UserProfile;

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);
}
