// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BiomatricModelStruct extends BaseStruct {
  BiomatricModelStruct({
    String? phoneNumber,
    String? password,
  })  : _phoneNumber = phoneNumber,
        _password = password;

  // "phoneNumber" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  set phoneNumber(String? val) => _phoneNumber = val;
  bool hasPhoneNumber() => _phoneNumber != null;

  // "password" field.
  String? _password;
  String get password => _password ?? '';
  set password(String? val) => _password = val;
  bool hasPassword() => _password != null;

  static BiomatricModelStruct fromMap(Map<String, dynamic> data) =>
      BiomatricModelStruct(
        phoneNumber: data['phoneNumber'] as String?,
        password: data['password'] as String?,
      );

  static BiomatricModelStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? BiomatricModelStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'phoneNumber': _phoneNumber,
        'password': _password,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'phoneNumber': serializeParam(
          _phoneNumber,
          ParamType.String,
        ),
        'password': serializeParam(
          _password,
          ParamType.String,
        ),
      }.withoutNulls;

  static BiomatricModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      BiomatricModelStruct(
        phoneNumber: deserializeParam(
          data['phoneNumber'],
          ParamType.String,
          false,
        ),
        password: deserializeParam(
          data['password'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'BiomatricModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is BiomatricModelStruct &&
        phoneNumber == other.phoneNumber &&
        password == other.password;
  }

  @override
  int get hashCode => const ListEquality().hash([phoneNumber, password]);
}

BiomatricModelStruct createBiomatricModelStruct({
  String? phoneNumber,
  String? password,
}) =>
    BiomatricModelStruct(
      phoneNumber: phoneNumber,
      password: password,
    );
