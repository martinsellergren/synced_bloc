// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LogIn _$$_LogInFromJson(Map<String, dynamic> json) => _$_LogIn(
      username: json['username'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$_LogInToJson(_$_LogIn instance) => <String, dynamic>{
      'username': instance.username,
      'runtimeType': instance.$type,
    };

_$_LogOut _$$_LogOutFromJson(Map<String, dynamic> json) => _$_LogOut(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$_LogOutToJson(_$_LogOut instance) => <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$_LoggedOut _$$_LoggedOutFromJson(Map<String, dynamic> json) => _$_LoggedOut(
      isLoginLoading: json['isLoginLoading'] as bool? ?? false,
      hasLoginError: json['hasLoginError'] as bool? ?? false,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$_LoggedOutToJson(_$_LoggedOut instance) =>
    <String, dynamic>{
      'isLoginLoading': instance.isLoginLoading,
      'hasLoginError': instance.hasLoginError,
      'runtimeType': instance.$type,
    };

_$_LoggedIn _$$_LoggedInFromJson(Map<String, dynamic> json) => _$_LoggedIn(
      userProfile:
          UserProfile.fromJson(json['userProfile'] as Map<String, dynamic>),
      isLogoutLoading: json['isLogoutLoading'] as bool? ?? false,
      hasLogoutError: json['hasLogoutError'] as bool? ?? false,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$_LoggedInToJson(_$_LoggedIn instance) =>
    <String, dynamic>{
      'userProfile': instance.userProfile,
      'isLogoutLoading': instance.isLogoutLoading,
      'hasLogoutError': instance.hasLogoutError,
      'runtimeType': instance.$type,
    };

_$_UserProfile _$$_UserProfileFromJson(Map<String, dynamic> json) =>
    _$_UserProfile(
      username: json['username'] as String,
    );

Map<String, dynamic> _$$_UserProfileToJson(_$_UserProfile instance) =>
    <String, dynamic>{
      'username': instance.username,
    };
