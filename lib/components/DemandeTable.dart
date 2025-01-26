import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:maison_moel/data/Plat.dart';

void demandeTable(BuildContext context, Map<Plat, int> plats, String token) {
  showModalBottomSheet(
      backgroundColor: const Color(0xFF323232),
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.25,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  const SizedBox(height: 25),
                  const Text(
                    'Confirmation',
                    style: TextStyle(
                      color: Color(0xFFFFEB99),
                      fontSize: 30,
                      fontFamily: 'LibreBaskerville',
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Table N°: ',
                        style: TextStyle(
                          color: Color(0xFFFFEB99),
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(
                        width: 50,
                        child: TextField(
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.only(bottom: 0),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFFFEB99)),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFFFEB99)),
                            ),
                          ),
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(2),
                          ],
                          style: const TextStyle(
                            color: Color(0xFFFFEB99),
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF292929),
                      side: const BorderSide(
                        color: Color(0xFFFFEB99),
                        width: 0.5,
                      ),
                    ),
                    onPressed: () {

                    },
                    child: const Text(
                      'Confirmer la commande',
                      style: TextStyle(
                        color: Color(0xFFFFEB99),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }
  );
}