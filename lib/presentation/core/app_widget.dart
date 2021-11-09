import 'package:flutter/material.dart';

import '../sign_in/sign_in_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light().copyWith(
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.green,
          ).copyWith(
            secondary: Colors.blueAccent,
            primary: Colors.green.shade800,
          ),
          inputDecorationTheme: InputDecorationTheme(
              border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ))),
      home: const SignInPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
