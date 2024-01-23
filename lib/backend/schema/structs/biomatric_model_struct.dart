// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BiomatricModelStruct extends FFFirebaseStruct {
  BiomatricModelStruct({
    String? phoneNumber,
    String? password,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _phoneNumber = phoneNumber,
        _password = password,
        super(firestoreUtilData);

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

  static BiomatricModelStruct? maybeFromMap(dynamic data) => data is Map
      ? BiomatricModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

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
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    BiomatricModelStruct(
      phoneNumber: phoneNumber,
      password: password,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

BiomatricModelStruct? updateBiomatricModelStruct(
  BiomatricModelStruct? biomatricModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    biomatricModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addBiomatricModelStructData(
  Map<String, dynamic> firestoreData,
  BiomatricModelStruct? biomatricModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (biomatricModel == null) {
    return;
  }
  if (biomatricModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && biomatricModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final biomatricModelData =
      getBiomatricModelFirestoreData(biomatricModel, forFieldValue);
  final nestedData =
      biomatricModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = biomatricModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getBiomatricModelFirestoreData(
  BiomatricModelStruct? biomatricModel, [
  bool forFieldValue = false,
]) {
  if (biomatricModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(biomatricModel.toMap());

  // Add any Firestore field values
  biomatricModel.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getBiomatricModelListFirestoreData(
  List<BiomatricModelStruct>? biomatricModels,
) =>
    biomatricModels
        ?.map((e) => getBiomatricModelFirestoreData(e, true))
        .toList() ??
    [];
