import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:synced_bloc/synced_bloc_mixin.dart';

import 'theme_bloc.dart';

class ThemeBlocSubscriber extends Bloc<ThemeEvent, ThemeState>
    with SyncSubscriberMixin
    implements ThemeBloc {
  ThemeBlocSubscriber({required String id, ThemeState? initialState})
      : super(initialState ?? const ThemeState()) {
    setupSyncSubscriber(
        masterId: 'ThemeBloc',
        subscriberId: id,
        stateFromJson: (json) => ThemeState.fromJson(json),
        eventToJson: (event) => event.toJson());
  }

  static Future<ThemeBlocSubscriber> create({required String id}) async {
    ThemeState masterState = await SyncSubscriberMixin.getMasterState(
        masterId: 'ThemeBloc', fromJson: (json) => ThemeState.fromJson(json));
    return ThemeBlocSubscriber(id: id, initialState: masterState);
  }
}
