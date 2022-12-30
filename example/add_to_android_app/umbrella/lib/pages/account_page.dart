import 'package:example_data/example_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:umbrella/widgets/theme.dart';

import '../widgets/auth_hud.dart';

class AccountPage extends StatelessWidget {
  final AuthBloc authBloc;
  final ThemeBloc themeBloc;

  const AccountPage({
    Key? key,
    required this.authBloc,
    required this.themeBloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      bloc: authBloc,
      builder: (context, authState) {
        return MyTheme(
          themeBloc: themeBloc,
          child: Scaffold(
            body: Column(
              children: [
                AuthHud(authBloc: authBloc),
                Expanded(
                  child: Center(
                    child: authState.isLoggedIn
                        ? ElevatedButton(
                            onPressed: () =>
                                authBloc.add(const AuthEvent.logOut()),
                            child: const Text('Logout'))
                        : LoginForm(authBloc: authBloc),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class LoginForm extends StatelessWidget {
  final AuthBloc authBloc;

  const LoginForm({
    Key? key,
    required this.authBloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Enter username',
          hintStyle: Theme.of(context).textTheme.bodyMedium,
        ),
        onSubmitted: (value) => authBloc.add(AuthEvent.logIn(username: value)),
      ),
    );
  }
}
