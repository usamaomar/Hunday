// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CartItemModelStruct extends BaseStruct {
  CartItemModelStruct({
    double? totalPrice,
    List<CartModelStruct>? cartItems,
    double? subTotal,
    String? tax,
    double? shippingCost,
  })  : _totalPrice = totalPrice,
        _cartItems = cartItems,
        _subTotal = subTotal,
        _tax = tax,
        _shippingCost = shippingCost;

  // "totalPrice" field.
  double? _totalPrice;
  double get totalPrice => _totalPrice ?? 0.0;
  set totalPrice(double? val) => _totalPrice = val;
  void incrementTotalPrice(double amount) => _totalPrice = totalPrice + amount;
  bool hasTotalPrice() => _totalPrice != null;

  // "cartItems" field.
  List<CartModelStruct>? _cartItems;
  List<CartModelStruct> get cartItems => _cartItems ?? const [];
  set cartItems(List<CartModelStruct>? val) => _cartItems = val;
  void updateCartItems(Function(List<CartModelStruct>) updateFn) =>
      updateFn(_cartItems ??= []);
  bool hasCartItems() => _cartItems != null;

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

  static CartItemModelStruct fromMap(Map<String, dynamic> data) =>
      CartItemModelStruct(
        totalPrice: castToType<double>(data['totalPrice']),
        cartItems: getStructList(
          data['cartItems'],
          CartModelStruct.fromMap,
        ),
        subTotal: castToType<double>(data['subTotal']),
        tax: data['tax'] as String?,
        shippingCost: castToType<double>(data['shippingCost']),
      );

  static CartItemModelStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? CartItemModelStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'totalPrice': _totalPrice,
        'cartItems': _cartItems?.map((e) => e.toMap()).toList(),
        'subTotal': _subTotal,
        'tax': _tax,
        'shippingCost': _shippingCost,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'totalPrice': serializeParam(
          _totalPrice,
          ParamType.double,
        ),
        'cartItems': serializeParam(
          _cartItems,
          ParamType.DataStruct,
          true,
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
      }.withoutNulls;

  static CartItemModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      CartItemModelStruct(
        totalPrice: deserializeParam(
          data['totalPrice'],
          ParamType.double,
          false,
        ),
        cartItems: deserializeStructParam<CartModelStruct>(
          data['cartItems'],
          ParamType.DataStruct,
          true,
          structBuilder: CartModelStruct.fromSerializableMap,
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
      );

  @override
  String toString() => 'CartItemModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is CartItemModelStruct &&
        totalPrice == other.totalPrice &&
        listEquality.equals(cartItems, other.cartItems) &&
        subTotal == other.subTotal &&
        tax == other.tax &&
        shippingCost == other.shippingCost;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([totalPrice, cartItems, subTotal, tax, shippingCost]);
}

CartItemModelStruct createCartItemModelStruct({
  double? totalPrice,
  double? subTotal,
  String? tax,
  double? shippingCost,
}) =>
    CartItemModelStruct(
      totalPrice: totalPrice,
      subTotal: subTotal,
      tax: tax,
      shippingCost: shippingCost,
    );
