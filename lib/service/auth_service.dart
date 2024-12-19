import 'dart:convert';

import 'package:http/http.dart' as http;

class AuthService {
  final String _baseUrl = 'https://dummyjson.com';

  /// Login method
  Future<String> login(String username, String password) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/auth/login'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'username': username,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data.containsKey('accessToken')) {
        
        return data['accessToken']; 
      } else {
        throw Exception('Login failed: No access token found');
      }
    } else {
      throw Exception('Login failed: ${response.reasonPhrase}');
    }
  }

  /// Get current user info with token
  Future<Map<String, dynamic>> getCurrentUser(String token) async {
    final response = await http.get(
      Uri.parse('$_baseUrl/users/me'), 
      headers: {
        'Authorization': 'Bearer $token', 
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body) as Map<String, dynamic>;
    } else {
      throw Exception('Failed to load user info: ${response.reasonPhrase}');
    }
  }
}
