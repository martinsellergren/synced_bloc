// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'compass_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SetCompassDegrees _$$_SetCompassDegreesFromJson(Map<String, dynamic> json) =>
    _$_SetCompassDegrees(
      (json['degrees'] as num).toDouble(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$_SetCompassDegreesToJson(
        _$_SetCompassDegrees instance) =>
    <String, dynamic>{
      'degrees': instance.degrees,
      'runtimeType': instance.$type,
    };

_$_SetRefreshRate _$$_SetRefreshRateFromJson(Map<String, dynamic> json) =>
    _$_SetRefreshRate(
      json['fps'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$_SetRefreshRateToJson(_$_SetRefreshRate instance) =>
    <String, dynamic>{
      'fps': instance.fps,
      'runtimeType': instance.$type,
    };

_$_ToggleShowMarker _$$_ToggleShowMarkerFromJson(Map<String, dynamic> json) =>
    _$_ToggleShowMarker(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$_ToggleShowMarkerToJson(_$_ToggleShowMarker instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$_CompassState _$$_CompassStateFromJson(Map<String, dynamic> json) =>
    _$_CompassState(
      degrees: (json['degrees'] as num).toDouble(),
      fps: json['fps'] as int,
      showMarker: json['showMarker'] as bool,
    );

Map<String, dynamic> _$$_CompassStateToJson(_$_CompassState instance) =>
    <String, dynamic>{
      'degrees': instance.degrees,
      'fps': instance.fps,
      'showMarker': instance.showMarker,
    };
