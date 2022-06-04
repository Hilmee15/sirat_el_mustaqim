import 'dart:convert';
import 'package:sirat_el_mustaqim/model/asmaulhusna.dart';
import 'package:http/http.dart' as http;
import 'package:sirat_el_mustaqim/model/ayatkursi.dart';
import 'package:sirat_el_mustaqim/model/bacaanshalat.dart';
import 'package:sirat_el_mustaqim/model/doaharian.dart';
import 'package:sirat_el_mustaqim/model/kisahnabi.dart';
import 'package:sirat_el_mustaqim/model/niatshalat.dart';

String baseUrl = 'https://islamic-api-zhirrr.vercel.app';

class AsmaAllah {
  static Future<List<AsmaulHusna>> getData() async {
    List<AsmaulHusna> list = [];
    String url = '$baseUrl/api/asmaulhusna';
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var result = data['data'] as List;
      list = result.map((json) => AsmaulHusna.fromJSON(json)).toList();
      print(response.body);
      return list;
    } else {
      throw Exception(
          'Afwan muslim\'s, data not found');
    }
  }
}

class Dua {
  static Future<List<Doa>> getData() async {
    List<Doa>? list;
    String url = '$baseUrl/api/doaharian';
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var result = data['data'] as List;
      list = result.map((json) => Doa.fromJSON(json)).toList();
      print(response.body);
      return list;
    } else {
      throw Exception(
          'Afwan muslim\'s, data not found');
    }
  }
}

class Ayat {
  static Future<AyatKursi> getData() async {
    AyatKursi data;
    String url = '$baseUrl/api/ayatkursi';
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var result = data['data'];
      data = AyatKursi.fromJSON(result);
      print(response.body);
      return data;
    } else {
      throw Exception(
          'Afwan muslim\'s, data not found');
    }
  }
}

class BacaanDalamShalat {
  static Future<List<BacaanShalat>> getData() async {
    List<BacaanShalat> list = [];
    String url = '$baseUrl/api/bacaanshalat';
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var result = data as List;
      list = result.map((json) => BacaanShalat.fromJSON(json)).toList();
      print(response.body);
      return list;
    } else {
      throw Exception(
          'Afwan muslim\'s, data not found');
    }
  }
}

class Niat {
  static Future<List<NiatShalat>> getData() async {
    List<NiatShalat>? list;
    String url = '$baseUrl/api/niatshalat';
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var result = data as List;
      list = result.map((json) => NiatShalat.fromJSON(json)).toList();
      print(response.body);
      return list;
    } else {
      throw Exception(
          'Afwan muslim\'s, data not found');
    }
  }
}

class Kisah {
  static Future<List<KisahNabi>> getData() async {
    List<KisahNabi> list;
    String url = '$baseUrl/api/kisahnabi';
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      try {
        var data = jsonDecode(response.body);
        var result = data as List;
        print(response.body);
        list = result.map((json) => KisahNabi.fromJSON(json)).toList();
        return list;
      } catch(e) {
        print(e);
        throw Exception(e);
      }
    } else {
      throw Exception(
          'Afwan muslim\'s, data not found');
    }
  }
}
