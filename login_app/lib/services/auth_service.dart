import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService {
  final _storage = FlutterSecureStorage();

  Future<Map<String, dynamic>?> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('http://10.0.2.2:8080/api/auth/signin'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "email": email,
          "password": password,
        }),
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        var user = jsonDecode(response.body);

        // Store the access token securely
        await _storage.write(key: 'accessToken', value: user['accessToken']);

        return user;
      } else {
        print('Login failed: ${response.body}');
        return null;
      }
    } catch (error) {
      print('Error during login: $error');
      return null;
    }
  }

  Future<String?> getAccessToken() async {
    return await _storage.read(key: 'accessToken');
  }

  Future<void> logout() async {
    await _storage.delete(key: 'accessToken');
  }
}
