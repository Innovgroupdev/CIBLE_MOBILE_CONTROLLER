import 'dart:ui';

import 'package:cible_controlleur/helpers/colorsHelpers.dart';
import 'package:cible_controlleur/views/scan/scan.screen.dart';
import 'package:flutter/material.dart';

class MyCards extends StatelessWidget {
  final String image;
  final String name;
  final String lieu;
  final String date;
  const MyCards(
      {super.key,
      required this.image,
      required this.name,
      required this.lieu,
      required this.date});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        onTap: () {
          debugPrint('Card tapped.');
        },
        child: SizedBox(
          width: double.maxFinite,
          height: 150,
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      image,
                      height: 130,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  padding:
                      const EdgeInsets.only(top: 10, bottom: 10, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              name,
                              style: const TextStyle(
                                color: AppColor.text,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Text(
                              lieu.length > 50
                                  ? '${lieu.substring(0, 50)}...'
                                  : lieu,
                              style: const TextStyle(
                                color: AppColor.text,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              child: Text(
                                date,
                                style: const TextStyle(
                                  color: AppColor.text,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                            SizedBox(
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (BuildContext context) {
                                      return const ScanScreen();
                                    }),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColor.primary,
                                  elevation: 0,
                                ),
                                child: const Text(
                                  'Scannez',
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
