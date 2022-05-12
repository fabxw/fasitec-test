import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const request = "https://api.publicapis.org/entries";

Future<Map<String, dynamic>> getData() async {
  http.Response response = await http.get(Uri.parse(request));

  debugPrint(response.body);

  Map<String, dynamic> data =
      Map<String, dynamic>.from(json.decode(response.body));

  return data;
}
