// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CartItemModelStruct extends FFFirebaseStruct {
  CartItemModelStruct({
    double? totalPrice,
    double? subTotal,
    String? tax,
    double? shippingCost,
    String? discountRate,
    String? couponCode,
    String? discountAmount,
    List<PartModelStruct>? cartItems,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _totalPrice = totalPrice,
        _subTotal = subTotal,
        _tax = tax,
        _shippingCost = shippingCost,
        _discountRate = discountRate,
        _couponCode = couponCode,
        _discountAmount = discountAmount,
        _cartItems = cartItems,
        super(firestoreUtilData);

  // "totalPrice" field.
  double? _totalPrice;
  double get totalPrice => _totalPrice ?? 0.0;
  set totalPrice(double? val) => _totalPrice = val;
  void incrementTotalPrice(double amount) => _totalPrice = totalPrice + amount;
  bool hasTotalPrice() => _totalPrice != null;

  // "subTotal" field.
  double? _subTotal;
  double get subTotal => _subTotal ?? 0.0;
  set subTotal(double? val) => _subTotal = val;
  void incrementSubTotal(double amount) => _subTotal = subTotal + amount;
  bool hasSubTotal() => _subTotal != null;

  // "tax" field.
  String? _tax;
  String get tax => _tax ?? '';
  set tax(String? val) => _tax = val;
  bool hasTax() => _tax != null;

  // "shippingCost" field.
  double? _shippingCost;
  double get shippingCost => _shippingCost ?? 0.0;
  set shippingCost(double? val) => _shippingCost = val;
  void incrementShippingCost(double amount) =>
      _shippingCost = shippingCost + amount;
  bool hasShippingCost() => _shippingCost != null;

  // "discountRate" field.
  String? _discountRate;
  String get discountRate => _discountRate ?? '';
  set discountRate(String? val) => _discountRate = val;
  bool hasDiscountRate() => _discountRate != null;

  // "couponCode" field.
  String? _couponCode;
  String get couponCode => _couponCode ?? '';
  set couponCode(String? val) => _couponCode = val;
  bool hasCouponCode() => _couponCode != null;

  // "discountAmount" field.
  String? _discountAmount;
  String get discountAmount => _discountAmount ?? '';
  set discountAmount(String? val) => _discountAmount = val;
  bool hasDiscountAmount() => _discountAmount != null;

  // "cartItems" field.
  List<PartModelStruct>? _cartItems;
  List<PartModelStruct> get cartItems => _cartItems ?? const [];
  set cartItems(List<PartModelStruct>? val) => _cartItems = val;
  void updateCartItems(Function(List<PartModelStruct>) updateFn) =>
      updateFn(_cartItems ??= []);
  bool hasCartItems() => _cartItems != null;

  static CartItemModelStruct fromMap(Map<String, dynamic> data) =>
      CartItemModelStruct(
        totalPrice: castToType<double>(data['totalPrice']),
        subTotal: castToType<double>(data['subTotal']),
        tax: data['tax'] as String?,
        shippingCost: castToType<double>(data['shippingCost']),
        discountRate: data['discountRate'] as String?,
        couponCode: data['couponCode'] as String?,
        discountAmount: data['discountAmount'] as String?,
        cartItems: getStructList(
          data['cartItems'],
          PartModelStruct.fromMap,
        ),
      );

  static CartItemModelStruct? maybeFromMap(dynamic data) => data is Map
      ? CartItemModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'totalPrice': _totalPrice,
        'subTotal': _subTotal,
        'tax': _tax,
        'shippingCost': _shippingCost,
        'discountRate': _discountRate,
        'couponCode': _couponCode,
        'discountAmount': _discountAmount,
        'cartItems': _cartItems?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'totalPrice': serializeParam(
          _totalPrice,
          ParamType.double,
        ),
        'subTotal': serializeParam(
          _subTotal,
          ParamType.double,
        ),
        'tax': serializeParam(
          _tax,
          ParamType.String,
        ),
        'shippingCost': serializeParam(
          _shippingCost,
          ParamType.double,
        ),
        'discountRate': serializeParam(
          _discountRate,
          ParamType.String,
        ),
        'couponCode': serializeParam(
          _couponCode,
          ParamType.String,
        ),
        'discountAmount': serializeParam(
          _discountAmount,
          ParamType.String,
        ),
        'cartItems': serializeParam(
          _cartItems,
          ParamType.DataStruct,
          true,
        ),
      }.withoutNulls;

  static CartItemModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      CartItemModelStruct(
        totalPrice: deserializeParam(
          data['totalPrice'],
          ParamType.double,
          false,
        ),
        subTotal: deserializeParam(
          data['subTotal'],
          ParamType.double,
          false,
        ),
        tax: deserializeParam(
          data['tax'],
          ParamType.String,
          false,
        ),
        shippingCost: deserializeParam(
          data['shippingCost'],
          ParamType.double,
          false,
        ),
        discountRate: deserializeParam(
          data['discountRate'],
          ParamType.String,
          false,
        ),
        couponCode: deserializeParam(
          data['couponCode'],
          ParamType.String,
          false,
        ),
        discountAmount: deserializeParam(
          data['discountAmount'],
          ParamType.String,
          false,
        ),
        cartItems: deserializeStructParam<PartModelStruct>(
          data['cartItems'],
          ParamType.DataStruct,
          true,
          structBuilder: PartModelStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'CartItemModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is CartItemModelStruct &&
        totalPrice == other.totalPrice &&
        subTotal == other.subTotal &&
        tax == other.tax &&
        shippingCost == other.shippingCost &&
        discountRate == other.discountRate &&
        couponCode == other.couponCode &&
        discountAmount == other.discountAmount &&
        listEquality.equals(cartItems, other.cartItems);
  }

  @override
  int get hashCode => const ListEquality().hash([
        totalPrice,
        subTotal,
        tax,
        shippingCost,
        discountRate,
        couponCode,
        discountAmount,
        cartItems
      ]);
}

CartItemModelStruct createCartItemModelStruct({
  double? totalPrice,
  double? subTotal,
  String? tax,
  double? shippingCost,
  String? discountRate,
  String? couponCode,
  String? discountAmount,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CartItemModelStruct(
      totalPrice: totalPrice,
      subTotal: subTotal,
      tax: tax,
      shippingCost: shippingCost,
      discountRate: discountRate,
      couponCode: couponCode,
      discountAmount: discountAmount,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CartItemModelStruct? updateCartItemModelStruct(
  CartItemModelStruct? cartItemModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    cartItemModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCartItemModelStructData(
  Map<String, dynamic> firestoreData,
  CartItemModelStruct? cartItemModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (cartItemModel == null) {
    return;
  }
  if (cartItemModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && cartItemModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final cartItemModelData =
      getCartItemModelFirestoreData(cartItemModel, forFieldValue);
  final nestedData =
      cartItemModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = cartItemModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCartItemModelFirestoreData(
  CartItemModelStruct? cartItemModel, [
  bool forFieldValue = false,
]) {
  if (cartItemModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(cartItemModel.toMap());

  // Add any Firestore field values
  cartItemModel.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCartItemModelListFirestoreData(
  List<CartItemModelStruct>? cartItemModels,
) =>
    cartItemModels
        ?.map((e) => getCartItemModelFirestoreData(e, true))
        .toList() ??
    [];
