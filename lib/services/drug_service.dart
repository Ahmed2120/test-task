import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/drug.dart';

class DrugService{
  static Future getDrugs() async {
    final url = Uri.parse(
        'https://run.mocky.io/v3/839062dd-ed50-4aca-b935-767e629ad30f');

    final res = await http.get(url);
    final responseData = json.decode(res.body);
    print('${responseData['drugs']}');
    return responseData['drugs'];
  }
}