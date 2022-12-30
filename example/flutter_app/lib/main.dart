import 'package:example_data/example_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final AuthBloc authMaster = AuthBloc();
  final AuthBloc authSlave0 = AuthBlocSlave(
      id: '0', initialState: const AuthState.loggedOut(hasLoginError: true));
  final AuthBloc authSlave1 = await AuthBlocSlave.create(id: '1');

  final ThemeBloc themeMaster = ThemeBloc();
  final ThemeBloc themeSlave = ThemeBlocSlave(id: '0');

  runApp(
    MaterialApp(
      home: Page(
          authMaster: authMaster,
          authSlave0: authSlave0,
          authSlave1: authSlave1,
          themeMaster: themeMaster,
          themeSlave: themeSlave),
    ),
  );
}

class Page extends StatelessWidget {
  final AuthBloc authMaster;
  final AuthBloc authSlave0;
  final AuthBloc authSlave1;
  final ThemeBloc themeMaster;
  final ThemeBloc themeSlave;

  const Page({
    Key? key,
    required this.authMaster,
    required this.authSlave0,
    required this.authSlave1,
    required this.themeMaster,
    required this.themeSlave,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: authMaster,
      builder: (context, authMasterState) => BlocBuilder(
        bloc: authSlave0,
        builder: (context, authSlave0State) => BlocBuilder(
          bloc: authSlave1,
          builder: (context, authSlave1State) => BlocBuilder(
              bloc: themeMaster,
              builder: (context, themeMasterState) => BlocBuilder(
                  bloc: themeSlave,
                  builder: (context, themeSlaveState) => Theme(
                        data: Theme.of(context).copyWith(
                            scaffoldBackgroundColor: themeMaster.state.isDark
                                ? Colors.purple
                                : null),
                        child: Scaffold(
                          appBar: AppBar(),
                          body: ListView(
                            children: [
                              ...[authMaster, authSlave0, authSlave1]
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
                              ...[themeMaster, themeSlave]
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
