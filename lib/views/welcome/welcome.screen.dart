import 'package:cible_controlleur/constants/local_path.dart';
import 'package:cible_controlleur/helpers/colorsHelpers.dart';
import 'package:cible_controlleur/views/code/code.screen.dart';
import 'package:cible_controlleur/widgets/background.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: backgroundDecoration(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 20.0),
                    child: const Text(
                      'CIBLE SCANNER',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: AppColor.text,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 20.0),
                    child: const CircleAvatar(
                      maxRadius: 80.0,
                      backgroundImage: AssetImage('$imagesPath/s.jpeg'),
                    ),
                  ),
                  const Text(
                    'Scanner les tickets des participants',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: AppColor.text,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const Text(
                    'Recrutez des organisateurs et prestataires évènementiels. '
                    'Trouvez une main d\'oeuvre qualifiée pour vos évènements.',
                    style: TextStyle(
                      fontSize: 15,
                      height: 2,
                      color: AppColor.text,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (BuildContext context) {
                          return CodeScreen();
                        }),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.primary,
                      padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Padding(padding: EdgeInsets.only(right: 70.0)),
                        Text(
                          'Commencez',
                          style: TextStyle(fontSize: 20.0),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Icon(
                          Icons.arrow_forward,
                          size: 24.0,
                        ),
                        Padding(padding: EdgeInsets.only(left: 70.0))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
