// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TestStruct extends FFFirebaseStruct {
  TestStruct({
    List<CarModelStruct>? listOfCarModel,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _listOfCarModel = listOfCarModel,
        super(firestoreUtilData);

  // "listOfCarModel" field.
  List<CarModelStruct>? _listOfCarModel;
  List<CarModelStruct> get listOfCarModel => _listOfCarModel ?? const [];
  set listOfCarModel(List<CarModelStruct>? val) => _listOfCarModel = val;
  void updateListOfCarModel(Function(List<CarModelStruct>) updateFn) =>
      updateFn(_listOfCarModel ??= []);
  bool hasListOfCarModel() => _listOfCarModel != null;

  static TestStruct fromMap(Map<String, dynamic> data) => TestStruct(
        listOfCarModel: getStructList(
          data['listOfCarModel'],
          CarModelStruct.fromMap,
        ),
      );

  static TestStruct? maybeFromMap(dynamic data) =>
      data is Map ? TestStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'listOfCarModel': _listOfCarModel?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'listOfCarModel': serializeParam(
          _listOfCarModel,
          ParamType.DataStruct,
          true,
        ),
      }.withoutNulls;

  static TestStruct fromSerializableMap(Map<String, dynamic> data) =>
      TestStruct(
        listOfCarModel: deserializeStructParam<CarModelStruct>(
          data['listOfCarModel'],
          ParamType.DataStruct,
          true,
          structBuilder: CarModelStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'TestStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is TestStruct &&
        listEquality.equals(listOfCarModel, other.listOfCarModel);
  }

  @override
  int get hashCode => const ListEquality().hash([listOfCarModel]);
}

TestStruct createTestStruct({
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TestStruct(
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TestStruct? updateTestStruct(
  TestStruct? test, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    test
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTestStructData(
  Map<String, dynamic> firestoreData,
  TestStruct? test,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (test == null) {
    return;
  }
  if (test.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && test.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final testData = getTestFirestoreData(test, forFieldValue);
  final nestedData = testData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = test.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTestFirestoreData(
  TestStruct? test, [
  bool forFieldValue = false,
]) {
  if (test == null) {
    return {};
  }
  final firestoreData = mapToFirestore(test.toMap());

  // Add any Firestore field values
  test.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTestListFirestoreData(
  List<TestStruct>? tests,
) =>
    tests?.map((e) => getTestFirestoreData(e, true)).toList() ?? [];
