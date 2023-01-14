part of 'compass_bloc.dart';

@freezed
class CompassState with _$CompassState {
  const factory CompassState(
      {required double degrees,
      required int fps,
      required bool showMarker}) = _CompassState;

  factory CompassState.fromJson(Map<String, dynamic> json) =>
      _$CompassStateFromJson(json);
}
