// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserModelStruct extends BaseStruct {
  UserModelStruct({
    String? name,
    String? email,
    String? phone,
    String? token,
    int? id,
  })  : _name = name,
        _email = email,
        _phone = phone,
        _token = token,
        _id = id;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;
  bool hasEmail() => _email != null;

  // "phone" field.
  String? _phone;
  String get phone => _phone ?? '';
  set phone(String? val) => _phone = val;
  bool hasPhone() => _phone != null;

  // "token" field.
  String? _token;
  String get token => _token ?? '';
  set token(String? val) => _token = val;
  bool hasToken() => _token != null;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;
  void incrementId(int amount) => _id = id + amount;
  bool hasId() => _id != null;

  static UserModelStruct fromMap(Map<String, dynamic> data) => UserModelStruct(
        name: data['name'] as String?,
        email: data['email'] as String?,
        phone: data['phone'] as String?,
        token: data['token'] as String?,
        id: castToType<int>(data['id']),
      );

  static UserModelStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? UserModelStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'email': _email,
        'phone': _phone,
        'token': _token,
        'id': _id,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
        'phone': serializeParam(
          _phone,
          ParamType.String,
        ),
        'token': serializeParam(
          _token,
          ParamType.String,
        ),
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
      }.withoutNulls;

  static UserModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserModelStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
        phone: deserializeParam(
          data['phone'],
          ParamType.String,
          false,
        ),
        token: deserializeParam(
          data['token'],
          ParamType.String,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'UserModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserModelStruct &&
        name == other.name &&
        email == other.email &&
        phone == other.phone &&
        token == other.token &&
        id == other.id;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([name, email, phone, token, id]);
}

UserModelStruct createUserModelStruct({
  String? name,
  String? email,
  String? phone,
  String? token,
  int? id,
}) =>
    UserModelStruct(
      name: name,
      email: email,
      phone: phone,
      token: token,
      id: id,
    );
