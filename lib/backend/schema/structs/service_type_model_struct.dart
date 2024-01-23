// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ServiceTypeModelStruct extends FFFirebaseStruct {
  ServiceTypeModelStruct({
    int? id,
    String? nameEn,
    String? nameAr,
    String? name,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _nameEn = nameEn,
        _nameAr = nameAr,
        _name = name,
        super(firestoreUtilData);

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;
  void incrementId(int amount) => _id = id + amount;
  bool hasId() => _id != null;

  // "name_en" field.
  String? _nameEn;
  String get nameEn => _nameEn ?? '';
  set nameEn(String? val) => _nameEn = val;
  bool hasNameEn() => _nameEn != null;

  // "name_ar" field.
  String? _nameAr;
  String get nameAr => _nameAr ?? '';
  set nameAr(String? val) => _nameAr = val;
  bool hasNameAr() => _nameAr != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  static ServiceTypeModelStruct fromMap(Map<String, dynamic> data) =>
      ServiceTypeModelStruct(
        id: castToType<int>(data['id']),
        nameEn: data['name_en'] as String?,
        nameAr: data['name_ar'] as String?,
        name: data['name'] as String?,
      );

  static ServiceTypeModelStruct? maybeFromMap(dynamic data) => data is Map
      ? ServiceTypeModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name_en': _nameEn,
        'name_ar': _nameAr,
        'name': _name,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'name_en': serializeParam(
          _nameEn,
          ParamType.String,
        ),
        'name_ar': serializeParam(
          _nameAr,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
      }.withoutNulls;

  static ServiceTypeModelStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ServiceTypeModelStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        nameEn: deserializeParam(
          data['name_en'],
          ParamType.String,
          false,
        ),
        nameAr: deserializeParam(
          data['name_ar'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ServiceTypeModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ServiceTypeModelStruct &&
        id == other.id &&
        nameEn == other.nameEn &&
        nameAr == other.nameAr &&
        name == other.name;
  }

  @override
  int get hashCode => const ListEquality().hash([id, nameEn, nameAr, name]);
}

ServiceTypeModelStruct createServiceTypeModelStruct({
  int? id,
  String? nameEn,
  String? nameAr,
  String? name,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ServiceTypeModelStruct(
      id: id,
      nameEn: nameEn,
      nameAr: nameAr,
      name: name,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ServiceTypeModelStruct? updateServiceTypeModelStruct(
  ServiceTypeModelStruct? serviceTypeModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    serviceTypeModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addServiceTypeModelStructData(
  Map<String, dynamic> firestoreData,
  ServiceTypeModelStruct? serviceTypeModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (serviceTypeModel == null) {
    return;
  }
  if (serviceTypeModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && serviceTypeModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final serviceTypeModelData =
      getServiceTypeModelFirestoreData(serviceTypeModel, forFieldValue);
  final nestedData =
      serviceTypeModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = serviceTypeModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getServiceTypeModelFirestoreData(
  ServiceTypeModelStruct? serviceTypeModel, [
  bool forFieldValue = false,
]) {
  if (serviceTypeModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(serviceTypeModel.toMap());

  // Add any Firestore field values
  serviceTypeModel.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getServiceTypeModelListFirestoreData(
  List<ServiceTypeModelStruct>? serviceTypeModels,
) =>
    serviceTypeModels
        ?.map((e) => getServiceTypeModelFirestoreData(e, true))
        .toList() ??
    [];
