// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CartItemModelStruct extends BaseStruct {
  CartItemModelStruct({
    double? totalPrice,
    List<CartModelStruct>? cartItem,
  })  : _totalPrice = totalPrice,
        _cartItem = cartItem;

  // "totalPrice" field.
  double? _totalPrice;
  double get totalPrice => _totalPrice ?? 0.0;
  set totalPrice(double? val) => _totalPrice = val;
  void incrementTotalPrice(double amount) => _totalPrice = totalPrice + amount;
  bool hasTotalPrice() => _totalPrice != null;

  // "cartItem" field.
  List<CartModelStruct>? _cartItem;
  List<CartModelStruct> get cartItem => _cartItem ?? const [];
  set cartItem(List<CartModelStruct>? val) => _cartItem = val;
  void updateCartItem(Function(List<CartModelStruct>) updateFn) =>
      updateFn(_cartItem ??= []);
  bool hasCartItem() => _cartItem != null;

  static CartItemModelStruct fromMap(Map<String, dynamic> data) =>
      CartItemModelStruct(
        totalPrice: castToType<double>(data['totalPrice']),
        cartItem: getStructList(
          data['cartItem'],
          CartModelStruct.fromMap,
        ),
      );

  static CartItemModelStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? CartItemModelStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'totalPrice': _totalPrice,
        'cartItem': _cartItem?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'totalPrice': serializeParam(
          _totalPrice,
          ParamType.double,
        ),
        'cartItem': serializeParam(
          _cartItem,
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
        cartItem: deserializeStructParam<CartModelStruct>(
          data['cartItem'],
          ParamType.DataStruct,
          true,
          structBuilder: CartModelStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'CartItemModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is CartItemModelStruct &&
        totalPrice == other.totalPrice &&
        listEquality.equals(cartItem, other.cartItem);
  }

  @override
  int get hashCode => const ListEquality().hash([totalPrice, cartItem]);
}

CartItemModelStruct createCartItemModelStruct({
  double? totalPrice,
}) =>
    CartItemModelStruct(
      totalPrice: totalPrice,
    );
