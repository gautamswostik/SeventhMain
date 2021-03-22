import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

  dynamic post(String url, Map<String, String> body) async {
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(body),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      log.i(response.body);
      return json.decode(response.body);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
