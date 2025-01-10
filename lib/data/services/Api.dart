import 'package:http/http.dart' as http;

const baseUrl = "192.168.143.9/api";

class API {
  static Future login(username, password) {
    return http.post(Uri.parse("$baseUrl/login"), body: {
      "username": username,
      "password": password,
    });
  }

  // suite méthodes API
}