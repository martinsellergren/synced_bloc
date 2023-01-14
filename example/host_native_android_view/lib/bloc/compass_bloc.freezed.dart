// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'compass_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CompassEvent _$CompassEventFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'setCompassDegrees':
      return _SetCompassDegrees.fromJson(json);
    case 'setFps':
      return _SetRefreshRate.fromJson(json);
    case 'toggleShowMarker':
      return _ToggleShowMarker.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'CompassEvent',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$CompassEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(double degrees) setCompassDegrees,
    required TResult Function(String fps) setFps,
    required TResult Function() toggleShowMarker,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(double degrees)? setCompassDegrees,
    TResult? Function(String fps)? setFps,
    TResult? Function()? toggleShowMarker,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double degrees)? setCompassDegrees,
    TResult Function(String fps)? setFps,
    TResult Function()? toggleShowMarker,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SetCompassDegrees value) setCompassDegrees,
    required TResult Function(_SetRefreshRate value) setFps,
    required TResult Function(_ToggleShowMarker value) toggleShowMarker,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SetCompassDegrees value)? setCompassDegrees,
    TResult? Function(_SetRefreshRate value)? setFps,
    TResult? Function(_ToggleShowMarker value)? toggleShowMarker,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SetCompassDegrees value)? setCompassDegrees,
    TResult Function(_SetRefreshRate value)? setFps,
    TResult Function(_ToggleShowMarker value)? toggleShowMarker,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompassEventCopyWith<$Res> {
  factory $CompassEventCopyWith(
          CompassEvent value, $Res Function(CompassEvent) then) =
      _$CompassEventCopyWithImpl<$Res, CompassEvent>;
}

/// @nodoc
class _$CompassEventCopyWithImpl<$Res, $Val extends CompassEvent>
    implements $CompassEventCopyWith<$Res> {
  _$CompassEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_SetCompassDegreesCopyWith<$Res> {
  factory _$$_SetCompassDegreesCopyWith(_$_SetCompassDegrees value,
          $Res Function(_$_SetCompassDegrees) then) =
      __$$_SetCompassDegreesCopyWithImpl<$Res>;
  @useResult
  $Res call({double degrees});
}

/// @nodoc
class __$$_SetCompassDegreesCopyWithImpl<$Res>
    extends _$CompassEventCopyWithImpl<$Res, _$_SetCompassDegrees>
    implements _$$_SetCompassDegreesCopyWith<$Res> {
  __$$_SetCompassDegreesCopyWithImpl(
      _$_SetCompassDegrees _value, $Res Function(_$_SetCompassDegrees) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? degrees = null,
  }) {
    return _then(_$_SetCompassDegrees(
      null == degrees
          ? _value.degrees
          : degrees // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SetCompassDegrees implements _SetCompassDegrees {
  const _$_SetCompassDegrees(this.degrees, {final String? $type})
      : $type = $type ?? 'setCompassDegrees';

  factory _$_SetCompassDegrees.fromJson(Map<String, dynamic> json) =>
      _$$_SetCompassDegreesFromJson(json);

  @override
  final double degrees;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'CompassEvent.setCompassDegrees(degrees: $degrees)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SetCompassDegrees &&
            (identical(other.degrees, degrees) || other.degrees == degrees));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, degrees);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SetCompassDegreesCopyWith<_$_SetCompassDegrees> get copyWith =>
      __$$_SetCompassDegreesCopyWithImpl<_$_SetCompassDegrees>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(double degrees) setCompassDegrees,
    required TResult Function(String fps) setFps,
    required TResult Function() toggleShowMarker,
  }) {
    return setCompassDegrees(degrees);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(double degrees)? setCompassDegrees,
    TResult? Function(String fps)? setFps,
    TResult? Function()? toggleShowMarker,
  }) {
    return setCompassDegrees?.call(degrees);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double degrees)? setCompassDegrees,
    TResult Function(String fps)? setFps,
    TResult Function()? toggleShowMarker,
    required TResult orElse(),
  }) {
    if (setCompassDegrees != null) {
      return setCompassDegrees(degrees);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SetCompassDegrees value) setCompassDegrees,
    required TResult Function(_SetRefreshRate value) setFps,
    required TResult Function(_ToggleShowMarker value) toggleShowMarker,
  }) {
    return setCompassDegrees(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SetCompassDegrees value)? setCompassDegrees,
    TResult? Function(_SetRefreshRate value)? setFps,
    TResult? Function(_ToggleShowMarker value)? toggleShowMarker,
  }) {
    return setCompassDegrees?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SetCompassDegrees value)? setCompassDegrees,
    TResult Function(_SetRefreshRate value)? setFps,
    TResult Function(_ToggleShowMarker value)? toggleShowMarker,
    required TResult orElse(),
  }) {
    if (setCompassDegrees != null) {
      return setCompassDegrees(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_SetCompassDegreesToJson(
      this,
    );
  }
}

abstract class _SetCompassDegrees implements CompassEvent {
  const factory _SetCompassDegrees(final double degrees) = _$_SetCompassDegrees;

  factory _SetCompassDegrees.fromJson(Map<String, dynamic> json) =
      _$_SetCompassDegrees.fromJson;

  double get degrees;
  @JsonKey(ignore: true)
  _$$_SetCompassDegreesCopyWith<_$_SetCompassDegrees> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SetRefreshRateCopyWith<$Res> {
  factory _$$_SetRefreshRateCopyWith(
          _$_SetRefreshRate value, $Res Function(_$_SetRefreshRate) then) =
      __$$_SetRefreshRateCopyWithImpl<$Res>;
  @useResult
  $Res call({String fps});
}

/// @nodoc
class __$$_SetRefreshRateCopyWithImpl<$Res>
    extends _$CompassEventCopyWithImpl<$Res, _$_SetRefreshRate>
    implements _$$_SetRefreshRateCopyWith<$Res> {
  __$$_SetRefreshRateCopyWithImpl(
      _$_SetRefreshRate _value, $Res Function(_$_SetRefreshRate) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fps = null,
  }) {
    return _then(_$_SetRefreshRate(
      null == fps
          ? _value.fps
          : fps // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SetRefreshRate implements _SetRefreshRate {
  const _$_SetRefreshRate(this.fps, {final String? $type})
      : $type = $type ?? 'setFps';

  factory _$_SetRefreshRate.fromJson(Map<String, dynamic> json) =>
      _$$_SetRefreshRateFromJson(json);

  @override
  final String fps;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'CompassEvent.setFps(fps: $fps)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SetRefreshRate &&
            (identical(other.fps, fps) || other.fps == fps));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, fps);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SetRefreshRateCopyWith<_$_SetRefreshRate> get copyWith =>
      __$$_SetRefreshRateCopyWithImpl<_$_SetRefreshRate>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(double degrees) setCompassDegrees,
    required TResult Function(String fps) setFps,
    required TResult Function() toggleShowMarker,
  }) {
    return setFps(fps);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(double degrees)? setCompassDegrees,
    TResult? Function(String fps)? setFps,
    TResult? Function()? toggleShowMarker,
  }) {
    return setFps?.call(fps);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double degrees)? setCompassDegrees,
    TResult Function(String fps)? setFps,
    TResult Function()? toggleShowMarker,
    required TResult orElse(),
  }) {
    if (setFps != null) {
      return setFps(fps);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SetCompassDegrees value) setCompassDegrees,
    required TResult Function(_SetRefreshRate value) setFps,
    required TResult Function(_ToggleShowMarker value) toggleShowMarker,
  }) {
    return setFps(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SetCompassDegrees value)? setCompassDegrees,
    TResult? Function(_SetRefreshRate value)? setFps,
    TResult? Function(_ToggleShowMarker value)? toggleShowMarker,
  }) {
    return setFps?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SetCompassDegrees value)? setCompassDegrees,
    TResult Function(_SetRefreshRate value)? setFps,
    TResult Function(_ToggleShowMarker value)? toggleShowMarker,
    required TResult orElse(),
  }) {
    if (setFps != null) {
      return setFps(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_SetRefreshRateToJson(
      this,
    );
  }
}

abstract class _SetRefreshRate implements CompassEvent {
  const factory _SetRefreshRate(final String fps) = _$_SetRefreshRate;

  factory _SetRefreshRate.fromJson(Map<String, dynamic> json) =
      _$_SetRefreshRate.fromJson;

  String get fps;
  @JsonKey(ignore: true)
  _$$_SetRefreshRateCopyWith<_$_SetRefreshRate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ToggleShowMarkerCopyWith<$Res> {
  factory _$$_ToggleShowMarkerCopyWith(
          _$_ToggleShowMarker value, $Res Function(_$_ToggleShowMarker) then) =
      __$$_ToggleShowMarkerCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ToggleShowMarkerCopyWithImpl<$Res>
    extends _$CompassEventCopyWithImpl<$Res, _$_ToggleShowMarker>
    implements _$$_ToggleShowMarkerCopyWith<$Res> {
  __$$_ToggleShowMarkerCopyWithImpl(
      _$_ToggleShowMarker _value, $Res Function(_$_ToggleShowMarker) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$_ToggleShowMarker implements _ToggleShowMarker {
  const _$_ToggleShowMarker({final String? $type})
      : $type = $type ?? 'toggleShowMarker';

  factory _$_ToggleShowMarker.fromJson(Map<String, dynamic> json) =>
      _$$_ToggleShowMarkerFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'CompassEvent.toggleShowMarker()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_ToggleShowMarker);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(double degrees) setCompassDegrees,
    required TResult Function(String fps) setFps,
    required TResult Function() toggleShowMarker,
  }) {
    return toggleShowMarker();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(double degrees)? setCompassDegrees,
    TResult? Function(String fps)? setFps,
    TResult? Function()? toggleShowMarker,
  }) {
    return toggleShowMarker?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double degrees)? setCompassDegrees,
    TResult Function(String fps)? setFps,
    TResult Function()? toggleShowMarker,
    required TResult orElse(),
  }) {
    if (toggleShowMarker != null) {
      return toggleShowMarker();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SetCompassDegrees value) setCompassDegrees,
    required TResult Function(_SetRefreshRate value) setFps,
    required TResult Function(_ToggleShowMarker value) toggleShowMarker,
  }) {
    return toggleShowMarker(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SetCompassDegrees value)? setCompassDegrees,
    TResult? Function(_SetRefreshRate value)? setFps,
    TResult? Function(_ToggleShowMarker value)? toggleShowMarker,
  }) {
    return toggleShowMarker?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SetCompassDegrees value)? setCompassDegrees,
    TResult Function(_SetRefreshRate value)? setFps,
    TResult Function(_ToggleShowMarker value)? toggleShowMarker,
    required TResult orElse(),
  }) {
    if (toggleShowMarker != null) {
      return toggleShowMarker(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_ToggleShowMarkerToJson(
      this,
    );
  }
}

abstract class _ToggleShowMarker implements CompassEvent {
  const factory _ToggleShowMarker() = _$_ToggleShowMarker;

  factory _ToggleShowMarker.fromJson(Map<String, dynamic> json) =
      _$_ToggleShowMarker.fromJson;
}

CompassState _$CompassStateFromJson(Map<String, dynamic> json) {
  return _CompassState.fromJson(json);
}

/// @nodoc
mixin _$CompassState {
  double get degrees => throw _privateConstructorUsedError;
  int get fps => throw _privateConstructorUsedError;
  bool get showMarker => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CompassStateCopyWith<CompassState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompassStateCopyWith<$Res> {
  factory $CompassStateCopyWith(
          CompassState value, $Res Function(CompassState) then) =
      _$CompassStateCopyWithImpl<$Res, CompassState>;
  @useResult
  $Res call({double degrees, int fps, bool showMarker});
}

/// @nodoc
class _$CompassStateCopyWithImpl<$Res, $Val extends CompassState>
    implements $CompassStateCopyWith<$Res> {
  _$CompassStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? degrees = null,
    Object? fps = null,
    Object? showMarker = null,
  }) {
    return _then(_value.copyWith(
      degrees: null == degrees
          ? _value.degrees
          : degrees // ignore: cast_nullable_to_non_nullable
              as double,
      fps: null == fps
          ? _value.fps
          : fps // ignore: cast_nullable_to_non_nullable
              as int,
      showMarker: null == showMarker
          ? _value.showMarker
          : showMarker // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CompassStateCopyWith<$Res>
    implements $CompassStateCopyWith<$Res> {
  factory _$$_CompassStateCopyWith(
          _$_CompassState value, $Res Function(_$_CompassState) then) =
      __$$_CompassStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double degrees, int fps, bool showMarker});
}

/// @nodoc
class __$$_CompassStateCopyWithImpl<$Res>
    extends _$CompassStateCopyWithImpl<$Res, _$_CompassState>
    implements _$$_CompassStateCopyWith<$Res> {
  __$$_CompassStateCopyWithImpl(
      _$_CompassState _value, $Res Function(_$_CompassState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? degrees = null,
    Object? fps = null,
    Object? showMarker = null,
  }) {
    return _then(_$_CompassState(
      degrees: null == degrees
          ? _value.degrees
          : degrees // ignore: cast_nullable_to_non_nullable
              as double,
      fps: null == fps
          ? _value.fps
          : fps // ignore: cast_nullable_to_non_nullable
              as int,
      showMarker: null == showMarker
          ? _value.showMarker
          : showMarker // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CompassState implements _CompassState {
  const _$_CompassState(
      {required this.degrees, required this.fps, required this.showMarker});

  factory _$_CompassState.fromJson(Map<String, dynamic> json) =>
      _$$_CompassStateFromJson(json);

  @override
  final double degrees;
  @override
  final int fps;
  @override
  final bool showMarker;

  @override
  String toString() {
    return 'CompassState(degrees: $degrees, fps: $fps, showMarker: $showMarker)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CompassState &&
            (identical(other.degrees, degrees) || other.degrees == degrees) &&
            (identical(other.fps, fps) || other.fps == fps) &&
            (identical(other.showMarker, showMarker) ||
                other.showMarker == showMarker));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, degrees, fps, showMarker);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CompassStateCopyWith<_$_CompassState> get copyWith =>
      __$$_CompassStateCopyWithImpl<_$_CompassState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CompassStateToJson(
      this,
    );
  }
}

abstract class _CompassState implements CompassState {
  const factory _CompassState(
      {required final double degrees,
      required final int fps,
      required final bool showMarker}) = _$_CompassState;

  factory _CompassState.fromJson(Map<String, dynamic> json) =
      _$_CompassState.fromJson;

  @override
  double get degrees;
  @override
  int get fps;
  @override
  bool get showMarker;
  @override
  @JsonKey(ignore: true)
  _$$_CompassStateCopyWith<_$_CompassState> get copyWith =>
      throw _privateConstructorUsedError;
}
