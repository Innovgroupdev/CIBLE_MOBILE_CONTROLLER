import 'package:cible_controlleur/helpers/sharedPreferences.dart';
import 'package:cible_controlleur/views/events/events.screen.dart';
import 'package:cible_controlleur/views/welcome/welcome.screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        // body: SharedPreferencesHelper.getToken() != ''
        //     ? const EventsScreen()
        //     : const WelcomeScreen());
        body: WelcomeScreen());
  }
}
