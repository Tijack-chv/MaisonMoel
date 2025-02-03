import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:maison_moel/data/Commande.dart';
import 'package:maison_moel/data/Message.dart';
import 'package:maison_moel/data/Plat.dart';

const baseUrl = "192.168.143.9/api";

class API {
  static Future login(usernameC, passwordC) async {
    String username = usernameC.trim();
    String password = passwordC.trim();
    final uri = Uri.http('maisonmoel-192-168-143-12.traefik.me', '/api/login', {'email': username, 'password': password, 'token': '489bea45-987d-4919-b3b2-4da2ad70e07c'});

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
        'maisonmoel-192-168-143-12.traefik.me',
        '/api/plats',
        {'type': type.toString(), 'token': token}  // Assurez-vous que 'type' est une chaîne
    );

    try {
      final response = await http.get(uri);

      if (response.statusCode == 200) {
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

  static Future<void> sendMessage(String message, String token) async {
    final uri = Uri.http(
        'maisonmoel-192-168-143-12.traefik.me',
        '/api/sendMessage',
        {'message': message, 'token': token});

    try {
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        print('Message envoyé.');
      } else {
        print('Erreur API: ${response.statusCode}');
      }
    } catch (e) {
      print('Erreur lors de l\'envoi du message: $e');
    }
  }

  static Future<List<Message>> getMessages(String token) async {
    final uri = Uri.http(
        'maisonmoel-192-168-143-12.traefik.me',
        '/api/getMessages',
        {'token': token}  // Assurez-vous que 'type' est une chaîne
    );

    try {
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        if (data['messages'] != null) {
          List<Message> messages = List<Message>.from(data['messages'].map((message) => Message.fromJson(message)));
          return messages;
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

  static Future<List<Commande>> getCommandes(int index, String token) async {
    final uri = Uri.http(
        'maisonmoel-192-168-143-12.traefik.me',
        '/api/getCommandes',
        {'etat': index.toString(), 'token': token}
    );

    try {
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        if (data['commandes'] != null) {
          List<Commande> commandes = List<Commande>.from(
              data['commandes'].map((commande) => Commande.fromJson(commande)));
          return commandes;
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

  static Future<int> createCommande(String table, String token) async {
    final uri = Uri.http(
        'maisonmoel-192-168-143-12.traefik.me',
        '/api/registerOrder',
        {'token': token, 'table': table}
    );

    try {
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        if (data['success'] != null) {
          return data['success'];
        } else {
          return -2;
        }
      } else {
        print('Erreur API: ${response.statusCode}');
        return -1;
      }
    } catch (e) {
      print('Erreur lors de la récupération des plats: $e');
      return -1;
    }
  }

  static Future<void> createLigneCommande(Plat plat, String idCommande, String token, String quantite) async {
    final uri = Uri.http(
        'maisonmoel-192-168-143-12.traefik.me',
        '/api/registerLignOrder',
        {'token': token, 'plat': plat.idPlat.toString(), 'commande': idCommande, 'quantite': quantite, 'prix': (plat.prix*int.parse(quantite)).toString()}
    );

    try {
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        if (data['success'] != null) {
          print('Ligne de commande créée.');
        } else {
          print('Erreur lors de la création de la ligne de commande.');
        }
      } else {
        print('Erreur API: ${response.statusCode}');
      }
    } catch (e) {
      print('Erreur lors de la récupération des plats: $e');
    }
  }

  static Future<String> verificationQRCode(String uuid, String token) async {
    String id = uuid.trim();
    final uri = Uri.http(
        'maisonmoel-192-168-143-12.traefik.me',
        '/api/registerReservation',
        {'uuid': id, 'token': token}
    );

    try {
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        if (data['success'] != null) {
          return data['success'];
        } else {
          return data['error'];
        }
      } else {
        return 'Erreur API: ${response.statusCode}';
      }
    } catch (e) {
      return 'Erreur lors de la vérification du QR Code: $e';
    }
  }
}