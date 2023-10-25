import 'dart:convert';
import 'dart:typed_data';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class LoginApiCall {
  static Future<ApiCallResponse> call({
    String? phone = '0777882330',
    String? password = 'password',
  }) async {
    final ffApiRequestBody = '''
{"phone":"${phone}","password":"${password}"}''';
    return ApiManager.instance.makeApiCall(
      callName: 'LoginApi',
      apiUrl: 'https://hyundai.completechaintech.com/api/login',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic userJsonModel(dynamic response) => getJsonField(
        response,
        r'''$''',
      );
  static dynamic id(dynamic response) => getJsonField(
        response,
        r'''$.id''',
      );
  static dynamic name(dynamic response) => getJsonField(
        response,
        r'''$.name''',
      );
  static dynamic email(dynamic response) => getJsonField(
        response,
        r'''$.email''',
      );
  static dynamic phone(dynamic response) => getJsonField(
        response,
        r'''$.phone''',
      );
  static dynamic token(dynamic response) => getJsonField(
        response,
        r'''$.token''',
      );
}

class RegisterApiCall {
  static Future<ApiCallResponse> call({
    String? phone = '',
    String? password = '',
    String? name = '',
    String? gender = '',
    String? lang = '',
    String? email = '',
    String? countryCode = 'JO',
    String? date = '',
  }) async {
    final ffApiRequestBody = '''
{
"phone": "${phone}",
"password": "${password}",
"name": "${name}",
"gender": "${gender}",
"lang": "${lang}",
"email": "${email}",
"country_code": "JO",
"date": "${date}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'RegisterApi',
      apiUrl: 'https://hyundai.completechaintech.com/api/register',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic userJsonModel(dynamic response) => getJsonField(
        response,
        r'''$''',
      );
  static dynamic id(dynamic response) => getJsonField(
        response,
        r'''$.id''',
      );
  static dynamic name(dynamic response) => getJsonField(
        response,
        r'''$.name''',
      );
  static dynamic email(dynamic response) => getJsonField(
        response,
        r'''$.email''',
      );
  static dynamic phone(dynamic response) => getJsonField(
        response,
        r'''$.phone''',
      );
  static dynamic token(dynamic response) => getJsonField(
        response,
        r'''$.token''',
      );
}

class TestAuthUserApiCall {
  static Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'TestAuthUserApi',
      apiUrl: 'https://hyundai.completechaintech.com/api/test',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class NewsApiCall {
  static Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'NewsApi',
      apiUrl: 'https://hyundai.completechaintech.com/api/news',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
        'Accept': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic newsModelList(dynamic response) => getJsonField(
        response,
        r'''$.news.data[:]''',
        true,
      );
}

class LocationApiCall {
  static Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'LocationApi',
      apiUrl: 'https://hyundai.completechaintech.com/api/location',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
        'Accept': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic apiLocationsJsonList(dynamic response) => getJsonField(
        response,
        r'''$.locations.data''',
        true,
      );
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
