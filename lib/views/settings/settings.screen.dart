import 'package:cible_controlleur/views/compte/compte.screen.dart';
import 'package:cible_controlleur/views/connexion/connexion.screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:cible_controlleur/helpers/colorsHelpers.dart';
import 'package:cible_controlleur/helpers/sharedPreferences.dart';
import 'package:cible_controlleur/views/settings/settings.widgets.dart';
import 'package:line_icons/line_icon.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey[50],
        appBar: AppBar(
          foregroundColor: AppColor.primary,
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: const Text(
            'PROFIL',
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const ProfileInfo(),
                SizedBox(height: 20),
                ProfileMenu(
                  text: "Informations du compte",
                  icon: LineIcon.user(),
                  press: () => {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (BuildContext context) {
                        return CompteScreen();
                      }),
                    )
                  },
                ),
                ProfileMenu(
                  text: "Notifications",
                  icon: Icon(Icons.notifications_outlined),
                  press: () {},
                ),
                ProfileMenu(
                  text: "Paramètres",
                  icon: Icon(Icons.settings),
                  press: () {},
                ),
                ProfileMenu(
                  text: "Déconnexion",
                  icon: LineIcon.heartBroken(),
                  press: logout,
                ),
              ],
            ),
          ),
        ));
  }

  Future logout() async {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text(
              'Déconnexion',
              style: TextStyle(fontSize: 20),
            ),
            content: const Text(
              'Êtes-vous sûr?',
              style: TextStyle(fontSize: 15),
            ),
            actions: [
              MaterialButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'Non',
                  style: TextStyle(fontSize: 15),
                ),
              ),
              MaterialButton(
                color: AppColor.primary,
                onPressed: () async {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      });
                  var response = await http.post(
                    Uri.parse(
                        "http://backend.cible-app.com/public/api/controlleur/logout"),
                    headers: ({
                      'Authorization':
                          'Bearer ${SharedPreferencesHelper.getToken()}',
                    }),
                  );

                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const ConnexionScreen()),
                      (route) => false);

                  if (response.statusCode == 200) {
                    await SharedPreferencesHelper.setToken('');
                  } else {
                    print(response.body);
                  }
                },
                child: const Text(
                  'Oui',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
            ],
          );
        });
  }
}
