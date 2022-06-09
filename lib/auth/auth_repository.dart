import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import '../constants/ip.dart';

class AuthRepository {
  Future<String> attemptAutoLogin() async {
    final storage = FlutterSecureStorage();

    String? refreshToken = await storage.read(key: 'refreshToken');
    String? token = await storage.read(key: 'token');
    if (refreshToken != null && token != null) {
      return token;
    }
    throw Exception('not signed in');
  }

  Future<String> login({required username, required password}) async {
    String apiUrl = "http://192.168.1.242:7001/api/auth/signin";

    var response = await http.post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode(
          <String, String>{"username": username, "password": password}),
    );

    if (response.statusCode == 200) {
      var jsonDecodedValue = jsonDecode(response.body);
      persistToken(
          token: jsonDecodedValue['token'],
          refreshToken: jsonDecodedValue['refreshToken'],
          userId: jsonDecodedValue['id']);
          
      return jsonDecodedValue['refreshToken'];
    } else {
      throw Exception('Failed to login');
    }
  }

  Future<void> persistToken(
      {required String token,
      required String refreshToken,
      required String userId}) async {
    final storage = FlutterSecureStorage();
    await storage.write(key: "token", value: token);
    await storage.write(key: "refreshToken", value: refreshToken);
    await storage.write(key: "userId", value: userId);
  }
  Future<String> generateToken() async {
    String jwt = '';
    final storage = FlutterSecureStorage();
    String? refreshToken = await storage.read(key: 'refreshToken');
    if (refreshToken != null) {
      var uri = Uri.parse("http://" + IP + ":7001/api/auth/refreshtoken");
      var response = await http.post(
        uri,
        headers: <String, String>{
          "Content-Type": "application/json; charset=UTF-8",
          "Access-Control-Allow-Origin":
          "*", // Required for CORS support to work
          "Access-Control-Allow-Credentials":
          "true", // Required for cookies, authorization headers with HTTPS
          "Access-Control-Allow-Headers":
          "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
          "Access-Control-Allow-Methods": "POST, OPTIONS"
        },
        body: jsonEncode(<String, String>{"refreshToken": refreshToken}),
      );

      var jsonEncodedResponse = jsonDecode(response.body);
      jwt = jsonEncodedResponse["accessToken"];
      return jwt;
    }
    return jwt;
  }

  void signOut(){
    final storage = new FlutterSecureStorage();
    // Delete all
      storage.deleteAll();
  }


}


