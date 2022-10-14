import 'package:cible_controlleur/constants/local_path.dart';
import 'package:cible_controlleur/helpers/colorsHelpers.dart';
import 'package:cible_controlleur/views/tabs/en_cours/en_cours.widgets.dart';
import 'package:flutter/material.dart';

class EnCoursScreen extends StatelessWidget {
  const EnCoursScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: const [
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              'Concerts',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: AppColor.primary,
              ),
            ),
          ),
          MyCards(
            image: '$imagesPath/dadju.jpg',
            name: 'Concert de Dadju',
            lieu: 'Plage face OnomoaefinjgnfajfnUFHPIRUHNRWIGJNgbyguvutgiiu',
            date: '17 - 09 -2022',
          ),
          MyCards(
            image: '$imagesPath/santrinos.webp',
            name: 'Concert de Santrinos',
            lieu:
                'Miadjoe, Anéhogbygvygfvfhgvyghvubhgiyufgvtfgcyvtfgvtfguvyfvyg',
            date: '17 - 09 -2022',
          ),
          SizedBox(
            height: 17,
          ),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              'Théatre',
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 1, 69, 3)),
            ),
          ),
          MyCards(
            image: '$imagesPath/dadju.jpg',
            name: 'Concert de Dadju',
            lieu: 'Plage face Onomo',
            date: '17 - 09 -2022',
          ),
          MyCards(
            image: '$imagesPath/santrinos.webp',
            name: 'Concert de Santrinos',
            lieu: 'Miadjo, Aného',
            date: '17 - 09 -2022',
          ),
        ],
      ),
    );
  }
}
