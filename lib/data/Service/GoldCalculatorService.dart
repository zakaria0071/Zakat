import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:zakat_frontend/auth/auth_repository.dart';
import 'package:zakat_frontend/constants/ip.dart';
class GoldCalculatorService{

  final AuthRepository _authRepository = AuthRepository();
  final baseUrl = "http://" + IP + ":7001/api/";

  get http => null;

  Future<List<dynamic>> findAll() async {
    String jwt = await _authRepository.generateToken();
    final response = await http.get(Uri.parse(baseUrl + "request-category"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $jwt'
        });
    if (response.statusCode == 200) {
      return jsonDecode(response.body) as List;
    } else {
      print(response.body);
      throw Exception("Failed to load request category");
    }
  }
}

