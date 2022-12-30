part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.logIn({required String username}) = _LogIn;
  const factory AuthEvent.logOut() = _LogOut;

  factory AuthEvent.fromJson(Map<String, dynamic> json) =>
      _$AuthEventFromJson(json);
}
