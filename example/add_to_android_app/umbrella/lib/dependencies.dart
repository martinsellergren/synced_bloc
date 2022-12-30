import 'package:example_data/example_data.dart';

class Dependencies {
  final AuthBloc authBloc;
  final ThemeBloc themeBloc;

  Dependencies._({
    required this.authBloc,
    required this.themeBloc,
  });

  factory Dependencies({String? syncSlaveId}) {
    bool isSyncMaster = syncSlaveId == null;
    final authBloc = isSyncMaster ? AuthBloc() : AuthBlocSlave(id: syncSlaveId);
    final themeBloc =
        isSyncMaster ? ThemeBloc() : ThemeBlocSlave(id: syncSlaveId);
    return Dependencies._(authBloc: authBloc, themeBloc: themeBloc);
  }
}
