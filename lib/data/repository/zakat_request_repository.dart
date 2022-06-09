import 'dart:convert';

import 'package:zakat_frontend/data/model/zakat_request.dart';
import 'package:http/http.dart' as http;

import '../model/zakat_request.dart';

class ZakatRequestRepoSitory {
  String _baseUrl = "http://192.168.1.242:7001/api/zakat-request/";

  Future<List<ZakatRequest>> getAllZakatRequest() async {
    print("IN repo");
    try {
      final uri = Uri.parse(_baseUrl);
      final response = await http.get(uri);
      List<dynamic> dynamicList = jsonDecode(response.body);
      List<ZakatRequest> zakatRequests = dynamicList.map((x) => ZakatRequest.fromMap(x)).toList();
      return zakatRequests;
    } catch (e) {
      throw e;
    }
  }
}
