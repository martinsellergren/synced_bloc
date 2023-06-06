import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:synced_bloc/synced_bloc.dart';

part 'compass_bloc.freezed.dart';
part 'compass_bloc.g.dart';
part 'compass_event.dart';
part 'compass_state.dart';

class CompassBloc extends Bloc<CompassEvent, CompassState>
    with SyncMasterMixin {
  CompassBloc()
      : super(const CompassState(degrees: 0, fps: 60, showMarker: true)) {
    setupSyncMaster(
        masterId: 'compass',
        stateToJson: (state) => state.toJson(),
        eventFromJson: (json) => CompassEvent.fromJson(json));
    on<_SetCompassDegrees>(_onSetCompassDegrees);
    on<_SetRefreshRate>(_onSetRefreshRate);
    on<_ToggleShowMarker>(_onToggleShowMarker);
  }

  void _onSetCompassDegrees(
      _SetCompassDegrees event, Emitter<CompassState> emit) {
    emit(state.copyWith(degrees: event.degrees));
  }

  void _onSetRefreshRate(_SetRefreshRate event, Emitter<CompassState> emit) {
    int? fps = int.tryParse(event.fps);
    if (fps == null) return;
    if (fps < 1) fps = 1;
    if (fps > 200) fps = 200;
    emit(state.copyWith(fps: fps));
  }

  void _onToggleShowMarker(
      _ToggleShowMarker event, Emitter<CompassState> emit) {
    emit(state.copyWith(showMarker: !state.showMarker));
  }
}
