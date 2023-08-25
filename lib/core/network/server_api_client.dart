// Class to create de API connection serverr

import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:rick_and_morty_app/core/constant/constants_app.dart';
import 'package:rick_and_morty_app/core/entities/response_api_generic_entity.dart';
import 'package:rick_and_morty_app/core/injection/injection_container.dart';
import 'package:rick_and_morty_app/core/network/exception.dart';
import 'package:rick_and_morty_app/core/network/network_info.dart';

class ServerApiClient {
  final NetworkInfoRepository networkInfoRepository;

  ServerApiClient({required this.networkInfoRepository});

  final Map<String, String> _authHeader = {};

  final Map<String, String> _resetHeaders = {};

  //Here we can access  to external auth header
  Map<String, String> get authHeader => _authHeader;

  //Here we can access  to external auth header
  Map<String, String> get resetHeader => _resetHeaders;

  /// Method to format the log response
  String _formatResponseLog(http.Response response, {Object? requestBody}) {
    final time = DateTime.now().toUtc().toIso8601String();

    JsonEncoder encoder = const JsonEncoder.withIndent(' ');
    String formattedRequestBody =
        requestBody != null ? encoder.convert(requestBody) : '';

    String formattedBodyJson;

    try {
      final json = jsonDecode(response.body);
      formattedBodyJson = encoder.convert(json);
    } catch (_) {
      formattedBodyJson = response.body;
    }

    return '''
          $time
          Request: ${response.request}${formattedRequestBody.isNotEmpty == true ? '\n  Request body: $formattedRequestBody' : ''}
          Response code: ${response.statusCode}
          Body: $formattedBodyJson
          ''';
  }

  Future<T> _proccessResponse<T>({
    required http.Response response,
    required Future<T> Function() requestFunc,
    dynamic instance,
  }) async {
    if (response.statusCode >= 200 && response.statusCode <= 300) {
      return response as T;
    } else if (response.statusCode >= 400) {
      final respuesta = ResponseApiGenericEntity.fromJson<T>(
          instance: instance, json: jsonDecode(response.body));
      throw ServerException(message: respuesta?.messageReponse.description);
    } else if (response.statusCode == 503) {
      throw ServerException(
        message: 'Servicio no disponible. Contacte al administrador',
      );
    } else {
      return response as T;
    }
  }

  ///Method HTTP GET protocol
  Future<http.Response> get(
    String endpoint, {
    Map<String, String>? queryParameters,
    Map<String, String>? headers,
  }) async {
    final url = Uri(
      scheme: ConstatnsApp.serverSchemaSecure,
      host: ConstatnsApp.baseUrl,
      path: endpoint,
      queryParameters: queryParameters,
    );

    http.Response response;

    try {
      response =
          await http.get(url, headers: _authHeader..addAll(headers ?? {}));
    } catch (_) {
      final check = await networkInfoRepository.hasConnection;

      if (!check) {
        await getIt.popScope();
      }
      rethrow;
    }

    if (kDebugMode) {
      log(_formatResponseLog(response));
    }

    return _proccessResponse(
      response: response,
      requestFunc: () => get(
        endpoint,
        queryParameters: queryParameters,
        headers: headers,
      ),
    );
  }

  ///Method HTTP POST protocol
  ///
  Future<http.Response> post(
    String endpoint, {
    Map<String, String>? queryParameters,
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) async {
    final url = Uri(
      scheme: ConstatnsApp.serverSchemaSecure,
      host: ConstatnsApp.baseUrl,
      path: endpoint,
      queryParameters: queryParameters,
    );

    final Map<String, String> allHeaders = _authHeader;

    if (headers != null) {
      allHeaders.addAll(headers);
    }
    if (!allHeaders.containsKey('Content-Type')) {
      allHeaders['Content-Type'] = 'application/json';
    }

    http.Response response;

    try {
      response = await http.post(
        url,
        headers: allHeaders,
        body: jsonEncode(body),
        encoding: encoding,
      );
    } catch (_) {
      final check = await networkInfoRepository.hasConnection;

      if (!check) {
        await getIt.popScope();
      }
      rethrow;
    }

    if (kDebugMode) {
      log(_formatResponseLog(response));
    }

    return _proccessResponse(
      response: response,
      requestFunc: () => post(
        endpoint,
        queryParameters: queryParameters,
        headers: headers,
        body: body,
        encoding: encoding,
      ),
    );
  }

  ///Method HTTP put protocol
  ///
  Future<http.Response> put(
    String endpoint, {
    Map<String, String>? queryParameters,
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) async {
    final url = Uri(
      scheme: ConstatnsApp.serverSchemaSecure,
      host: ConstatnsApp.baseUrl,
      path: endpoint,
      queryParameters: queryParameters,
    );

    if (headers != null) {
      _authHeader.addAll(headers);
    }
    if (!_authHeader.containsKey('Content-Type')) {
      _authHeader['Content-Type'] = 'application/json';
    }

    http.Response response;

    try {
      response = await http.put(
        url,
        headers: _authHeader,
        body: jsonEncode(body),
        encoding: encoding,
      );
    } catch (_) {
      final check = await networkInfoRepository.hasConnection;

      if (!check) {
        await getIt.popScope();
      }
      rethrow;
    }

    if (kDebugMode) {
      log(_formatResponseLog(response));
    }

    return _proccessResponse(
      response: response,
      requestFunc: () => put(
        endpoint,
        queryParameters: queryParameters,
        headers: headers,
        body: body,
        encoding: encoding,
      ),
    );
  }
}
