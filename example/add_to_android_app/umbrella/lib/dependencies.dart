import 'package:example_data/example_data.dart';

class Dependencies {
  final AuthBloc authBloc;
  final ThemeBloc themeBloc;

  Dependencies._({
    required this.authBloc,
    required this.themeBloc,
  });

  factory Dependencies({String? syncSubscriberId}) {
    bool isSyncMaster = syncSubscriberId == null;
    final authBloc =
        isSyncMaster ? AuthBloc() : AuthBlocSubscriber(id: syncSubscriberId);
    final themeBloc =
        isSyncMaster ? ThemeBloc() : ThemeBlocSubscriber(id: syncSubscriberId);
    return Dependencies._(authBloc: authBloc, themeBloc: themeBloc);
  }
}
