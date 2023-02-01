import 'dart:convert';

import 'package:cible_controlleur/helpers/colorsHelpers.dart';
import 'package:cible_controlleur/helpers/sharedPreferences.dart';
import 'package:cible_controlleur/views/settings/settings.screen.dart';
import 'package:cible_controlleur/views/tabs/en_cours/en_cours.screen.dart';
import 'package:cible_controlleur/views/tabs/historique/historique.screen.dart';
import 'package:flutter/material.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';
import 'package:http/http.dart' as http;

import '../../constants/api.dart';
import '../../models/categorie.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({super.key});

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {

  List<Categorie> categories = [];

  getCategoriesFromAPI() async {
    var response = await http.get(
      Uri.parse('$baseApiUrl/events_of_day'),
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json"
      },
    );
    print(response.statusCode);

    if (response.statusCode == 200 || response.statusCode == 201) {
      setState(() {
        categories =
            getCategorieFromMap(jsonDecode(response.body)['data'] as List);
      });
      return categories;
    }
  }

  getCategorieFromMap(List categorieListFromAPI) {
    final List<Categorie> tagObjs = [];
    for (var element in categorieListFromAPI) {
      var categorie = Categorie.fromMap(element);
      if (categorie.events.isNotEmpty) {
        tagObjs.add(categorie);
      }
    }
    return tagObjs;
  }
    @override
  void initState() {
    getCategoriesFromAPI();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

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
                // Navigator.of(context).push(
                //   MaterialPageRoute(builder: (BuildContext context) {
                //     return const SettingsScreen();
                //   }),
                // );
                
              },
              icon: const Icon(Icons.settings),
            )
          ],
        ),
        body: categories.isEmpty
        ? const Center(child: CircularProgressIndicator())
        : 
        Container(
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
              Expanded(
                child: TabBarView(children: [
                  EnCoursScreen(categories: categories),
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
