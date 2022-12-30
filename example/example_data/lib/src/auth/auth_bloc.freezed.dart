// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AuthEvent _$AuthEventFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'logIn':
      return _LogIn.fromJson(json);
    case 'logOut':
      return _LogOut.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'AuthEvent',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$AuthEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String username) logIn,
    required TResult Function() logOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String username)? logIn,
    TResult? Function()? logOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String username)? logIn,
    TResult Function()? logOut,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LogIn value) logIn,
    required TResult Function(_LogOut value) logOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LogIn value)? logIn,
    TResult? Function(_LogOut value)? logOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LogIn value)? logIn,
    TResult Function(_LogOut value)? logOut,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthEventCopyWith<$Res> {
  factory $AuthEventCopyWith(AuthEvent value, $Res Function(AuthEvent) then) =
      _$AuthEventCopyWithImpl<$Res, AuthEvent>;
}

/// @nodoc
class _$AuthEventCopyWithImpl<$Res, $Val extends AuthEvent>
    implements $AuthEventCopyWith<$Res> {
  _$AuthEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_LogInCopyWith<$Res> {
  factory _$$_LogInCopyWith(_$_LogIn value, $Res Function(_$_LogIn) then) =
      __$$_LogInCopyWithImpl<$Res>;
  @useResult
  $Res call({String username});
}

/// @nodoc
class __$$_LogInCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$_LogIn>
    implements _$$_LogInCopyWith<$Res> {
  __$$_LogInCopyWithImpl(_$_LogIn _value, $Res Function(_$_LogIn) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
  }) {
    return _then(_$_LogIn(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LogIn implements _LogIn {
  const _$_LogIn({required this.username, final String? $type})
      : $type = $type ?? 'logIn';

  factory _$_LogIn.fromJson(Map<String, dynamic> json) =>
      _$$_LogInFromJson(json);

  @override
  final String username;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'AuthEvent.logIn(username: $username)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LogIn &&
            (identical(other.username, username) ||
                other.username == username));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, username);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LogInCopyWith<_$_LogIn> get copyWith =>
      __$$_LogInCopyWithImpl<_$_LogIn>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String username) logIn,
    required TResult Function() logOut,
  }) {
    return logIn(username);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String username)? logIn,
    TResult? Function()? logOut,
  }) {
    return logIn?.call(username);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String username)? logIn,
    TResult Function()? logOut,
    required TResult orElse(),
  }) {
    if (logIn != null) {
      return logIn(username);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LogIn value) logIn,
    required TResult Function(_LogOut value) logOut,
  }) {
    return logIn(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LogIn value)? logIn,
    TResult? Function(_LogOut value)? logOut,
  }) {
    return logIn?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LogIn value)? logIn,
    TResult Function(_LogOut value)? logOut,
    required TResult orElse(),
  }) {
    if (logIn != null) {
      return logIn(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_LogInToJson(
      this,
    );
  }
}

abstract class _LogIn implements AuthEvent {
  const factory _LogIn({required final String username}) = _$_LogIn;

  factory _LogIn.fromJson(Map<String, dynamic> json) = _$_LogIn.fromJson;

  String get username;
  @JsonKey(ignore: true)
  _$$_LogInCopyWith<_$_LogIn> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_LogOutCopyWith<$Res> {
  factory _$$_LogOutCopyWith(_$_LogOut value, $Res Function(_$_LogOut) then) =
      __$$_LogOutCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LogOutCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$_LogOut>
    implements _$$_LogOutCopyWith<$Res> {
  __$$_LogOutCopyWithImpl(_$_LogOut _value, $Res Function(_$_LogOut) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$_LogOut implements _LogOut {
  const _$_LogOut({final String? $type}) : $type = $type ?? 'logOut';

  factory _$_LogOut.fromJson(Map<String, dynamic> json) =>
      _$$_LogOutFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'AuthEvent.logOut()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_LogOut);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String username) logIn,
    required TResult Function() logOut,
  }) {
    return logOut();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String username)? logIn,
    TResult? Function()? logOut,
  }) {
    return logOut?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String username)? logIn,
    TResult Function()? logOut,
    required TResult orElse(),
  }) {
    if (logOut != null) {
      return logOut();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LogIn value) logIn,
    required TResult Function(_LogOut value) logOut,
  }) {
    return logOut(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LogIn value)? logIn,
    TResult? Function(_LogOut value)? logOut,
  }) {
    return logOut?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LogIn value)? logIn,
    TResult Function(_LogOut value)? logOut,
    required TResult orElse(),
  }) {
    if (logOut != null) {
      return logOut(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_LogOutToJson(
      this,
    );
  }
}

abstract class _LogOut implements AuthEvent {
  const factory _LogOut() = _$_LogOut;

  factory _LogOut.fromJson(Map<String, dynamic> json) = _$_LogOut.fromJson;
}

AuthState _$AuthStateFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'loggedOut':
      return _LoggedOut.fromJson(json);
    case 'loggedIn':
      return _LoggedIn.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'AuthState',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$AuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isLoginLoading, bool hasLoginError)
        loggedOut,
    required TResult Function(
            UserProfile userProfile, bool isLogoutLoading, bool hasLogoutError)
        loggedIn,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isLoginLoading, bool hasLoginError)? loggedOut,
    TResult? Function(
            UserProfile userProfile, bool isLogoutLoading, bool hasLogoutError)?
        loggedIn,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoginLoading, bool hasLoginError)? loggedOut,
    TResult Function(
            UserProfile userProfile, bool isLogoutLoading, bool hasLogoutError)?
        loggedIn,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoggedOut value) loggedOut,
    required TResult Function(_LoggedIn value) loggedIn,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoggedOut value)? loggedOut,
    TResult? Function(_LoggedIn value)? loggedIn,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoggedOut value)? loggedOut,
    TResult Function(_LoggedIn value)? loggedIn,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_LoggedOutCopyWith<$Res> {
  factory _$$_LoggedOutCopyWith(
          _$_LoggedOut value, $Res Function(_$_LoggedOut) then) =
      __$$_LoggedOutCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isLoginLoading, bool hasLoginError});
}

/// @nodoc
class __$$_LoggedOutCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$_LoggedOut>
    implements _$$_LoggedOutCopyWith<$Res> {
  __$$_LoggedOutCopyWithImpl(
      _$_LoggedOut _value, $Res Function(_$_LoggedOut) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoginLoading = null,
    Object? hasLoginError = null,
  }) {
    return _then(_$_LoggedOut(
      isLoginLoading: null == isLoginLoading
          ? _value.isLoginLoading
          : isLoginLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasLoginError: null == hasLoginError
          ? _value.hasLoginError
          : hasLoginError // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LoggedOut extends _LoggedOut {
  const _$_LoggedOut(
      {this.isLoginLoading = false,
      this.hasLoginError = false,
      final String? $type})
      : $type = $type ?? 'loggedOut',
        super._();

  factory _$_LoggedOut.fromJson(Map<String, dynamic> json) =>
      _$$_LoggedOutFromJson(json);

  @override
  @JsonKey()
  final bool isLoginLoading;
  @override
  @JsonKey()
  final bool hasLoginError;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'AuthState.loggedOut(isLoginLoading: $isLoginLoading, hasLoginError: $hasLoginError)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoggedOut &&
            (identical(other.isLoginLoading, isLoginLoading) ||
                other.isLoginLoading == isLoginLoading) &&
            (identical(other.hasLoginError, hasLoginError) ||
                other.hasLoginError == hasLoginError));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, isLoginLoading, hasLoginError);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoggedOutCopyWith<_$_LoggedOut> get copyWith =>
      __$$_LoggedOutCopyWithImpl<_$_LoggedOut>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isLoginLoading, bool hasLoginError)
        loggedOut,
    required TResult Function(
            UserProfile userProfile, bool isLogoutLoading, bool hasLogoutError)
        loggedIn,
  }) {
    return loggedOut(isLoginLoading, hasLoginError);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isLoginLoading, bool hasLoginError)? loggedOut,
    TResult? Function(
            UserProfile userProfile, bool isLogoutLoading, bool hasLogoutError)?
        loggedIn,
  }) {
    return loggedOut?.call(isLoginLoading, hasLoginError);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoginLoading, bool hasLoginError)? loggedOut,
    TResult Function(
            UserProfile userProfile, bool isLogoutLoading, bool hasLogoutError)?
        loggedIn,
    required TResult orElse(),
  }) {
    if (loggedOut != null) {
      return loggedOut(isLoginLoading, hasLoginError);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoggedOut value) loggedOut,
    required TResult Function(_LoggedIn value) loggedIn,
  }) {
    return loggedOut(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoggedOut value)? loggedOut,
    TResult? Function(_LoggedIn value)? loggedIn,
  }) {
    return loggedOut?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoggedOut value)? loggedOut,
    TResult Function(_LoggedIn value)? loggedIn,
    required TResult orElse(),
  }) {
    if (loggedOut != null) {
      return loggedOut(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_LoggedOutToJson(
      this,
    );
  }
}

abstract class _LoggedOut extends AuthState {
  const factory _LoggedOut(
      {final bool isLoginLoading, final bool hasLoginError}) = _$_LoggedOut;
  const _LoggedOut._() : super._();

  factory _LoggedOut.fromJson(Map<String, dynamic> json) =
      _$_LoggedOut.fromJson;

  bool get isLoginLoading;
  bool get hasLoginError;
  @JsonKey(ignore: true)
  _$$_LoggedOutCopyWith<_$_LoggedOut> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_LoggedInCopyWith<$Res> {
  factory _$$_LoggedInCopyWith(
          _$_LoggedIn value, $Res Function(_$_LoggedIn) then) =
      __$$_LoggedInCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {UserProfile userProfile, bool isLogoutLoading, bool hasLogoutError});

  $UserProfileCopyWith<$Res> get userProfile;
}

/// @nodoc
class __$$_LoggedInCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$_LoggedIn>
    implements _$$_LoggedInCopyWith<$Res> {
  __$$_LoggedInCopyWithImpl(
      _$_LoggedIn _value, $Res Function(_$_LoggedIn) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userProfile = null,
    Object? isLogoutLoading = null,
    Object? hasLogoutError = null,
  }) {
    return _then(_$_LoggedIn(
      userProfile: null == userProfile
          ? _value.userProfile
          : userProfile // ignore: cast_nullable_to_non_nullable
              as UserProfile,
      isLogoutLoading: null == isLogoutLoading
          ? _value.isLogoutLoading
          : isLogoutLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasLogoutError: null == hasLogoutError
          ? _value.hasLogoutError
          : hasLogoutError // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $UserProfileCopyWith<$Res> get userProfile {
    return $UserProfileCopyWith<$Res>(_value.userProfile, (value) {
      return _then(_value.copyWith(userProfile: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$_LoggedIn extends _LoggedIn {
  const _$_LoggedIn(
      {required this.userProfile,
      this.isLogoutLoading = false,
      this.hasLogoutError = false,
      final String? $type})
      : $type = $type ?? 'loggedIn',
        super._();

  factory _$_LoggedIn.fromJson(Map<String, dynamic> json) =>
      _$$_LoggedInFromJson(json);

  @override
  final UserProfile userProfile;
  @override
  @JsonKey()
  final bool isLogoutLoading;
  @override
  @JsonKey()
  final bool hasLogoutError;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'AuthState.loggedIn(userProfile: $userProfile, isLogoutLoading: $isLogoutLoading, hasLogoutError: $hasLogoutError)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoggedIn &&
            (identical(other.userProfile, userProfile) ||
                other.userProfile == userProfile) &&
            (identical(other.isLogoutLoading, isLogoutLoading) ||
                other.isLogoutLoading == isLogoutLoading) &&
            (identical(other.hasLogoutError, hasLogoutError) ||
                other.hasLogoutError == hasLogoutError));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, userProfile, isLogoutLoading, hasLogoutError);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoggedInCopyWith<_$_LoggedIn> get copyWith =>
      __$$_LoggedInCopyWithImpl<_$_LoggedIn>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isLoginLoading, bool hasLoginError)
        loggedOut,
    required TResult Function(
            UserProfile userProfile, bool isLogoutLoading, bool hasLogoutError)
        loggedIn,
  }) {
    return loggedIn(userProfile, isLogoutLoading, hasLogoutError);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isLoginLoading, bool hasLoginError)? loggedOut,
    TResult? Function(
            UserProfile userProfile, bool isLogoutLoading, bool hasLogoutError)?
        loggedIn,
  }) {
    return loggedIn?.call(userProfile, isLogoutLoading, hasLogoutError);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoginLoading, bool hasLoginError)? loggedOut,
    TResult Function(
            UserProfile userProfile, bool isLogoutLoading, bool hasLogoutError)?
        loggedIn,
    required TResult orElse(),
  }) {
    if (loggedIn != null) {
      return loggedIn(userProfile, isLogoutLoading, hasLogoutError);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoggedOut value) loggedOut,
    required TResult Function(_LoggedIn value) loggedIn,
  }) {
    return loggedIn(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoggedOut value)? loggedOut,
    TResult? Function(_LoggedIn value)? loggedIn,
  }) {
    return loggedIn?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoggedOut value)? loggedOut,
    TResult Function(_LoggedIn value)? loggedIn,
    required TResult orElse(),
  }) {
    if (loggedIn != null) {
      return loggedIn(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_LoggedInToJson(
      this,
    );
  }
}

abstract class _LoggedIn extends AuthState {
  const factory _LoggedIn(
      {required final UserProfile userProfile,
      final bool isLogoutLoading,
      final bool hasLogoutError}) = _$_LoggedIn;
  const _LoggedIn._() : super._();

  factory _LoggedIn.fromJson(Map<String, dynamic> json) = _$_LoggedIn.fromJson;

  UserProfile get userProfile;
  bool get isLogoutLoading;
  bool get hasLogoutError;
  @JsonKey(ignore: true)
  _$$_LoggedInCopyWith<_$_LoggedIn> get copyWith =>
      throw _privateConstructorUsedError;
}

UserProfile _$UserProfileFromJson(Map<String, dynamic> json) {
  return _UserProfile.fromJson(json);
}

/// @nodoc
mixin _$UserProfile {
  String get username => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserProfileCopyWith<UserProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProfileCopyWith<$Res> {
  factory $UserProfileCopyWith(
          UserProfile value, $Res Function(UserProfile) then) =
      _$UserProfileCopyWithImpl<$Res, UserProfile>;
  @useResult
  $Res call({String username});
}

/// @nodoc
class _$UserProfileCopyWithImpl<$Res, $Val extends UserProfile>
    implements $UserProfileCopyWith<$Res> {
  _$UserProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
  }) {
    return _then(_value.copyWith(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserProfileCopyWith<$Res>
    implements $UserProfileCopyWith<$Res> {
  factory _$$_UserProfileCopyWith(
          _$_UserProfile value, $Res Function(_$_UserProfile) then) =
      __$$_UserProfileCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String username});
}

/// @nodoc
class __$$_UserProfileCopyWithImpl<$Res>
    extends _$UserProfileCopyWithImpl<$Res, _$_UserProfile>
    implements _$$_UserProfileCopyWith<$Res> {
  __$$_UserProfileCopyWithImpl(
      _$_UserProfile _value, $Res Function(_$_UserProfile) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
  }) {
    return _then(_$_UserProfile(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserProfile implements _UserProfile {
  const _$_UserProfile({required this.username});

  factory _$_UserProfile.fromJson(Map<String, dynamic> json) =>
      _$$_UserProfileFromJson(json);

  @override
  final String username;

  @override
  String toString() {
    return 'UserProfile(username: $username)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserProfile &&
            (identical(other.username, username) ||
                other.username == username));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, username);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserProfileCopyWith<_$_UserProfile> get copyWith =>
      __$$_UserProfileCopyWithImpl<_$_UserProfile>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserProfileToJson(
      this,
    );
  }
}

abstract class _UserProfile implements UserProfile {
  const factory _UserProfile({required final String username}) = _$_UserProfile;

  factory _UserProfile.fromJson(Map<String, dynamic> json) =
      _$_UserProfile.fromJson;

  @override
  String get username;
  @override
  @JsonKey(ignore: true)
  _$$_UserProfileCopyWith<_$_UserProfile> get copyWith =>
      throw _privateConstructorUsedError;
}
