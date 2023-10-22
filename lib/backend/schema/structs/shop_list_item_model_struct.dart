// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ShopListItemModelStruct extends BaseStruct {
  ShopListItemModelStruct({
    String? imageUrl,
    String? title,
    String? description,
  })  : _imageUrl = imageUrl,
        _title = title,
        _description = description;

  // "image_url" field.
  String? _imageUrl;
  String get imageUrl => _imageUrl ?? '';
  set imageUrl(String? val) => _imageUrl = val;
  bool hasImageUrl() => _imageUrl != null;

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

  static ShopListItemModelStruct fromMap(Map<String, dynamic> data) =>
      ShopListItemModelStruct(
        imageUrl: data['image_url'] as String?,
        title: data['title'] as String?,
        description: data['description'] as String?,
      );

  static ShopListItemModelStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic>
          ? ShopListItemModelStruct.fromMap(data)
          : null;

  Map<String, dynamic> toMap() => {
        'image_url': _imageUrl,
        'title': _title,
        'description': _description,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'image_url': serializeParam(
          _imageUrl,
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

  static ShopListItemModelStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ShopListItemModelStruct(
        imageUrl: deserializeParam(
          data['image_url'],
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
  String toString() => 'ShopListItemModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ShopListItemModelStruct &&
        imageUrl == other.imageUrl &&
        title == other.title &&
        description == other.description;
  }

  @override
  int get hashCode => const ListEquality().hash([imageUrl, title, description]);
}

ShopListItemModelStruct createShopListItemModelStruct({
  String? imageUrl,
  String? title,
  String? description,
}) =>
    ShopListItemModelStruct(
      imageUrl: imageUrl,
      title: title,
      description: description,
    );
