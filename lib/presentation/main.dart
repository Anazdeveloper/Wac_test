import 'package:flutter/material.dart';
import 'package:wac_test/app_strings.dart';
import 'package:wac_test/presentation/Home/home.dart';
import 'package:wac_test/presentation/Profile/arguments/profile_arguments.dart';
import 'package:wac_test/presentation/Profile/profile_page.dart';
import 'package:wac_test/presentation/utils/custom_route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();

}
class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings().wac_test,
      home: const Home(),
      onGenerateRoute: (settings) {
        switch(settings.name) {
          case '/profile_page':
            return CustomRoute<bool>(
              builder: (context) {
                return ProfilePage(arguments: settings.arguments as ProfileArguments);
              },
              settings: settings
            );
        }
        return null;
      },
    );
  }

}