// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CarCategoriesStruct extends BaseStruct {
  CarCategoriesStruct({
    int? id,
    String? nameEn,
    String? nameAr,
    String? image,
    int? status,
    String? fullImage,
    String? name,
  })  : _id = id,
        _nameEn = nameEn,
        _nameAr = nameAr,
        _image = image,
        _status = status,
        _fullImage = fullImage,
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

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  set image(String? val) => _image = val;
  bool hasImage() => _image != null;

  // "status" field.
  int? _status;
  int get status => _status ?? 0;
  set status(int? val) => _status = val;
  void incrementStatus(int amount) => _status = status + amount;
  bool hasStatus() => _status != null;

  // "full_image" field.
  String? _fullImage;
  String get fullImage => _fullImage ?? '';
  set fullImage(String? val) => _fullImage = val;
  bool hasFullImage() => _fullImage != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  static CarCategoriesStruct fromMap(Map<String, dynamic> data) =>
      CarCategoriesStruct(
        id: castToType<int>(data['id']),
        nameEn: data['name_en'] as String?,
        nameAr: data['name_ar'] as String?,
        image: data['image'] as String?,
        status: castToType<int>(data['status']),
        fullImage: data['full_image'] as String?,
        name: data['name'] as String?,
      );

  static CarCategoriesStruct? maybeFromMap(dynamic data) => data is Map
      ? CarCategoriesStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name_en': _nameEn,
        'name_ar': _nameAr,
        'image': _image,
        'status': _status,
        'full_image': _fullImage,
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
        'image': serializeParam(
          _image,
          ParamType.String,
        ),
        'status': serializeParam(
          _status,
          ParamType.int,
        ),
        'full_image': serializeParam(
          _fullImage,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
      }.withoutNulls;

  static CarCategoriesStruct fromSerializableMap(Map<String, dynamic> data) =>
      CarCategoriesStruct(
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
        image: deserializeParam(
          data['image'],
          ParamType.String,
          false,
        ),
        status: deserializeParam(
          data['status'],
          ParamType.int,
          false,
        ),
        fullImage: deserializeParam(
          data['full_image'],
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
  String toString() => 'CarCategoriesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CarCategoriesStruct &&
        id == other.id &&
        nameEn == other.nameEn &&
        nameAr == other.nameAr &&
        image == other.image &&
        status == other.status &&
        fullImage == other.fullImage &&
        name == other.name;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([id, nameEn, nameAr, image, status, fullImage, name]);
}

CarCategoriesStruct createCarCategoriesStruct({
  int? id,
  String? nameEn,
  String? nameAr,
  String? image,
  int? status,
  String? fullImage,
  String? name,
}) =>
    CarCategoriesStruct(
      id: id,
      nameEn: nameEn,
      nameAr: nameAr,
      image: image,
      status: status,
      fullImage: fullImage,
      name: name,
    );
