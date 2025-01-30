import 'package:flutter/material.dart';
import 'package:maison_moel/view/prendre_commande/commande.dart';
import 'package:maison_moel/view/connexion/connexion.dart';
import 'home.dart';
import 'package:json_theme/json_theme.dart';
import 'package:flutter/services.dart';
import 'dart:convert';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final themeStr = await rootBundle.loadString('assets/appainter_theme.json');
  final themeJson = jsonDecode(themeStr);
  final theme = ThemeDecoder.decodeThemeData(themeJson)!;

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp(theme : theme));
}


class MyApp extends StatelessWidget {

  final ThemeData theme;
  const MyApp({super.key, required this.theme});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Maison Moël Flutter',
      initialRoute: '/',
      routes: {
        '/data': (context) => const Text("data"),
        '/': (context) => const Connexion(),
        '/home': (context) {
          final args = ModalRoute.of(context)!.settings.arguments as Map;
          return MyHomePage(title: "Maison Moël", token: args['token']);
        },
      },
      theme: theme,
      debugShowMaterialGrid: false,
      debugShowCheckedModeBanner: false,
    );
  }
}