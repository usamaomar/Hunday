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
    String? gender,
    String? countryCode,
    String? bod,
    String? language,
    String? profilePhotoUrl,
    String? status,
  })  : _name = name,
        _email = email,
        _phone = phone,
        _token = token,
        _id = id,
        _gender = gender,
        _countryCode = countryCode,
        _bod = bod,
        _language = language,
        _profilePhotoUrl = profilePhotoUrl,
        _status = status;

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

  // "gender" field.
  String? _gender;
  String get gender => _gender ?? '';
  set gender(String? val) => _gender = val;
  bool hasGender() => _gender != null;

  // "country_code" field.
  String? _countryCode;
  String get countryCode => _countryCode ?? '';
  set countryCode(String? val) => _countryCode = val;
  bool hasCountryCode() => _countryCode != null;

  // "bod" field.
  String? _bod;
  String get bod => _bod ?? '';
  set bod(String? val) => _bod = val;
  bool hasBod() => _bod != null;

  // "language" field.
  String? _language;
  String get language => _language ?? '';
  set language(String? val) => _language = val;
  bool hasLanguage() => _language != null;

  // "profile_photo_url" field.
  String? _profilePhotoUrl;
  String get profilePhotoUrl => _profilePhotoUrl ?? '';
  set profilePhotoUrl(String? val) => _profilePhotoUrl = val;
  bool hasProfilePhotoUrl() => _profilePhotoUrl != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;
  bool hasStatus() => _status != null;

  static UserModelStruct fromMap(Map<String, dynamic> data) => UserModelStruct(
        name: data['name'] as String?,
        email: data['email'] as String?,
        phone: data['phone'] as String?,
        token: data['token'] as String?,
        id: castToType<int>(data['id']),
        gender: data['gender'] as String?,
        countryCode: data['country_code'] as String?,
        bod: data['bod'] as String?,
        language: data['language'] as String?,
        profilePhotoUrl: data['profile_photo_url'] as String?,
        status: data['status'] as String?,
      );

  static UserModelStruct? maybeFromMap(dynamic data) => data is Map
      ? UserModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'email': _email,
        'phone': _phone,
        'token': _token,
        'id': _id,
        'gender': _gender,
        'country_code': _countryCode,
        'bod': _bod,
        'language': _language,
        'profile_photo_url': _profilePhotoUrl,
        'status': _status,
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
        'gender': serializeParam(
          _gender,
          ParamType.String,
        ),
        'country_code': serializeParam(
          _countryCode,
          ParamType.String,
        ),
        'bod': serializeParam(
          _bod,
          ParamType.String,
        ),
        'language': serializeParam(
          _language,
          ParamType.String,
        ),
        'profile_photo_url': serializeParam(
          _profilePhotoUrl,
          ParamType.String,
        ),
        'status': serializeParam(
          _status,
          ParamType.String,
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
        gender: deserializeParam(
          data['gender'],
          ParamType.String,
          false,
        ),
        countryCode: deserializeParam(
          data['country_code'],
          ParamType.String,
          false,
        ),
        bod: deserializeParam(
          data['bod'],
          ParamType.String,
          false,
        ),
        language: deserializeParam(
          data['language'],
          ParamType.String,
          false,
        ),
        profilePhotoUrl: deserializeParam(
          data['profile_photo_url'],
          ParamType.String,
          false,
        ),
        status: deserializeParam(
          data['status'],
          ParamType.String,
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
        id == other.id &&
        gender == other.gender &&
        countryCode == other.countryCode &&
        bod == other.bod &&
        language == other.language &&
        profilePhotoUrl == other.profilePhotoUrl &&
        status == other.status;
  }

  @override
  int get hashCode => const ListEquality().hash([
        name,
        email,
        phone,
        token,
        id,
        gender,
        countryCode,
        bod,
        language,
        profilePhotoUrl,
        status
      ]);
}

UserModelStruct createUserModelStruct({
  String? name,
  String? email,
  String? phone,
  String? token,
  int? id,
  String? gender,
  String? countryCode,
  String? bod,
  String? language,
  String? profilePhotoUrl,
  String? status,
}) =>
    UserModelStruct(
      name: name,
      email: email,
      phone: phone,
      token: token,
      id: id,
      gender: gender,
      countryCode: countryCode,
      bod: bod,
      language: language,
      profilePhotoUrl: profilePhotoUrl,
      status: status,
    );
