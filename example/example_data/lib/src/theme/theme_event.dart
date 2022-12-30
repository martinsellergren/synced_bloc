part of 'theme_bloc.dart';

@freezed
class ThemeEvent with _$ThemeEvent {
  const factory ThemeEvent.toggle() = _Toggle;

  factory ThemeEvent.fromJson(Map<String, dynamic> json) =>
      _$ThemeEventFromJson(json);
}
