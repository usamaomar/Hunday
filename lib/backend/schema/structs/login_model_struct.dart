// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LoginModelStruct extends FFFirebaseStruct {
  LoginModelStruct({
    String? accessToken,
    String? tokenType,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _accessToken = accessToken,
        _tokenType = tokenType,
        super(firestoreUtilData);

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

  static LoginModelStruct? maybeFromMap(dynamic data) => data is Map
      ? LoginModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

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
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    LoginModelStruct(
      accessToken: accessToken,
      tokenType: tokenType,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

LoginModelStruct? updateLoginModelStruct(
  LoginModelStruct? loginModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    loginModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addLoginModelStructData(
  Map<String, dynamic> firestoreData,
  LoginModelStruct? loginModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (loginModel == null) {
    return;
  }
  if (loginModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && loginModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final loginModelData = getLoginModelFirestoreData(loginModel, forFieldValue);
  final nestedData = loginModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = loginModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getLoginModelFirestoreData(
  LoginModelStruct? loginModel, [
  bool forFieldValue = false,
]) {
  if (loginModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(loginModel.toMap());

  // Add any Firestore field values
  loginModel.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getLoginModelListFirestoreData(
  List<LoginModelStruct>? loginModels,
) =>
    loginModels?.map((e) => getLoginModelFirestoreData(e, true)).toList() ?? [];
