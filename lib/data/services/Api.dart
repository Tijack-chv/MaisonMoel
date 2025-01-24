import 'dart:convert';

import 'package:http/http.dart' as http;

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

  static Future getPlats(int type, String token) async {
    final uri = Uri.http('192.168.143.9', '/api/plats', {'type': type.toString(), 'token': token});

    print(uri);
    try {
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        print(jsonDecode(response.body));
        return jsonDecode(response.body);
      }
    } catch (e) {
      print(e);
    }
  }

  // suite méthodes API
}