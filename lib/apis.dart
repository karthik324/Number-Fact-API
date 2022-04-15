import 'dart:convert';

import 'package:api_integration/number_fact_response/number_fact_response.dart';
import 'package:http/http.dart' as http;

Future<NumberFactResponse> getNumber({required number}) async {
  final _response =
      await http.get(Uri.parse('http://numbersapi.com/$number?json'));
  final _bodyAsJson = jsonDecode(_response.body);
  final _data = NumberFactResponse.fromJson(_bodyAsJson);
  return _data;
}
