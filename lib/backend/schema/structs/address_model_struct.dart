// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AddressModelStruct extends FFFirebaseStruct {
  AddressModelStruct({
    int? id,
    String? name,
    String? email,
    String? phone,
    int? cityId,
    String? streetAddress,
    int? buildingNumber,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _name = name,
        _email = email,
        _phone = phone,
        _cityId = cityId,
        _streetAddress = streetAddress,
        _buildingNumber = buildingNumber,
        super(firestoreUtilData);

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;
  void incrementId(int amount) => _id = id + amount;
  bool hasId() => _id != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;
  bool hasEmail() => _email != null;

  // "phone" field.
  String? _phone;
  String get phone => _phone ?? '';
  set phone(String? val) => _phone = val;
  bool hasPhone() => _phone != null;

  // "city_id" field.
  int? _cityId;
  int get cityId => _cityId ?? 0;
  set cityId(int? val) => _cityId = val;
  void incrementCityId(int amount) => _cityId = cityId + amount;
  bool hasCityId() => _cityId != null;

  // "street_address" field.
  String? _streetAddress;
  String get streetAddress => _streetAddress ?? '';
  set streetAddress(String? val) => _streetAddress = val;
  bool hasStreetAddress() => _streetAddress != null;

  // "building_number" field.
  int? _buildingNumber;
  int get buildingNumber => _buildingNumber ?? 0;
  set buildingNumber(int? val) => _buildingNumber = val;
  void incrementBuildingNumber(int amount) =>
      _buildingNumber = buildingNumber + amount;
  bool hasBuildingNumber() => _buildingNumber != null;

  static AddressModelStruct fromMap(Map<String, dynamic> data) =>
      AddressModelStruct(
        id: castToType<int>(data['id']),
        name: data['name'] as String?,
        email: data['email'] as String?,
        phone: data['phone'] as String?,
        cityId: castToType<int>(data['city_id']),
        streetAddress: data['street_address'] as String?,
        buildingNumber: castToType<int>(data['building_number']),
      );

  static AddressModelStruct? maybeFromMap(dynamic data) => data is Map
      ? AddressModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
        'email': _email,
        'phone': _phone,
        'city_id': _cityId,
        'street_address': _streetAddress,
        'building_number': _buildingNumber,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
        'phone': serializeParam(
          _phone,
          ParamType.String,
        ),
        'city_id': serializeParam(
          _cityId,
          ParamType.int,
        ),
        'street_address': serializeParam(
          _streetAddress,
          ParamType.String,
        ),
        'building_number': serializeParam(
          _buildingNumber,
          ParamType.int,
        ),
      }.withoutNulls;

  static AddressModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      AddressModelStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
        phone: deserializeParam(
          data['phone'],
          ParamType.String,
          false,
        ),
        cityId: deserializeParam(
          data['city_id'],
          ParamType.int,
          false,
        ),
        streetAddress: deserializeParam(
          data['street_address'],
          ParamType.String,
          false,
        ),
        buildingNumber: deserializeParam(
          data['building_number'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'AddressModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AddressModelStruct &&
        id == other.id &&
        name == other.name &&
        email == other.email &&
        phone == other.phone &&
        cityId == other.cityId &&
        streetAddress == other.streetAddress &&
        buildingNumber == other.buildingNumber;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([id, name, email, phone, cityId, streetAddress, buildingNumber]);
}

AddressModelStruct createAddressModelStruct({
  int? id,
  String? name,
  String? email,
  String? phone,
  int? cityId,
  String? streetAddress,
  int? buildingNumber,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AddressModelStruct(
      id: id,
      name: name,
      email: email,
      phone: phone,
      cityId: cityId,
      streetAddress: streetAddress,
      buildingNumber: buildingNumber,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AddressModelStruct? updateAddressModelStruct(
  AddressModelStruct? addressModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    addressModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAddressModelStructData(
  Map<String, dynamic> firestoreData,
  AddressModelStruct? addressModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (addressModel == null) {
    return;
  }
  if (addressModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && addressModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final addressModelData =
      getAddressModelFirestoreData(addressModel, forFieldValue);
  final nestedData =
      addressModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = addressModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAddressModelFirestoreData(
  AddressModelStruct? addressModel, [
  bool forFieldValue = false,
]) {
  if (addressModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(addressModel.toMap());

  // Add any Firestore field values
  addressModel.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAddressModelListFirestoreData(
  List<AddressModelStruct>? addressModels,
) =>
    addressModels?.map((e) => getAddressModelFirestoreData(e, true)).toList() ??
    [];
