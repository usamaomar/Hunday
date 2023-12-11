// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DeliveryPriceModelStruct extends BaseStruct {
  DeliveryPriceModelStruct({
    int? id,
    String? nameEn,
    String? nameAr,
    double? price,
    String? name,
  })  : _id = id,
        _nameEn = nameEn,
        _nameAr = nameAr,
        _price = price,
        _name = name;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;
  void incrementId(int amount) => _id = id + amount;
  bool hasId() => _id != null;

  // "name_en" field.
  String? _nameEn;
  String get nameEn => _nameEn ?? '';
  set nameEn(String? val) => _nameEn = val;
  bool hasNameEn() => _nameEn != null;

  // "name_ar" field.
  String? _nameAr;
  String get nameAr => _nameAr ?? '';
  set nameAr(String? val) => _nameAr = val;
  bool hasNameAr() => _nameAr != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  set price(double? val) => _price = val;
  void incrementPrice(double amount) => _price = price + amount;
  bool hasPrice() => _price != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  static DeliveryPriceModelStruct fromMap(Map<String, dynamic> data) =>
      DeliveryPriceModelStruct(
        id: castToType<int>(data['id']),
        nameEn: data['name_en'] as String?,
        nameAr: data['name_ar'] as String?,
        price: castToType<double>(data['price']),
        name: data['name'] as String?,
      );

  static DeliveryPriceModelStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic>
          ? DeliveryPriceModelStruct.fromMap(data)
          : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name_en': _nameEn,
        'name_ar': _nameAr,
        'price': _price,
        'name': _name,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'name_en': serializeParam(
          _nameEn,
          ParamType.String,
        ),
        'name_ar': serializeParam(
          _nameAr,
          ParamType.String,
        ),
        'price': serializeParam(
          _price,
          ParamType.double,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
      }.withoutNulls;

  static DeliveryPriceModelStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      DeliveryPriceModelStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        nameEn: deserializeParam(
          data['name_en'],
          ParamType.String,
          false,
        ),
        nameAr: deserializeParam(
          data['name_ar'],
          ParamType.String,
          false,
        ),
        price: deserializeParam(
          data['price'],
          ParamType.double,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'DeliveryPriceModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DeliveryPriceModelStruct &&
        id == other.id &&
        nameEn == other.nameEn &&
        nameAr == other.nameAr &&
        price == other.price &&
        name == other.name;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([id, nameEn, nameAr, price, name]);
}

DeliveryPriceModelStruct createDeliveryPriceModelStruct({
  int? id,
  String? nameEn,
  String? nameAr,
  double? price,
  String? name,
}) =>
    DeliveryPriceModelStruct(
      id: id,
      nameEn: nameEn,
      nameAr: nameAr,
      price: price,
      name: name,
    );
