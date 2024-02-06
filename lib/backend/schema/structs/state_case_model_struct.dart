// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StateCaseModelStruct extends FFFirebaseStruct {
  StateCaseModelStruct({
    String? baseUrl,
    bool? isLive,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _baseUrl = baseUrl,
        _isLive = isLive,
        super(firestoreUtilData);

  // "baseUrl" field.
  String? _baseUrl;
  String get baseUrl => _baseUrl ?? '';
  set baseUrl(String? val) => _baseUrl = val;
  bool hasBaseUrl() => _baseUrl != null;

  // "isLive" field.
  bool? _isLive;
  bool get isLive => _isLive ?? false;
  set isLive(bool? val) => _isLive = val;
  bool hasIsLive() => _isLive != null;

  static StateCaseModelStruct fromMap(Map<String, dynamic> data) =>
      StateCaseModelStruct(
        baseUrl: data['baseUrl'] as String?,
        isLive: data['isLive'] as bool?,
      );

  static StateCaseModelStruct? maybeFromMap(dynamic data) => data is Map
      ? StateCaseModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'baseUrl': _baseUrl,
        'isLive': _isLive,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'baseUrl': serializeParam(
          _baseUrl,
          ParamType.String,
        ),
        'isLive': serializeParam(
          _isLive,
          ParamType.bool,
        ),
      }.withoutNulls;

  static StateCaseModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      StateCaseModelStruct(
        baseUrl: deserializeParam(
          data['baseUrl'],
          ParamType.String,
          false,
        ),
        isLive: deserializeParam(
          data['isLive'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'StateCaseModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is StateCaseModelStruct &&
        baseUrl == other.baseUrl &&
        isLive == other.isLive;
  }

  @override
  int get hashCode => const ListEquality().hash([baseUrl, isLive]);
}

StateCaseModelStruct createStateCaseModelStruct({
  String? baseUrl,
  bool? isLive,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    StateCaseModelStruct(
      baseUrl: baseUrl,
      isLive: isLive,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

StateCaseModelStruct? updateStateCaseModelStruct(
  StateCaseModelStruct? stateCaseModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    stateCaseModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addStateCaseModelStructData(
  Map<String, dynamic> firestoreData,
  StateCaseModelStruct? stateCaseModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (stateCaseModel == null) {
    return;
  }
  if (stateCaseModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && stateCaseModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final stateCaseModelData =
      getStateCaseModelFirestoreData(stateCaseModel, forFieldValue);
  final nestedData =
      stateCaseModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = stateCaseModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getStateCaseModelFirestoreData(
  StateCaseModelStruct? stateCaseModel, [
  bool forFieldValue = false,
]) {
  if (stateCaseModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(stateCaseModel.toMap());

  // Add any Firestore field values
  stateCaseModel.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getStateCaseModelListFirestoreData(
  List<StateCaseModelStruct>? stateCaseModels,
) =>
    stateCaseModels
        ?.map((e) => getStateCaseModelFirestoreData(e, true))
        .toList() ??
    [];
