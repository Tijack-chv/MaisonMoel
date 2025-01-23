import 'package:flutter/material.dart';
import 'package:maison_moel/connexion.dart';
import 'home.dart';
import 'package:json_theme/json_theme.dart';
import 'package:flutter/services.dart';
import 'dart:convert';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final themeStr = await rootBundle.loadString('assets/appainter_theme.json');
  final themeJson = jsonDecode(themeStr);
  final theme = ThemeDecoder.decodeThemeData(themeJson)!;

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
        '/data': (context) => const Text("data"), // test de route
        '/': (context) => const Connexion(),
        '/home': (context) => const MyHomePage(title: "Maison Moël"),
      },
      theme: theme,
      debugShowMaterialGrid: false,
      debugShowCheckedModeBanner: false,
    );
  }
}