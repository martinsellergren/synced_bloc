import 'package:example_data/example_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final AuthBloc authMaster = AuthBloc();
  final AuthBloc authSubscriber0 = AuthBlocSubscriber(
      id: '0', initialState: const AuthState.loggedOut(hasLoginError: true));
  final AuthBloc authSubscriber1 = await AuthBlocSubscriber.create(id: '1');

  final ThemeBloc themeMaster = ThemeBloc();
  final ThemeBloc themeSubscriber = ThemeBlocSubscriber(id: '0');

  runApp(
    MaterialApp(
      home: Page(
          authMaster: authMaster,
          authSubscriber0: authSubscriber0,
          authSubscriber1: authSubscriber1,
          themeMaster: themeMaster,
          themeSubscriber: themeSubscriber),
    ),
  );
}

class Page extends StatelessWidget {
  final AuthBloc authMaster;
  final AuthBloc authSubscriber0;
  final AuthBloc authSubscriber1;
  final ThemeBloc themeMaster;
  final ThemeBloc themeSubscriber;

  const Page({
    Key? key,
    required this.authMaster,
    required this.authSubscriber0,
    required this.authSubscriber1,
    required this.themeMaster,
    required this.themeSubscriber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: authMaster,
      builder: (context, authMasterState) => BlocBuilder(
        bloc: authSubscriber0,
        builder: (context, authSubscriber0State) => BlocBuilder(
          bloc: authSubscriber1,
          builder: (context, authSubscriber1State) => BlocBuilder(
              bloc: themeMaster,
              builder: (context, themeMasterState) => BlocBuilder(
                  bloc: themeSubscriber,
                  builder: (context, themeSubscriberState) => Theme(
                        data: Theme.of(context).copyWith(
                            scaffoldBackgroundColor: themeMaster.state.isDark
                                ? Colors.purple
                                : null),
                        child: Scaffold(
                          appBar: AppBar(),
                          body: ListView(
                            children: [
                              ...[authMaster, authSubscriber0, authSubscriber1]
                                  .map((bloc) => [
                                        Text('${bloc.state}'),
                                        TextButton(
                                            onPressed: () => bloc.add(
                                                const AuthEvent.logIn(
                                                    username: 'masel')),
                                            child: Text('login: $bloc')),
                                        TextButton(
                                            onPressed: () => bloc
                                                .add(const AuthEvent.logOut()),
                                            child: Text('logout: $bloc')),
                                      ])
                                  .expand((e) => e)
                                  .toList()
                                ..sort((a, b) => a.runtimeType
                                    .toString()
                                    .compareTo(b.runtimeType.toString())),
                              ...[themeMaster, themeSubscriber]
                                  .map((bloc) => [
                                        Text('${bloc.state}'),
                                        TextButton(
                                            onPressed: () => bloc
                                                .add(const ThemeEvent.toggle()),
                                            child: Text('toggle: $bloc')),
                                      ])
                                  .expand((e) => e)
                                  .toList()
                                ..sort((a, b) => a.runtimeType
                                    .toString()
                                    .compareTo(b.runtimeType.toString())),
                            ],
                          ),
                        ),
                      ))),
        ),
      ),
    );
  }
}
