import 'dart:convert';

import 'package:cible_controlleur/models/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:cible_controlleur/constants/local_path.dart';
import 'package:cible_controlleur/helpers/colorsHelpers.dart';
import 'package:cible_controlleur/views/connexion/connexion.screen.dart';
import 'package:cible_controlleur/views/inscription/inscription.screen.dart';
import 'package:cible_controlleur/views/welcome/welcome.screen.dart';
import 'package:cible_controlleur/widgets/background.dart';

import '../scan/scan.screen.dart';

class CodeScreen extends StatefulWidget {
  const CodeScreen({super.key});

  @override
  State<CodeScreen> createState() => _CodeScreenState();
}

class _CodeScreenState extends State<CodeScreen> {
  final _codeController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: backgroundDecoration(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      maxRadius: 60.0,
                      backgroundImage: AssetImage('$imagesPath/s.jpeg'),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20.0),
                      child: const Text(
                        'CIBLE SCANNER',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: AppColor.text,
                        ),
                      ),
                    ),
                    const Text(
                      'Scanner les tickets des participants',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: AppColor.text,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    SizedBox(
                      child: TextFormField(
                        controller: _codeController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColor.secondary,
                              width: 3.0,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColor.secondary,
                              width: 0.0,
                            ),
                          ),
                          labelText: 'Code évènement',
                          labelStyle: TextStyle(
                            color: AppColor.text,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                          filled: true,
                          fillColor: AppColor.secondary,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40.0,
                    ),
                    SizedBox(
                      width: double.maxFinite,
                      height: 55,
                      child: ElevatedButton(
                        onPressed: checkCode,
                        // () {
                        //   Navigator.of(context).pushReplacement(
                        //     MaterialPageRoute(builder: (BuildContext context) {
                        //       return const InscriptionScreen();
                        //     }),
                        //   );
                        // },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: isLoading
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : const Text(
                                'Soumettre',
                                style: TextStyle(fontSize: 20.0),
                              ),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context) {
                            return const ConnexionScreen();
                          }),
                        );
                      },
                      child: const Text(
                        'J\'ai déjà un compte',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> checkCode() async {
    if (_codeController.text.isNotEmpty) {
      setState(() {
        isLoading = true;
      });

      var response = await http.get(
        Uri.parse(
            "http://backend.cible-app.com/public/api/emailbycode/${_codeController.text}"),
      );

      setState(() {
        isLoading = false;
      });

      if (response.statusCode == 200) {
        final Map body = json.decode(response.body);
        // ignore: use_build_context_synchronously
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (BuildContext context) {
            return const ScanScreen();
            // return InscriptionScreen(email: body['data']);
          }),
        );
      } else {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Code incorrect")),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Remplir les champs")),
      );
    }
  }
}
