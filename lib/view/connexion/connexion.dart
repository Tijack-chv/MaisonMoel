import 'dart:convert';
import 'package:flutter/material.dart';
import '../../data/services/Api.dart';

class Connexion extends StatefulWidget {
  const Connexion({super.key});

  @override
  State<Connexion> createState() => _ConnexionState();
}

class _ConnexionState extends State<Connexion> {
  var obscureText = true;
  final loginFocus = FocusNode();
  final passwordFocus = FocusNode();

  bool _loading = false;
  String _username = '';
  String _password = '';

  void _showDialog(String message) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Align(
              alignment: Alignment.center,
              child: Icon(Icons.highlight_off_outlined, color: Colors.red, size: 50),
            ),
            content: Text(
              message,
              style: const TextStyle(
                color: Colors.white,
              )
            ),
            backgroundColor: Color(0xFF292929),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'OK',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          );
        }
    );
  }

  _getData(String username, String password) {
    API.login(username, password).then((response) {
      setState(() {
        _loading = false;
        if (response['error'] != null) {
          _showDialog(response['error']);
        } else {
          Navigator.pushNamed(context,'/home', arguments: {
            'token': response['serveur']['token'],
          });
        }
      });

    }).catchError((error) {
      _loading = false;
    });
  }

  @override
  initState() {
    super.initState();
  }

  @override
  dispose() {
    loginFocus.dispose();
    passwordFocus.dispose();
    super.dispose();
  }

  onLogin () {
    setState(() {
      _loading = true;
    });
    _getData(_username, _password);
  }

  onPasswordChange (value) {
    setState(() {
      _password = value;
    });
  }
  onLoginChange (value) {
    setState(() {
      _username = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF292929),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/logo.png",
            height: 150,
            errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
              return const Icon(
                Icons.error,
                color: Colors.red,
                size: 150,
              );
            },
          ),
          const SizedBox(height: 20),
          const Center(
            child: Text(
              'Connexion',
              style: TextStyle(
                color: Color(0xFFFFEB99),
                fontSize: 30,
                fontFamily: "LibreBaskerville",
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              style: const TextStyle(
                color: Colors.grey
              ),
              focusNode: loginFocus,
              onChanged: onLoginChange,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Adresse mail',
                labelStyle: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              style: const TextStyle(
                  color: Colors.grey
              ),
              focusNode: passwordFocus,
              onChanged: onPasswordChange,
              obscureText: obscureText,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: 'Mot de passe',
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                  icon: obscureText ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
                ),
                labelStyle: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(20),
            child: ElevatedButton(
              onPressed: onLogin,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFFEB99),
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              ),
              child: const Text(
                'Connexion',
                style: TextStyle(
                  color: Color(0xFF292929),
                  fontSize: 15,
                )
              ),
            ),
          ),
        ],
      ),
    );
  }
}