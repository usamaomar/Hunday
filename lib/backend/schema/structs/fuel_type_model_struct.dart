// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FuelTypeModelStruct extends BaseStruct {
  FuelTypeModelStruct({
    int? id,
    String? nameEn,
    String? nameAr,
    int? status,
    String? name,
  })  : _id = id,
        _nameEn = nameEn,
        _nameAr = nameAr,
        _status = status,
        _name = name;

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

  // "status" field.
  int? _status;
  int get status => _status ?? 0;
  set status(int? val) => _status = val;
  void incrementStatus(int amount) => _status = status + amount;
  bool hasStatus() => _status != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  static FuelTypeModelStruct fromMap(Map<String, dynamic> data) =>
      FuelTypeModelStruct(
        id: castToType<int>(data['id']),
        nameEn: data['name_en'] as String?,
        nameAr: data['name_ar'] as String?,
        status: castToType<int>(data['status']),
        name: data['name'] as String?,
      );

  static FuelTypeModelStruct? maybeFromMap(dynamic data) => data is Map
      ? FuelTypeModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name_en': _nameEn,
        'name_ar': _nameAr,
        'status': _status,
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
        'status': serializeParam(
          _status,
          ParamType.int,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
      }.withoutNulls;

  static FuelTypeModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      FuelTypeModelStruct(
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
        status: deserializeParam(
          data['status'],
          ParamType.int,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'FuelTypeModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FuelTypeModelStruct &&
        id == other.id &&
        nameEn == other.nameEn &&
        nameAr == other.nameAr &&
        status == other.status &&
        name == other.name;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([id, nameEn, nameAr, status, name]);
}

FuelTypeModelStruct createFuelTypeModelStruct({
  int? id,
  String? nameEn,
  String? nameAr,
  int? status,
  String? name,
}) =>
    FuelTypeModelStruct(
      id: id,
      nameEn: nameEn,
      nameAr: nameAr,
      status: status,
      name: name,
    );
