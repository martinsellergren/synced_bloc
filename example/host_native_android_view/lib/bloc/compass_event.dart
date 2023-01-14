part of 'compass_bloc.dart';

@freezed
class CompassEvent with _$CompassEvent {
  const factory CompassEvent.setCompassDegrees(double degrees) =
      _SetCompassDegrees;
  const factory CompassEvent.setFps(String fps) = _SetRefreshRate;
  const factory CompassEvent.toggleShowMarker() = _ToggleShowMarker;

  factory CompassEvent.fromJson(Map<String, dynamic> json) =>
      _$CompassEventFromJson(json);
}
