// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PaymentResultStruct extends FFFirebaseStruct {
  PaymentResultStruct({
    String? code,
    String? description,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _code = code,
        _description = description,
        super(firestoreUtilData);

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

  static PaymentResultStruct? maybeFromMap(dynamic data) => data is Map
      ? PaymentResultStruct.fromMap(data.cast<String, dynamic>())
      : null;

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
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PaymentResultStruct(
      code: code,
      description: description,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PaymentResultStruct? updatePaymentResultStruct(
  PaymentResultStruct? paymentResult, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    paymentResult
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPaymentResultStructData(
  Map<String, dynamic> firestoreData,
  PaymentResultStruct? paymentResult,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (paymentResult == null) {
    return;
  }
  if (paymentResult.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && paymentResult.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final paymentResultData =
      getPaymentResultFirestoreData(paymentResult, forFieldValue);
  final nestedData =
      paymentResultData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = paymentResult.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPaymentResultFirestoreData(
  PaymentResultStruct? paymentResult, [
  bool forFieldValue = false,
]) {
  if (paymentResult == null) {
    return {};
  }
  final firestoreData = mapToFirestore(paymentResult.toMap());

  // Add any Firestore field values
  paymentResult.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPaymentResultListFirestoreData(
  List<PaymentResultStruct>? paymentResults,
) =>
    paymentResults
        ?.map((e) => getPaymentResultFirestoreData(e, true))
        .toList() ??
    [];
