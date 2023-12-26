// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PaymentModelStruct extends BaseStruct {
  PaymentModelStruct({
    String? buildNumber,
    String? timestamp,
    String? ndc,
    String? id,
    PaymentResultStruct? result,
    String? merchantTransactionId,
  })  : _buildNumber = buildNumber,
        _timestamp = timestamp,
        _ndc = ndc,
        _id = id,
        _result = result,
        _merchantTransactionId = merchantTransactionId;

  // "buildNumber" field.
  String? _buildNumber;
  String get buildNumber => _buildNumber ?? '';
  set buildNumber(String? val) => _buildNumber = val;
  bool hasBuildNumber() => _buildNumber != null;

  // "timestamp" field.
  String? _timestamp;
  String get timestamp => _timestamp ?? '';
  set timestamp(String? val) => _timestamp = val;
  bool hasTimestamp() => _timestamp != null;

  // "ndc" field.
  String? _ndc;
  String get ndc => _ndc ?? '';
  set ndc(String? val) => _ndc = val;
  bool hasNdc() => _ndc != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;
  bool hasId() => _id != null;

  // "result" field.
  PaymentResultStruct? _result;
  PaymentResultStruct get result => _result ?? PaymentResultStruct();
  set result(PaymentResultStruct? val) => _result = val;
  void updateResult(Function(PaymentResultStruct) updateFn) =>
      updateFn(_result ??= PaymentResultStruct());
  bool hasResult() => _result != null;

  // "merchantTransactionId" field.
  String? _merchantTransactionId;
  String get merchantTransactionId => _merchantTransactionId ?? '';
  set merchantTransactionId(String? val) => _merchantTransactionId = val;
  bool hasMerchantTransactionId() => _merchantTransactionId != null;

  static PaymentModelStruct fromMap(Map<String, dynamic> data) =>
      PaymentModelStruct(
        buildNumber: data['buildNumber'] as String?,
        timestamp: data['timestamp'] as String?,
        ndc: data['ndc'] as String?,
        id: data['id'] as String?,
        result: PaymentResultStruct.maybeFromMap(data['result']),
        merchantTransactionId: data['merchantTransactionId'] as String?,
      );

  static PaymentModelStruct? maybeFromMap(dynamic data) => data is Map
      ? PaymentModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'buildNumber': _buildNumber,
        'timestamp': _timestamp,
        'ndc': _ndc,
        'id': _id,
        'result': _result?.toMap(),
        'merchantTransactionId': _merchantTransactionId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'buildNumber': serializeParam(
          _buildNumber,
          ParamType.String,
        ),
        'timestamp': serializeParam(
          _timestamp,
          ParamType.String,
        ),
        'ndc': serializeParam(
          _ndc,
          ParamType.String,
        ),
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'result': serializeParam(
          _result,
          ParamType.DataStruct,
        ),
        'merchantTransactionId': serializeParam(
          _merchantTransactionId,
          ParamType.String,
        ),
      }.withoutNulls;

  static PaymentModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      PaymentModelStruct(
        buildNumber: deserializeParam(
          data['buildNumber'],
          ParamType.String,
          false,
        ),
        timestamp: deserializeParam(
          data['timestamp'],
          ParamType.String,
          false,
        ),
        ndc: deserializeParam(
          data['ndc'],
          ParamType.String,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        result: deserializeStructParam(
          data['result'],
          ParamType.DataStruct,
          false,
          structBuilder: PaymentResultStruct.fromSerializableMap,
        ),
        merchantTransactionId: deserializeParam(
          data['merchantTransactionId'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'PaymentModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PaymentModelStruct &&
        buildNumber == other.buildNumber &&
        timestamp == other.timestamp &&
        ndc == other.ndc &&
        id == other.id &&
        result == other.result &&
        merchantTransactionId == other.merchantTransactionId;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([buildNumber, timestamp, ndc, id, result, merchantTransactionId]);
}

PaymentModelStruct createPaymentModelStruct({
  String? buildNumber,
  String? timestamp,
  String? ndc,
  String? id,
  PaymentResultStruct? result,
  String? merchantTransactionId,
}) =>
    PaymentModelStruct(
      buildNumber: buildNumber,
      timestamp: timestamp,
      ndc: ndc,
      id: id,
      result: result ?? PaymentResultStruct(),
      merchantTransactionId: merchantTransactionId,
    );
