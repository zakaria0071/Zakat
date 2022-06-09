import 'dart:convert';

import 'package:zakat_frontend/data/model/zakat_in_islam.dart';
import 'package:http/http.dart' as http;

import '../data/model/zakat_in_islam.dart';

class ZakatInIslamRepository {
  String _baseUrl = "http://192.168.1.242:7001/api/zakat-in-islam/";

  Future<List<ZakatInIslam>> getAllAyahAndHadith() async {
    try {
      final uri = Uri.parse(_baseUrl);
      final response = await http.get(uri);
      print("response is :${response.body}");
      List<dynamic> dynamicList = jsonDecode(utf8.decode(response.bodyBytes));
      List<ZakatInIslam> zakatRequests =
      dynamicList.map((x) => ZakatInIslam.fromMap(x)).toList();
      return zakatRequests;
    } catch (e) {
      throw e;
    }
  }

  Future<List<ZakatInIslam>> getAllHadith() async {
    List<ZakatInIslam> allAyahAndHadithList = await getAllAyahAndHadith();
    List<ZakatInIslam> allHadithList =
    allAyahAndHadithList.where((x) => x.narrationFrom == 'HADITH').toList();
    return allHadithList;
  }
}