import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:maison_moel/data/Plat.dart';

const baseUrl = "192.168.143.9/api";

class API {
  static Future login(usernameC, passwordC) async {
    String username = usernameC.trim();
    String password = passwordC.trim();
    final uri = Uri.http('192.168.143.9', '/api/login', {'email': username, 'password': password, 'token': '489bea45-987d-4919-b3b2-4da2ad70e07c'});

    try {
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      }
    } catch (e) {
      print(e);
    }
  }

  static Future<List<Plat>> getPlats(int type, String token) async {
    final uri = Uri.http(
        '192.168.143.9',
        '/api/plats',
        {'type': type.toString(), 'token': token}  // Assurez-vous que 'type' est une chaîne
    );

    try {
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        print(jsonDecode(response.body));
        final Map<String, dynamic> data = json.decode(response.body);
        if (data['plats'] != null) {
          // Map les objets JSON en instances de Plat
          List<Plat> plats = List<Plat>.from(data['plats'].map((plat) => Plat.fromJson(plat)));
          return plats;
        } else {
          print('Aucun plat trouvé.');
          return [];
        }
      } else {
        print('Erreur API: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      print('Erreur lors de la récupération des plats: $e');
      return [];
    }
  }


}
