// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CarInfoModelStruct extends BaseStruct {
  CarInfoModelStruct({
    String? ownerName,
    String? address,
    String? color,
    String? yearOfManufacturing,
    String? registeredUntil,
    String? plateNumber,
    String? registrationNumber,
    String? vinNumber,
    String? engineCapacity,
    String? engineNumber,
    String? insuranceCompany,
    int? carModelId,
    int? carCategoryId,
    int? fuelTypeId,
    String? m1,
    String? m2,
  })  : _ownerName = ownerName,
        _address = address,
        _color = color,
        _yearOfManufacturing = yearOfManufacturing,
        _registeredUntil = registeredUntil,
        _plateNumber = plateNumber,
        _registrationNumber = registrationNumber,
        _vinNumber = vinNumber,
        _engineCapacity = engineCapacity,
        _engineNumber = engineNumber,
        _insuranceCompany = insuranceCompany,
        _carModelId = carModelId,
        _carCategoryId = carCategoryId,
        _fuelTypeId = fuelTypeId,
        _m1 = m1,
        _m2 = m2;

  // "owner_name" field.
  String? _ownerName;
  String get ownerName => _ownerName ?? '';
  set ownerName(String? val) => _ownerName = val;
  bool hasOwnerName() => _ownerName != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  set address(String? val) => _address = val;
  bool hasAddress() => _address != null;

  // "color" field.
  String? _color;
  String get color => _color ?? '';
  set color(String? val) => _color = val;
  bool hasColor() => _color != null;

  // "year_of_manufacturing" field.
  String? _yearOfManufacturing;
  String get yearOfManufacturing => _yearOfManufacturing ?? '';
  set yearOfManufacturing(String? val) => _yearOfManufacturing = val;
  bool hasYearOfManufacturing() => _yearOfManufacturing != null;

  // "registered_until" field.
  String? _registeredUntil;
  String get registeredUntil => _registeredUntil ?? '';
  set registeredUntil(String? val) => _registeredUntil = val;
  bool hasRegisteredUntil() => _registeredUntil != null;

  // "plate_number" field.
  String? _plateNumber;
  String get plateNumber => _plateNumber ?? '';
  set plateNumber(String? val) => _plateNumber = val;
  bool hasPlateNumber() => _plateNumber != null;

  // "registration_number" field.
  String? _registrationNumber;
  String get registrationNumber => _registrationNumber ?? '';
  set registrationNumber(String? val) => _registrationNumber = val;
  bool hasRegistrationNumber() => _registrationNumber != null;

  // "vin_number" field.
  String? _vinNumber;
  String get vinNumber => _vinNumber ?? '';
  set vinNumber(String? val) => _vinNumber = val;
  bool hasVinNumber() => _vinNumber != null;

  // "engine_capacity" field.
  String? _engineCapacity;
  String get engineCapacity => _engineCapacity ?? '';
  set engineCapacity(String? val) => _engineCapacity = val;
  bool hasEngineCapacity() => _engineCapacity != null;

  // "engine_number" field.
  String? _engineNumber;
  String get engineNumber => _engineNumber ?? '';
  set engineNumber(String? val) => _engineNumber = val;
  bool hasEngineNumber() => _engineNumber != null;

  // "insurance_company" field.
  String? _insuranceCompany;
  String get insuranceCompany => _insuranceCompany ?? '';
  set insuranceCompany(String? val) => _insuranceCompany = val;
  bool hasInsuranceCompany() => _insuranceCompany != null;

  // "car_model_id" field.
  int? _carModelId;
  int get carModelId => _carModelId ?? 0;
  set carModelId(int? val) => _carModelId = val;
  void incrementCarModelId(int amount) => _carModelId = carModelId + amount;
  bool hasCarModelId() => _carModelId != null;

  // "car_category_id" field.
  int? _carCategoryId;
  int get carCategoryId => _carCategoryId ?? 0;
  set carCategoryId(int? val) => _carCategoryId = val;
  void incrementCarCategoryId(int amount) =>
      _carCategoryId = carCategoryId + amount;
  bool hasCarCategoryId() => _carCategoryId != null;

  // "fuel_type_id" field.
  int? _fuelTypeId;
  int get fuelTypeId => _fuelTypeId ?? 0;
  set fuelTypeId(int? val) => _fuelTypeId = val;
  void incrementFuelTypeId(int amount) => _fuelTypeId = fuelTypeId + amount;
  bool hasFuelTypeId() => _fuelTypeId != null;

  // "m1" field.
  String? _m1;
  String get m1 => _m1 ?? '';
  set m1(String? val) => _m1 = val;
  bool hasM1() => _m1 != null;

  // "m2" field.
  String? _m2;
  String get m2 => _m2 ?? '';
  set m2(String? val) => _m2 = val;
  bool hasM2() => _m2 != null;

  static CarInfoModelStruct fromMap(Map<String, dynamic> data) =>
      CarInfoModelStruct(
        ownerName: data['owner_name'] as String?,
        address: data['address'] as String?,
        color: data['color'] as String?,
        yearOfManufacturing: data['year_of_manufacturing'] as String?,
        registeredUntil: data['registered_until'] as String?,
        plateNumber: data['plate_number'] as String?,
        registrationNumber: data['registration_number'] as String?,
        vinNumber: data['vin_number'] as String?,
        engineCapacity: data['engine_capacity'] as String?,
        engineNumber: data['engine_number'] as String?,
        insuranceCompany: data['insurance_company'] as String?,
        carModelId: castToType<int>(data['car_model_id']),
        carCategoryId: castToType<int>(data['car_category_id']),
        fuelTypeId: castToType<int>(data['fuel_type_id']),
        m1: data['m1'] as String?,
        m2: data['m2'] as String?,
      );

  static CarInfoModelStruct? maybeFromMap(dynamic data) => data is Map
      ? CarInfoModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'owner_name': _ownerName,
        'address': _address,
        'color': _color,
        'year_of_manufacturing': _yearOfManufacturing,
        'registered_until': _registeredUntil,
        'plate_number': _plateNumber,
        'registration_number': _registrationNumber,
        'vin_number': _vinNumber,
        'engine_capacity': _engineCapacity,
        'engine_number': _engineNumber,
        'insurance_company': _insuranceCompany,
        'car_model_id': _carModelId,
        'car_category_id': _carCategoryId,
        'fuel_type_id': _fuelTypeId,
        'm1': _m1,
        'm2': _m2,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'owner_name': serializeParam(
          _ownerName,
          ParamType.String,
        ),
        'address': serializeParam(
          _address,
          ParamType.String,
        ),
        'color': serializeParam(
          _color,
          ParamType.String,
        ),
        'year_of_manufacturing': serializeParam(
          _yearOfManufacturing,
          ParamType.String,
        ),
        'registered_until': serializeParam(
          _registeredUntil,
          ParamType.String,
        ),
        'plate_number': serializeParam(
          _plateNumber,
          ParamType.String,
        ),
        'registration_number': serializeParam(
          _registrationNumber,
          ParamType.String,
        ),
        'vin_number': serializeParam(
          _vinNumber,
          ParamType.String,
        ),
        'engine_capacity': serializeParam(
          _engineCapacity,
          ParamType.String,
        ),
        'engine_number': serializeParam(
          _engineNumber,
          ParamType.String,
        ),
        'insurance_company': serializeParam(
          _insuranceCompany,
          ParamType.String,
        ),
        'car_model_id': serializeParam(
          _carModelId,
          ParamType.int,
        ),
        'car_category_id': serializeParam(
          _carCategoryId,
          ParamType.int,
        ),
        'fuel_type_id': serializeParam(
          _fuelTypeId,
          ParamType.int,
        ),
        'm1': serializeParam(
          _m1,
          ParamType.String,
        ),
        'm2': serializeParam(
          _m2,
          ParamType.String,
        ),
      }.withoutNulls;

  static CarInfoModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      CarInfoModelStruct(
        ownerName: deserializeParam(
          data['owner_name'],
          ParamType.String,
          false,
        ),
        address: deserializeParam(
          data['address'],
          ParamType.String,
          false,
        ),
        color: deserializeParam(
          data['color'],
          ParamType.String,
          false,
        ),
        yearOfManufacturing: deserializeParam(
          data['year_of_manufacturing'],
          ParamType.String,
          false,
        ),
        registeredUntil: deserializeParam(
          data['registered_until'],
          ParamType.String,
          false,
        ),
        plateNumber: deserializeParam(
          data['plate_number'],
          ParamType.String,
          false,
        ),
        registrationNumber: deserializeParam(
          data['registration_number'],
          ParamType.String,
          false,
        ),
        vinNumber: deserializeParam(
          data['vin_number'],
          ParamType.String,
          false,
        ),
        engineCapacity: deserializeParam(
          data['engine_capacity'],
          ParamType.String,
          false,
        ),
        engineNumber: deserializeParam(
          data['engine_number'],
          ParamType.String,
          false,
        ),
        insuranceCompany: deserializeParam(
          data['insurance_company'],
          ParamType.String,
          false,
        ),
        carModelId: deserializeParam(
          data['car_model_id'],
          ParamType.int,
          false,
        ),
        carCategoryId: deserializeParam(
          data['car_category_id'],
          ParamType.int,
          false,
        ),
        fuelTypeId: deserializeParam(
          data['fuel_type_id'],
          ParamType.int,
          false,
        ),
        m1: deserializeParam(
          data['m1'],
          ParamType.String,
          false,
        ),
        m2: deserializeParam(
          data['m2'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CarInfoModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CarInfoModelStruct &&
        ownerName == other.ownerName &&
        address == other.address &&
        color == other.color &&
        yearOfManufacturing == other.yearOfManufacturing &&
        registeredUntil == other.registeredUntil &&
        plateNumber == other.plateNumber &&
        registrationNumber == other.registrationNumber &&
        vinNumber == other.vinNumber &&
        engineCapacity == other.engineCapacity &&
        engineNumber == other.engineNumber &&
        insuranceCompany == other.insuranceCompany &&
        carModelId == other.carModelId &&
        carCategoryId == other.carCategoryId &&
        fuelTypeId == other.fuelTypeId &&
        m1 == other.m1 &&
        m2 == other.m2;
  }

  @override
  int get hashCode => const ListEquality().hash([
        ownerName,
        address,
        color,
        yearOfManufacturing,
        registeredUntil,
        plateNumber,
        registrationNumber,
        vinNumber,
        engineCapacity,
        engineNumber,
        insuranceCompany,
        carModelId,
        carCategoryId,
        fuelTypeId,
        m1,
        m2
      ]);
}

CarInfoModelStruct createCarInfoModelStruct({
  String? ownerName,
  String? address,
  String? color,
  String? yearOfManufacturing,
  String? registeredUntil,
  String? plateNumber,
  String? registrationNumber,
  String? vinNumber,
  String? engineCapacity,
  String? engineNumber,
  String? insuranceCompany,
  int? carModelId,
  int? carCategoryId,
  int? fuelTypeId,
  String? m1,
  String? m2,
}) =>
    CarInfoModelStruct(
      ownerName: ownerName,
      address: address,
      color: color,
      yearOfManufacturing: yearOfManufacturing,
      registeredUntil: registeredUntil,
      plateNumber: plateNumber,
      registrationNumber: registrationNumber,
      vinNumber: vinNumber,
      engineCapacity: engineCapacity,
      engineNumber: engineNumber,
      insuranceCompany: insuranceCompany,
      carModelId: carModelId,
      carCategoryId: carCategoryId,
      fuelTypeId: fuelTypeId,
      m1: m1,
      m2: m2,
    );
