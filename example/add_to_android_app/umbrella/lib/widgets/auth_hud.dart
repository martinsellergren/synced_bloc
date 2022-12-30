import 'package:example_data/example_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthHud extends StatelessWidget {
  final AuthBloc authBloc;

  const AuthHud({
    Key? key,
    required this.authBloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      bloc: authBloc,
      builder: (context, state) {
        if (state.isLoading) return const LinearProgressIndicator();
        return state.map(
          loggedOut: (value) => Text("You're logged out",
              style: Theme.of(context).textTheme.headline6),
          loggedIn: (value) =>
              Text("You're logged in as ${value.userProfile.username}"),
        );
      },
    );
  }
}
