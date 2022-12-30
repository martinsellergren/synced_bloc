import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:synced_bloc/synced_bloc_mixin.dart';

part 'theme_bloc.freezed.dart';
part 'theme_bloc.g.dart';
part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> with SyncMasterMixin {
  ThemeBloc() : super(const ThemeState(isDark: true)) {
    setupSyncMaster(
        masterId: 'ThemeBloc',
        stateToJson: (state) => state.toJson(),
        eventFromJson: (json) => ThemeEvent.fromJson(json));
    on<_Toggle>(_onToggle);
  }

  void _onToggle(_Toggle event, Emitter<ThemeState> emit) {
    emit(ThemeState(isDark: !state.isDark));
  }
}
