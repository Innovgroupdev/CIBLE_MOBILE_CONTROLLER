import 'package:cible_controlleur/constants/local_path.dart';
import 'package:cible_controlleur/helpers/colorsHelpers.dart';
import 'package:cible_controlleur/views/connexion/connexion.screen.dart';
import 'package:cible_controlleur/widgets/background.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class InscriptionScreen extends StatefulWidget {
  final String email;
  const InscriptionScreen({super.key, required this.email});

  @override
  State<InscriptionScreen> createState() => _InscriptionScreenState();
}

class _InscriptionScreenState extends State<InscriptionScreen> {
  final _passwordController = TextEditingController();

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
                    const SizedBox(
                      height: 20.0,
                    ),
                    const Text(
                      'INSCRIPTION',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: AppColor.text),
                    ),
                    const SizedBox(
                    height: 20.0,
                    ),
                    Text(
                      widget.email,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: AppColor.text),
                    ),
                    SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 0, vertical: 15),
                        child: TextFormField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: const InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColor.secondary, width: 3.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColor.secondary, width: 0.0),
                            ),
                            labelText: 'Mot de passe',
                            labelStyle: TextStyle(
                                color: AppColor.text,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                            filled: true,
                            fillColor: AppColor.secondary,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    SizedBox(
                      width: double.maxFinite,
                      height: 55,
                      child: ElevatedButton(
                        onPressed: inscription,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: const Text(
                          'S\'inscrire',
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> inscription() async {
    if (_passwordController.text.isNotEmpty) {
      if (_passwordController.text.length >= 8) {
        showDialog(
            context: context,
            builder: (context) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            });

        var response = await http.post(
          Uri.parse(
              "http://backend.cible-app.com/public/api/controllers/updatepassword/${widget.email}/${_passwordController.text}"),
        );

        // ignore: use_build_context_synchronously
        Navigator.of(context).pop();
        if (response.statusCode == 200) {
          // ignore: use_build_context_synchronously
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) {
              return const ConnexionScreen();
            }),
          );
        } else {
          // ignore: use_build_context_synchronously
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Il faut au moins 8 caractères")),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Remplir les champs")),
        );
      }
    }
  }
}
