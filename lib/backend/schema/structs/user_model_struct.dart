// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserModelStruct extends FFFirebaseStruct {
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
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
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
        _status = status,
        super(firestoreUtilData);

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
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
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
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UserModelStruct? updateUserModelStruct(
  UserModelStruct? userModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    userModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUserModelStructData(
  Map<String, dynamic> firestoreData,
  UserModelStruct? userModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (userModel == null) {
    return;
  }
  if (userModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && userModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final userModelData = getUserModelFirestoreData(userModel, forFieldValue);
  final nestedData = userModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = userModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUserModelFirestoreData(
  UserModelStruct? userModel, [
  bool forFieldValue = false,
]) {
  if (userModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(userModel.toMap());

  // Add any Firestore field values
  userModel.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUserModelListFirestoreData(
  List<UserModelStruct>? userModels,
) =>
    userModels?.map((e) => getUserModelFirestoreData(e, true)).toList() ?? [];
