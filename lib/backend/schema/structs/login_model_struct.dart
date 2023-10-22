// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LoginModelStruct extends BaseStruct {
  LoginModelStruct({
    String? accessToken,
    String? tokenType,
  })  : _accessToken = accessToken,
        _tokenType = tokenType;

  // "access_token" field.
  String? _accessToken;
  String get accessToken => _accessToken ?? '';
  set accessToken(String? val) => _accessToken = val;
  bool hasAccessToken() => _accessToken != null;

  // "token_type" field.
  String? _tokenType;
  String get tokenType => _tokenType ?? '';
  set tokenType(String? val) => _tokenType = val;
  bool hasTokenType() => _tokenType != null;

  static LoginModelStruct fromMap(Map<String, dynamic> data) =>
      LoginModelStruct(
        accessToken: data['access_token'] as String?,
        tokenType: data['token_type'] as String?,
      );

  static LoginModelStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? LoginModelStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'access_token': _accessToken,
        'token_type': _tokenType,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'access_token': serializeParam(
          _accessToken,
          ParamType.String,
        ),
        'token_type': serializeParam(
          _tokenType,
          ParamType.String,
        ),
      }.withoutNulls;

  static LoginModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      LoginModelStruct(
        accessToken: deserializeParam(
          data['access_token'],
          ParamType.String,
          false,
        ),
        tokenType: deserializeParam(
          data['token_type'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'LoginModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LoginModelStruct &&
        accessToken == other.accessToken &&
        tokenType == other.tokenType;
  }

  @override
  int get hashCode => const ListEquality().hash([accessToken, tokenType]);
}

LoginModelStruct createLoginModelStruct({
  String? accessToken,
  String? tokenType,
}) =>
    LoginModelStruct(
      accessToken: accessToken,
      tokenType: tokenType,
    );
