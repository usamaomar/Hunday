// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CarModelStruct extends BaseStruct {
  CarModelStruct({
    String? fullName,
    String? fullImage,
    int? id,
    String? nameEn,
    String? nameAr,
    int? status,
    String? modelCode,
    String? name,
  })  : _fullName = fullName,
        _fullImage = fullImage,
        _id = id,
        _nameEn = nameEn,
        _nameAr = nameAr,
        _status = status,
        _modelCode = modelCode,
        _name = name;

  // "fullName" field.
  String? _fullName;
  String get fullName => _fullName ?? '';
  set fullName(String? val) => _fullName = val;
  bool hasFullName() => _fullName != null;

  // "fullImage" field.
  String? _fullImage;
  String get fullImage => _fullImage ?? '';
  set fullImage(String? val) => _fullImage = val;
  bool hasFullImage() => _fullImage != null;

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

  // "model_code" field.
  String? _modelCode;
  String get modelCode => _modelCode ?? '';
  set modelCode(String? val) => _modelCode = val;
  bool hasModelCode() => _modelCode != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  static CarModelStruct fromMap(Map<String, dynamic> data) => CarModelStruct(
        fullName: data['fullName'] as String?,
        fullImage: data['fullImage'] as String?,
        id: castToType<int>(data['id']),
        nameEn: data['name_en'] as String?,
        nameAr: data['name_ar'] as String?,
        status: castToType<int>(data['status']),
        modelCode: data['model_code'] as String?,
        name: data['name'] as String?,
      );

  static CarModelStruct? maybeFromMap(dynamic data) =>
      data is Map ? CarModelStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'fullName': _fullName,
        'fullImage': _fullImage,
        'id': _id,
        'name_en': _nameEn,
        'name_ar': _nameAr,
        'status': _status,
        'model_code': _modelCode,
        'name': _name,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'fullName': serializeParam(
          _fullName,
          ParamType.String,
        ),
        'fullImage': serializeParam(
          _fullImage,
          ParamType.String,
        ),
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
        'model_code': serializeParam(
          _modelCode,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
      }.withoutNulls;

  static CarModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      CarModelStruct(
        fullName: deserializeParam(
          data['fullName'],
          ParamType.String,
          false,
        ),
        fullImage: deserializeParam(
          data['fullImage'],
          ParamType.String,
          false,
        ),
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
        modelCode: deserializeParam(
          data['model_code'],
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
  String toString() => 'CarModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CarModelStruct &&
        fullName == other.fullName &&
        fullImage == other.fullImage &&
        id == other.id &&
        nameEn == other.nameEn &&
        nameAr == other.nameAr &&
        status == other.status &&
        modelCode == other.modelCode &&
        name == other.name;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([fullName, fullImage, id, nameEn, nameAr, status, modelCode, name]);
}

CarModelStruct createCarModelStruct({
  String? fullName,
  String? fullImage,
  int? id,
  String? nameEn,
  String? nameAr,
  int? status,
  String? modelCode,
  String? name,
}) =>
    CarModelStruct(
      fullName: fullName,
      fullImage: fullImage,
      id: id,
      nameEn: nameEn,
      nameAr: nameAr,
      status: status,
      modelCode: modelCode,
      name: name,
    );
