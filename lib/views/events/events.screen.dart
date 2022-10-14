import 'package:cible_controlleur/helpers/colorsHelpers.dart';
import 'package:cible_controlleur/helpers/sharedPreferences.dart';
import 'package:cible_controlleur/views/settings/settings.screen.dart';
import 'package:cible_controlleur/views/tabs/en_cours/en_cours.screen.dart';
import 'package:cible_controlleur/views/tabs/historique/historique.screen.dart';
import 'package:flutter/material.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({super.key});

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

@override
void initState() {
  print(SharedPreferencesHelper.getToken());
}

class _EventsScreenState extends State<EventsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.blueGrey[50],
        appBar: AppBar(
          foregroundColor: AppColor.primary,
          elevation: 0,
          leading: Icon(Icons.menu_rounded),
          backgroundColor: Colors.transparent,
          title: const Text(
            'EVENEMENTS',
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (BuildContext context) {
                    return const SettingsScreen();
                  }),
                );
                
              },
              icon: const Icon(Icons.settings),
            )
          ],
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              TabBar(
                padding: const EdgeInsets.only(bottom: 20, top: 20),
                labelColor: AppColor.primary,
                unselectedLabelColor: AppColor.secondary,
                labelStyle: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
                indicator: DotIndicator(
                  color: AppColor.primary,
                  distanceFromCenter: 16,
                  radius: 5,
                  paintingStyle: PaintingStyle.fill,
                ),
                tabs: const [
                  Tab(text: 'En cours'),
                  Tab(text: 'Historique'),
                ],
              ),
              const Expanded(
                child: TabBarView(children: [
                  EnCoursScreen(),
                  HistoriqueScreen(),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
