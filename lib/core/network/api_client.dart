import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'http_methods.dart';

class ApiClient {
  static final ApiClient _singleton = ApiClient._internal();

  factory ApiClient() {
    return _singleton;
  }

  ApiClient._internal();

  Future<dynamic> get(
    String url, {
    Map<String, dynamic>? params,
    Map<String, String>? headers,
  }) async {
    try {
      _apiRequest(url, HttpMethod.get, params);
      final response = await http.get(Uri.parse(url));
      return response;
    } on SocketException {
      throw '';
    }
  }
}

void _apiRequest(
  String url,
  String method,
  Map<String, dynamic>? params,
) {
  //final headers0 = Map.from(headers);
  final param = params == null ? '' : json.encode(params);
  debugPrint(
    '''
      =============================
      API Request
      URL: $url
      Method: $method
      Params: $param
      =============================''',
    wrapWidth: 1024,
  );
}
