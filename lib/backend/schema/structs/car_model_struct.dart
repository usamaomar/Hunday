// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CarModelStruct extends BaseStruct {
  CarModelStruct({
    String? fullName,
    String? fullImage,
  })  : _fullName = fullName,
        _fullImage = fullImage;

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

  static CarModelStruct fromMap(Map<String, dynamic> data) => CarModelStruct(
        fullName: data['fullName'] as String?,
        fullImage: data['fullImage'] as String?,
      );

  static CarModelStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? CarModelStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'fullName': _fullName,
        'fullImage': _fullImage,
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
      );

  @override
  String toString() => 'CarModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CarModelStruct &&
        fullName == other.fullName &&
        fullImage == other.fullImage;
  }

  @override
  int get hashCode => const ListEquality().hash([fullName, fullImage]);
}

CarModelStruct createCarModelStruct({
  String? fullName,
  String? fullImage,
}) =>
    CarModelStruct(
      fullName: fullName,
      fullImage: fullImage,
    );
