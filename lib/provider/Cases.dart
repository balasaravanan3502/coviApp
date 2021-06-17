import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Cases with ChangeNotifier {
  List latestCases = [];

  Future<void> getlatestCases() async {
    final url =
        'https://api.apify.com/v2/key-value-stores/toDWvRj1JpTXiM8FF/records/LATEST?disableRedirect=true';
    try {
      final response = await http.get(Uri.parse(url));
      latestCases.addAll([json.decode(response.body)]);
    } catch (error) {
      print(error);
    }
  }

  List<dynamic> getCases() {
    return [...latestCases];
  }
}
