// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CouponModelStruct extends BaseStruct {
  CouponModelStruct({
    int? id,
    String? couponCode,
    String? discountRate,
    double? discountamount,
  })  : _id = id,
        _couponCode = couponCode,
        _discountRate = discountRate,
        _discountamount = discountamount;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;
  void incrementId(int amount) => _id = id + amount;
  bool hasId() => _id != null;

  // "coupon_code" field.
  String? _couponCode;
  String get couponCode => _couponCode ?? '';
  set couponCode(String? val) => _couponCode = val;
  bool hasCouponCode() => _couponCode != null;

  // "discount_rate" field.
  String? _discountRate;
  String get discountRate => _discountRate ?? '';
  set discountRate(String? val) => _discountRate = val;
  bool hasDiscountRate() => _discountRate != null;

  // "discountamount" field.
  double? _discountamount;
  double get discountamount => _discountamount ?? 0.0;
  set discountamount(double? val) => _discountamount = val;
  void incrementDiscountamount(double amount) =>
      _discountamount = discountamount + amount;
  bool hasDiscountamount() => _discountamount != null;

  static CouponModelStruct fromMap(Map<String, dynamic> data) =>
      CouponModelStruct(
        id: castToType<int>(data['id']),
        couponCode: data['coupon_code'] as String?,
        discountRate: data['discount_rate'] as String?,
        discountamount: castToType<double>(data['discountamount']),
      );

  static CouponModelStruct? maybeFromMap(dynamic data) => data is Map
      ? CouponModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'coupon_code': _couponCode,
        'discount_rate': _discountRate,
        'discountamount': _discountamount,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'coupon_code': serializeParam(
          _couponCode,
          ParamType.String,
        ),
        'discount_rate': serializeParam(
          _discountRate,
          ParamType.String,
        ),
        'discountamount': serializeParam(
          _discountamount,
          ParamType.double,
        ),
      }.withoutNulls;

  static CouponModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      CouponModelStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        couponCode: deserializeParam(
          data['coupon_code'],
          ParamType.String,
          false,
        ),
        discountRate: deserializeParam(
          data['discount_rate'],
          ParamType.String,
          false,
        ),
        discountamount: deserializeParam(
          data['discountamount'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'CouponModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CouponModelStruct &&
        id == other.id &&
        couponCode == other.couponCode &&
        discountRate == other.discountRate &&
        discountamount == other.discountamount;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([id, couponCode, discountRate, discountamount]);
}

CouponModelStruct createCouponModelStruct({
  int? id,
  String? couponCode,
  String? discountRate,
  double? discountamount,
}) =>
    CouponModelStruct(
      id: id,
      couponCode: couponCode,
      discountRate: discountRate,
      discountamount: discountamount,
    );
