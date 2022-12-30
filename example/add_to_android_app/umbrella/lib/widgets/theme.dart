import 'package:example_data/example_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyTheme extends StatelessWidget {
  final ThemeBloc themeBloc;
  final Widget child;

  const MyTheme({
    Key? key,
    required this.themeBloc,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      bloc: themeBloc,
      builder: (context, state) {
        return Theme(
          data: Theme.of(context).copyWith(
            scaffoldBackgroundColor: state.isDark ? Colors.black : Colors.white,
            textTheme: Theme.of(context).textTheme.apply(
                  bodyColor: state.isDark ? Colors.white : Colors.black,
                  displayColor: state.isDark ? Colors.white : Colors.black,
                ),
          ),
          child: child,
        );
      },
    );
  }
}
