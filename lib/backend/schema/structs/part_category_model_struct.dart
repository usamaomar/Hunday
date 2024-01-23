// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PartCategoryModelStruct extends FFFirebaseStruct {
  PartCategoryModelStruct({
    int? id,
    String? nameEn,
    String? nameAr,
    String? descriptionEn,
    String? descriptionAr,
    String? icon,
    int? status,
    String? fullIcon,
    String? name,
    String? description,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _nameEn = nameEn,
        _nameAr = nameAr,
        _descriptionEn = descriptionEn,
        _descriptionAr = descriptionAr,
        _icon = icon,
        _status = status,
        _fullIcon = fullIcon,
        _name = name,
        _description = description,
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

  // "description_en" field.
  String? _descriptionEn;
  String get descriptionEn => _descriptionEn ?? '';
  set descriptionEn(String? val) => _descriptionEn = val;
  bool hasDescriptionEn() => _descriptionEn != null;

  // "description_ar" field.
  String? _descriptionAr;
  String get descriptionAr => _descriptionAr ?? '';
  set descriptionAr(String? val) => _descriptionAr = val;
  bool hasDescriptionAr() => _descriptionAr != null;

  // "icon" field.
  String? _icon;
  String get icon => _icon ?? '';
  set icon(String? val) => _icon = val;
  bool hasIcon() => _icon != null;

  // "status" field.
  int? _status;
  int get status => _status ?? 0;
  set status(int? val) => _status = val;
  void incrementStatus(int amount) => _status = status + amount;
  bool hasStatus() => _status != null;

  // "full_icon" field.
  String? _fullIcon;
  String get fullIcon => _fullIcon ?? '';
  set fullIcon(String? val) => _fullIcon = val;
  bool hasFullIcon() => _fullIcon != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;
  bool hasDescription() => _description != null;

  static PartCategoryModelStruct fromMap(Map<String, dynamic> data) =>
      PartCategoryModelStruct(
        id: castToType<int>(data['id']),
        nameEn: data['name_en'] as String?,
        nameAr: data['name_ar'] as String?,
        descriptionEn: data['description_en'] as String?,
        descriptionAr: data['description_ar'] as String?,
        icon: data['icon'] as String?,
        status: castToType<int>(data['status']),
        fullIcon: data['full_icon'] as String?,
        name: data['name'] as String?,
        description: data['description'] as String?,
      );

  static PartCategoryModelStruct? maybeFromMap(dynamic data) => data is Map
      ? PartCategoryModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name_en': _nameEn,
        'name_ar': _nameAr,
        'description_en': _descriptionEn,
        'description_ar': _descriptionAr,
        'icon': _icon,
        'status': _status,
        'full_icon': _fullIcon,
        'name': _name,
        'description': _description,
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
        'description_en': serializeParam(
          _descriptionEn,
          ParamType.String,
        ),
        'description_ar': serializeParam(
          _descriptionAr,
          ParamType.String,
        ),
        'icon': serializeParam(
          _icon,
          ParamType.String,
        ),
        'status': serializeParam(
          _status,
          ParamType.int,
        ),
        'full_icon': serializeParam(
          _fullIcon,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
      }.withoutNulls;

  static PartCategoryModelStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      PartCategoryModelStruct(
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
        descriptionEn: deserializeParam(
          data['description_en'],
          ParamType.String,
          false,
        ),
        descriptionAr: deserializeParam(
          data['description_ar'],
          ParamType.String,
          false,
        ),
        icon: deserializeParam(
          data['icon'],
          ParamType.String,
          false,
        ),
        status: deserializeParam(
          data['status'],
          ParamType.int,
          false,
        ),
        fullIcon: deserializeParam(
          data['full_icon'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'PartCategoryModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PartCategoryModelStruct &&
        id == other.id &&
        nameEn == other.nameEn &&
        nameAr == other.nameAr &&
        descriptionEn == other.descriptionEn &&
        descriptionAr == other.descriptionAr &&
        icon == other.icon &&
        status == other.status &&
        fullIcon == other.fullIcon &&
        name == other.name &&
        description == other.description;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        nameEn,
        nameAr,
        descriptionEn,
        descriptionAr,
        icon,
        status,
        fullIcon,
        name,
        description
      ]);
}

PartCategoryModelStruct createPartCategoryModelStruct({
  int? id,
  String? nameEn,
  String? nameAr,
  String? descriptionEn,
  String? descriptionAr,
  String? icon,
  int? status,
  String? fullIcon,
  String? name,
  String? description,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PartCategoryModelStruct(
      id: id,
      nameEn: nameEn,
      nameAr: nameAr,
      descriptionEn: descriptionEn,
      descriptionAr: descriptionAr,
      icon: icon,
      status: status,
      fullIcon: fullIcon,
      name: name,
      description: description,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PartCategoryModelStruct? updatePartCategoryModelStruct(
  PartCategoryModelStruct? partCategoryModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    partCategoryModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPartCategoryModelStructData(
  Map<String, dynamic> firestoreData,
  PartCategoryModelStruct? partCategoryModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (partCategoryModel == null) {
    return;
  }
  if (partCategoryModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && partCategoryModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final partCategoryModelData =
      getPartCategoryModelFirestoreData(partCategoryModel, forFieldValue);
  final nestedData =
      partCategoryModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = partCategoryModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPartCategoryModelFirestoreData(
  PartCategoryModelStruct? partCategoryModel, [
  bool forFieldValue = false,
]) {
  if (partCategoryModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(partCategoryModel.toMap());

  // Add any Firestore field values
  partCategoryModel.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPartCategoryModelListFirestoreData(
  List<PartCategoryModelStruct>? partCategoryModels,
) =>
    partCategoryModels
        ?.map((e) => getPartCategoryModelFirestoreData(e, true))
        .toList() ??
    [];
