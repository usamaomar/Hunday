// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TestStruct extends BaseStruct {
  TestStruct({
    List<CarModelStruct>? listOfCarModel,
  }) : _listOfCarModel = listOfCarModel;

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

TestStruct createTestStruct() => TestStruct();
