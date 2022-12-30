import 'package:flutter/material.dart';
import 'package:umbrella/dependencies.dart';
import 'package:umbrella/widgets/theme.dart';

import '../widgets/auth_hud.dart';

class HomePage extends StatelessWidget {
  final Dependencies dependencies;

  const HomePage({
    Key? key,
    required this.dependencies,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyTheme(
      themeBloc: dependencies.themeBloc,
      child: Builder(builder: (context) {
        return Scaffold(
          body: Column(
            children: [
              AuthHud(authBloc: dependencies.authBloc),
              Expanded(
                  child: Center(
                      child: Text(
                'Hello from flutter',
                style: Theme.of(context).textTheme.headline6,
              ))),
            ],
          ),
        );
      }),
    );
  }
}
