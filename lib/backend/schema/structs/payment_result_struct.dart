// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PaymentResultStruct extends BaseStruct {
  PaymentResultStruct({
    String? code,
    String? description,
  })  : _code = code,
        _description = description;

  // "code" field.
  String? _code;
  String get code => _code ?? '';
  set code(String? val) => _code = val;
  bool hasCode() => _code != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;
  bool hasDescription() => _description != null;

  static PaymentResultStruct fromMap(Map<String, dynamic> data) =>
      PaymentResultStruct(
        code: data['code'] as String?,
        description: data['description'] as String?,
      );

  static PaymentResultStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? PaymentResultStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'code': _code,
        'description': _description,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'code': serializeParam(
          _code,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
      }.withoutNulls;

  static PaymentResultStruct fromSerializableMap(Map<String, dynamic> data) =>
      PaymentResultStruct(
        code: deserializeParam(
          data['code'],
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
  String toString() => 'PaymentResultStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PaymentResultStruct &&
        code == other.code &&
        description == other.description;
  }

  @override
  int get hashCode => const ListEquality().hash([code, description]);
}

PaymentResultStruct createPaymentResultStruct({
  String? code,
  String? description,
}) =>
    PaymentResultStruct(
      code: code,
      description: description,
    );
