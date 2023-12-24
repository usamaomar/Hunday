// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NewsModelStruct extends BaseStruct {
  NewsModelStruct({
    int? id,
    String? titleEn,
    String? titleAr,
    String? descriptionEn,
    String? descriptionAr,
    String? mainImage,
    String? thumbImage,
    String? date,
    int? status,
    String? createdAt,
    String? updatedAt,
    String? fullMainImage,
    String? fullThumbImage,
    String? title,
    String? description,
  })  : _id = id,
        _titleEn = titleEn,
        _titleAr = titleAr,
        _descriptionEn = descriptionEn,
        _descriptionAr = descriptionAr,
        _mainImage = mainImage,
        _thumbImage = thumbImage,
        _date = date,
        _status = status,
        _createdAt = createdAt,
        _updatedAt = updatedAt,
        _fullMainImage = fullMainImage,
        _fullThumbImage = fullThumbImage,
        _title = title,
        _description = description;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;
  void incrementId(int amount) => _id = id + amount;
  bool hasId() => _id != null;

  // "title_en" field.
  String? _titleEn;
  String get titleEn => _titleEn ?? '';
  set titleEn(String? val) => _titleEn = val;
  bool hasTitleEn() => _titleEn != null;

  // "title_ar" field.
  String? _titleAr;
  String get titleAr => _titleAr ?? '';
  set titleAr(String? val) => _titleAr = val;
  bool hasTitleAr() => _titleAr != null;

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

  // "main_image" field.
  String? _mainImage;
  String get mainImage => _mainImage ?? '';
  set mainImage(String? val) => _mainImage = val;
  bool hasMainImage() => _mainImage != null;

  // "thumb_image" field.
  String? _thumbImage;
  String get thumbImage => _thumbImage ?? '';
  set thumbImage(String? val) => _thumbImage = val;
  bool hasThumbImage() => _thumbImage != null;

  // "date" field.
  String? _date;
  String get date => _date ?? '';
  set date(String? val) => _date = val;
  bool hasDate() => _date != null;

  // "status" field.
  int? _status;
  int get status => _status ?? 0;
  set status(int? val) => _status = val;
  void incrementStatus(int amount) => _status = status + amount;
  bool hasStatus() => _status != null;

  // "created_at" field.
  String? _createdAt;
  String get createdAt => _createdAt ?? '';
  set createdAt(String? val) => _createdAt = val;
  bool hasCreatedAt() => _createdAt != null;

  // "updated_at" field.
  String? _updatedAt;
  String get updatedAt => _updatedAt ?? '';
  set updatedAt(String? val) => _updatedAt = val;
  bool hasUpdatedAt() => _updatedAt != null;

  // "full_main_image" field.
  String? _fullMainImage;
  String get fullMainImage => _fullMainImage ?? '';
  set fullMainImage(String? val) => _fullMainImage = val;
  bool hasFullMainImage() => _fullMainImage != null;

  // "full_thumb_image" field.
  String? _fullThumbImage;
  String get fullThumbImage => _fullThumbImage ?? '';
  set fullThumbImage(String? val) => _fullThumbImage = val;
  bool hasFullThumbImage() => _fullThumbImage != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;
  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;
  bool hasDescription() => _description != null;

  static NewsModelStruct fromMap(Map<String, dynamic> data) => NewsModelStruct(
        id: castToType<int>(data['id']),
        titleEn: data['title_en'] as String?,
        titleAr: data['title_ar'] as String?,
        descriptionEn: data['description_en'] as String?,
        descriptionAr: data['description_ar'] as String?,
        mainImage: data['main_image'] as String?,
        thumbImage: data['thumb_image'] as String?,
        date: data['date'] as String?,
        status: castToType<int>(data['status']),
        createdAt: data['created_at'] as String?,
        updatedAt: data['updated_at'] as String?,
        fullMainImage: data['full_main_image'] as String?,
        fullThumbImage: data['full_thumb_image'] as String?,
        title: data['title'] as String?,
        description: data['description'] as String?,
      );

  static NewsModelStruct? maybeFromMap(dynamic data) => data is Map
      ? NewsModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'title_en': _titleEn,
        'title_ar': _titleAr,
        'description_en': _descriptionEn,
        'description_ar': _descriptionAr,
        'main_image': _mainImage,
        'thumb_image': _thumbImage,
        'date': _date,
        'status': _status,
        'created_at': _createdAt,
        'updated_at': _updatedAt,
        'full_main_image': _fullMainImage,
        'full_thumb_image': _fullThumbImage,
        'title': _title,
        'description': _description,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'title_en': serializeParam(
          _titleEn,
          ParamType.String,
        ),
        'title_ar': serializeParam(
          _titleAr,
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
        'main_image': serializeParam(
          _mainImage,
          ParamType.String,
        ),
        'thumb_image': serializeParam(
          _thumbImage,
          ParamType.String,
        ),
        'date': serializeParam(
          _date,
          ParamType.String,
        ),
        'status': serializeParam(
          _status,
          ParamType.int,
        ),
        'created_at': serializeParam(
          _createdAt,
          ParamType.String,
        ),
        'updated_at': serializeParam(
          _updatedAt,
          ParamType.String,
        ),
        'full_main_image': serializeParam(
          _fullMainImage,
          ParamType.String,
        ),
        'full_thumb_image': serializeParam(
          _fullThumbImage,
          ParamType.String,
        ),
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
      }.withoutNulls;

  static NewsModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      NewsModelStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        titleEn: deserializeParam(
          data['title_en'],
          ParamType.String,
          false,
        ),
        titleAr: deserializeParam(
          data['title_ar'],
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
        mainImage: deserializeParam(
          data['main_image'],
          ParamType.String,
          false,
        ),
        thumbImage: deserializeParam(
          data['thumb_image'],
          ParamType.String,
          false,
        ),
        date: deserializeParam(
          data['date'],
          ParamType.String,
          false,
        ),
        status: deserializeParam(
          data['status'],
          ParamType.int,
          false,
        ),
        createdAt: deserializeParam(
          data['created_at'],
          ParamType.String,
          false,
        ),
        updatedAt: deserializeParam(
          data['updated_at'],
          ParamType.String,
          false,
        ),
        fullMainImage: deserializeParam(
          data['full_main_image'],
          ParamType.String,
          false,
        ),
        fullThumbImage: deserializeParam(
          data['full_thumb_image'],
          ParamType.String,
          false,
        ),
        title: deserializeParam(
          data['title'],
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
  String toString() => 'NewsModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is NewsModelStruct &&
        id == other.id &&
        titleEn == other.titleEn &&
        titleAr == other.titleAr &&
        descriptionEn == other.descriptionEn &&
        descriptionAr == other.descriptionAr &&
        mainImage == other.mainImage &&
        thumbImage == other.thumbImage &&
        date == other.date &&
        status == other.status &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        fullMainImage == other.fullMainImage &&
        fullThumbImage == other.fullThumbImage &&
        title == other.title &&
        description == other.description;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        titleEn,
        titleAr,
        descriptionEn,
        descriptionAr,
        mainImage,
        thumbImage,
        date,
        status,
        createdAt,
        updatedAt,
        fullMainImage,
        fullThumbImage,
        title,
        description
      ]);
}

NewsModelStruct createNewsModelStruct({
  int? id,
  String? titleEn,
  String? titleAr,
  String? descriptionEn,
  String? descriptionAr,
  String? mainImage,
  String? thumbImage,
  String? date,
  int? status,
  String? createdAt,
  String? updatedAt,
  String? fullMainImage,
  String? fullThumbImage,
  String? title,
  String? description,
}) =>
    NewsModelStruct(
      id: id,
      titleEn: titleEn,
      titleAr: titleAr,
      descriptionEn: descriptionEn,
      descriptionAr: descriptionAr,
      mainImage: mainImage,
      thumbImage: thumbImage,
      date: date,
      status: status,
      createdAt: createdAt,
      updatedAt: updatedAt,
      fullMainImage: fullMainImage,
      fullThumbImage: fullThumbImage,
      title: title,
      description: description,
    );
