import 'package:cible_controlleur/helpers/sharedPreferences.dart';
import 'package:cible_controlleur/providers/user_provider.dart';
import 'package:cible_controlleur/views/main/main.screen.dart';
import 'package:flutter/material.dart';
import 'package:cible_controlleur/core/routes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
          primarySwatch: Colors.green,
        ),
        // routes: routes,
        // initialRoute: '/',
        // onGenerateRoute: (settings) => RouteGenerator.generateRoute(settings),
        home: const MainScreen(),
      ),
    );
  }
}
