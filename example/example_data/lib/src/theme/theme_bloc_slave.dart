import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:synced_bloc/synced_bloc_mixin.dart';

import 'theme_bloc.dart';

class ThemeBlocSlave extends Bloc<ThemeEvent, ThemeState>
    with SyncSlaveMixin
    implements ThemeBloc {
  ThemeBlocSlave({required String id, ThemeState? initialState})
      : super(initialState ?? const ThemeState()) {
    setupSyncSlave(
        masterId: 'ThemeBloc',
        slaveId: id,
        stateFromJson: (json) => ThemeState.fromJson(json),
        eventToJson: (event) => event.toJson());
  }

  static Future<ThemeBlocSlave> create({required String id}) async {
    ThemeState masterState = await SyncSlaveMixin.getMasterState(
        masterId: 'ThemeBloc', fromJson: (json) => ThemeState.fromJson(json));
    return ThemeBlocSlave(id: id, initialState: masterState);
  }
}
