// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CartModelStruct extends BaseStruct {
  CartModelStruct({
    int? id,
    int? userId,
    int? partId,
    int? quantity,
    PartModelStruct? part,
  })  : _id = id,
        _userId = userId,
        _partId = partId,
        _quantity = quantity,
        _part = part;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;
  void incrementId(int amount) => _id = id + amount;
  bool hasId() => _id != null;

  // "user_id" field.
  int? _userId;
  int get userId => _userId ?? 0;
  set userId(int? val) => _userId = val;
  void incrementUserId(int amount) => _userId = userId + amount;
  bool hasUserId() => _userId != null;

  // "part_id" field.
  int? _partId;
  int get partId => _partId ?? 0;
  set partId(int? val) => _partId = val;
  void incrementPartId(int amount) => _partId = partId + amount;
  bool hasPartId() => _partId != null;

  // "quantity" field.
  int? _quantity;
  int get quantity => _quantity ?? 0;
  set quantity(int? val) => _quantity = val;
  void incrementQuantity(int amount) => _quantity = quantity + amount;
  bool hasQuantity() => _quantity != null;

  // "part" field.
  PartModelStruct? _part;
  PartModelStruct get part => _part ?? PartModelStruct();
  set part(PartModelStruct? val) => _part = val;
  void updatePart(Function(PartModelStruct) updateFn) =>
      updateFn(_part ??= PartModelStruct());
  bool hasPart() => _part != null;

  static CartModelStruct fromMap(Map<String, dynamic> data) => CartModelStruct(
        id: castToType<int>(data['id']),
        userId: castToType<int>(data['user_id']),
        partId: castToType<int>(data['part_id']),
        quantity: castToType<int>(data['quantity']),
        part: PartModelStruct.maybeFromMap(data['part']),
      );

  static CartModelStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? CartModelStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'user_id': _userId,
        'part_id': _partId,
        'quantity': _quantity,
        'part': _part?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'user_id': serializeParam(
          _userId,
          ParamType.int,
        ),
        'part_id': serializeParam(
          _partId,
          ParamType.int,
        ),
        'quantity': serializeParam(
          _quantity,
          ParamType.int,
        ),
        'part': serializeParam(
          _part,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static CartModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      CartModelStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        userId: deserializeParam(
          data['user_id'],
          ParamType.int,
          false,
        ),
        partId: deserializeParam(
          data['part_id'],
          ParamType.int,
          false,
        ),
        quantity: deserializeParam(
          data['quantity'],
          ParamType.int,
          false,
        ),
        part: deserializeStructParam(
          data['part'],
          ParamType.DataStruct,
          false,
          structBuilder: PartModelStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'CartModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CartModelStruct &&
        id == other.id &&
        userId == other.userId &&
        partId == other.partId &&
        quantity == other.quantity &&
        part == other.part;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([id, userId, partId, quantity, part]);
}

CartModelStruct createCartModelStruct({
  int? id,
  int? userId,
  int? partId,
  int? quantity,
  PartModelStruct? part,
}) =>
    CartModelStruct(
      id: id,
      userId: userId,
      partId: partId,
      quantity: quantity,
      part: part ?? PartModelStruct(),
    );
