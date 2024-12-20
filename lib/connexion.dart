import 'package:flutter/material.dart';

class Connexion extends StatefulWidget {
  const Connexion({super.key});

  @override
  State<Connexion> createState() => _ConnexionState();
}

class _ConnexionState extends State<Connexion> {
  var obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Colors.orangeAccent,
                    Colors.black,
                  ]
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.only(top: 60.0, left: 22),
              child: Text(
                "Bienvenue\nConnectez-vous !",
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 200.0),
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40)
                ),
                color: Colors.white,
              ),
              height: double.infinity,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(left: 36.0,right: 36.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const TextField(
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.check,color: Colors.grey,),
                        label: Text(
                          'Adresse-mail',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.orangeAccent,
                          ),
                        ),
                      ),
                      style: TextStyle(color: Colors.grey),
                    ),
                    TextField(
                      obscureText: obscureText,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(!obscureText? Icons.visibility : Icons.visibility_off,color: Colors.grey,),
                          onPressed: () {
                            setState(() {
                              obscureText = !obscureText;
                              if(!obscureText) {

                              }
                            });
                          },
                        ),
                        label: const Text(
                          'Mot de passe',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.orangeAccent,
                          ),
                        ),
                      ),
                      style: const TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 16.0),
                    const Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Mot de passe oublié ?',
                        style: TextStyle(
                          color: Colors.orange,
                        ),
                      ),
                    ),
                    const SizedBox(height: 80),
                    InkWell(
                      child: Container(
                        height: 50,
                        width: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: const LinearGradient(
                              colors: [
                                Colors.orangeAccent,
                                Colors.black,
                              ]
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            'Se connecter',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                      onTap: () => Navigator.pushNamed(context,'/home'),
                      ),
                    const SizedBox(height: 120),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
