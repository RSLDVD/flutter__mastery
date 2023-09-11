import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(BlocEx());
}

class ThemeBloc extends Cubit<ThemeData> {
  ThemeBloc() : super(ThemeData.light());

  void toggleTheme() {
    emit(state == ThemeData.light() ? ThemeData.dark() : ThemeData.light());
  }
}

class AuthBloc extends Cubit<bool> {
  AuthBloc() : super(false);

  void toggleAuthentication() {
    emit(!state);
  }
}

class BlocEx extends StatelessWidget {
  final ThemeBloc themeBloc = ThemeBloc();
  final AuthBloc authBloc = AuthBloc();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeBloc>.value(value: themeBloc),
        BlocProvider<AuthBloc>.value(value: authBloc),
      ],
      child: BlocBuilder<ThemeBloc, ThemeData>(
        builder: (context, theme) {
          return MaterialApp(
            theme: theme,
            home: MyHomePage(),
          );
        },
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeBloc = BlocProvider.of<ThemeBloc>(context);
    final authBloc = BlocProvider.of<AuthBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('BLoC Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocBuilder<ThemeBloc, ThemeData>(
              builder: (context, theme) {
                return Text(
                  'Theme: ${theme == ThemeData.light() ? 'Light' : 'Dark'}',
                  style: TextStyle(
                    color: theme.primaryColor,
                    fontSize: 18,
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            BlocBuilder<AuthBloc, bool>(
              builder: (context, isAuthenticated) {
                return Text(
                  'Authentication Status: ${isAuthenticated ? 'Logged In' : 'Logged Out'}',
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            ThemeChanger(),
            AuthToggler(),
          ],
        ),
      ),
    );
  }
}

class ThemeChanger extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeBloc = BlocProvider.of<ThemeBloc>(context);

    return ElevatedButton(
      onPressed: () {
        themeBloc.toggleTheme();
      },
      child: const Text('Change Theme'),
    );
  }
}

class AuthToggler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authBloc = BlocProvider.of<AuthBloc>(context);

    return ElevatedButton(
      onPressed: () {
        authBloc.toggleAuthentication();
      },
      child: BlocBuilder<AuthBloc, bool>(
        builder: (context, isAuthenticated) {
          return Text(isAuthenticated ? 'Log Out' : 'Log In');
        },
      ),
    );
  }
}
