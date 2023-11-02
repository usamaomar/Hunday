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
"name_en": "${name}",
"name": "${name}",
"gender": "${gender}",
"lang": "${lang}",
"email": "${email}",
"country_code": "JO",
"bod": "${date}"
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
        r'''$.user''',
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

class GetMobileNumberCall {
  static Future<ApiCallResponse> call({
    String? phone = '',
  }) async {
    final ffApiRequestBody = '''
{
"phone": "${phone}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GetMobileNumber',
      apiUrl:
          'https://hyundai.completechaintech.com/api/forgetPassword/getMobileNumber',
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
}

class GetVerifiedCodeApiCall {
  static Future<ApiCallResponse> call({
    String? phone = '',
    String? verifiedCode = '',
  }) async {
    final ffApiRequestBody = '''
{
  "phone": "${phone}",
  "verified_code": "${verifiedCode}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GetVerifiedCodeApi',
      apiUrl:
          'https://hyundai.completechaintech.com/api/forgetPassword/getVerifiedCode',
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

  static dynamic token(dynamic response) => getJsonField(
        response,
        r'''$.token''',
      );
}

class ChangePasswordApiCall {
  static Future<ApiCallResponse> call({
    String? passwordConfirmation = '',
    String? password = '',
    String? token = '',
  }) async {
    final ffApiRequestBody = '''
{
  "password": "${password}",
  "password_confirmation": "${passwordConfirmation}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'ChangePasswordApi',
      apiUrl:
          'https://hyundai.completechaintech.com/api/forgetPassword/changePassword',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
        'Accept': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

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
        'Accept': 'application/json',
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

class OfferApiCall {
  static Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'OfferApi',
      apiUrl: 'https://hyundai.completechaintech.com/api/offer',
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

  static dynamic apiListOffersJson(dynamic response) => getJsonField(
        response,
        r'''$.offers.data''',
        true,
      );
}

class SocialMediaApiCall {
  static Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'SocialMediaApi',
      apiUrl: 'https://hyundai.completechaintech.com/api/social-media',
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

  static dynamic socialMediaJsonObject(dynamic response) => getJsonField(
        response,
        r'''$.socialmedia''',
      );
}

class SliderApiCall {
  static Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'SliderApi',
      apiUrl: 'https://hyundai.completechaintech.com/api/slider',
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

  static dynamic listOfStringUrls(dynamic response) => getJsonField(
        response,
        r'''$.slider.data[:].full_image''',
        true,
      );
  static dynamic listOfTitles(dynamic response) => getJsonField(
        response,
        r'''$.slider.data[:].title''',
        true,
      );
}

class CarModelsApiCall {
  static Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'CarModelsApi',
      apiUrl: 'https://hyundai.completechaintech.com/api/carModel',
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

  static dynamic carModelList(dynamic response) => getJsonField(
        response,
        r'''$.carModel.data''',
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
