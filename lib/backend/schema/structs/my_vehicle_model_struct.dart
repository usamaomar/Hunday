// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MyVehicleModelStruct extends BaseStruct {
  MyVehicleModelStruct({
    int? id,
    int? userId,
    String? ownerName,
    String? address,
    int? carCategoryId,
    int? carModelId,
    String? color,
    String? yearOfManufacturing,
    String? registeredUntil,
    String? plateNumber,
    int? registrationNumber,
    String? vinNumber,
    String? engineCapacity,
    String? engineNumber,
    int? fuelTypeId,
    String? insuranceCompany,
    CarModelStruct? fuelType,
    CarModelStruct? carCategory,
    CarModelStruct? carModel,
  })  : _id = id,
        _userId = userId,
        _ownerName = ownerName,
        _address = address,
        _carCategoryId = carCategoryId,
        _carModelId = carModelId,
        _color = color,
        _yearOfManufacturing = yearOfManufacturing,
        _registeredUntil = registeredUntil,
        _plateNumber = plateNumber,
        _registrationNumber = registrationNumber,
        _vinNumber = vinNumber,
        _engineCapacity = engineCapacity,
        _engineNumber = engineNumber,
        _fuelTypeId = fuelTypeId,
        _insuranceCompany = insuranceCompany,
        _fuelType = fuelType,
        _carCategory = carCategory,
        _carModel = carModel;

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

  // "car_category_id" field.
  int? _carCategoryId;
  int get carCategoryId => _carCategoryId ?? 0;
  set carCategoryId(int? val) => _carCategoryId = val;
  void incrementCarCategoryId(int amount) =>
      _carCategoryId = carCategoryId + amount;
  bool hasCarCategoryId() => _carCategoryId != null;

  // "car_model_id" field.
  int? _carModelId;
  int get carModelId => _carModelId ?? 0;
  set carModelId(int? val) => _carModelId = val;
  void incrementCarModelId(int amount) => _carModelId = carModelId + amount;
  bool hasCarModelId() => _carModelId != null;

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
  int? _registrationNumber;
  int get registrationNumber => _registrationNumber ?? 0;
  set registrationNumber(int? val) => _registrationNumber = val;
  void incrementRegistrationNumber(int amount) =>
      _registrationNumber = registrationNumber + amount;
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

  // "fuel_type_id" field.
  int? _fuelTypeId;
  int get fuelTypeId => _fuelTypeId ?? 0;
  set fuelTypeId(int? val) => _fuelTypeId = val;
  void incrementFuelTypeId(int amount) => _fuelTypeId = fuelTypeId + amount;
  bool hasFuelTypeId() => _fuelTypeId != null;

  // "insurance_company" field.
  String? _insuranceCompany;
  String get insuranceCompany => _insuranceCompany ?? '';
  set insuranceCompany(String? val) => _insuranceCompany = val;
  bool hasInsuranceCompany() => _insuranceCompany != null;

  // "fuel_type" field.
  CarModelStruct? _fuelType;
  CarModelStruct get fuelType => _fuelType ?? CarModelStruct();
  set fuelType(CarModelStruct? val) => _fuelType = val;
  void updateFuelType(Function(CarModelStruct) updateFn) =>
      updateFn(_fuelType ??= CarModelStruct());
  bool hasFuelType() => _fuelType != null;

  // "car_category" field.
  CarModelStruct? _carCategory;
  CarModelStruct get carCategory => _carCategory ?? CarModelStruct();
  set carCategory(CarModelStruct? val) => _carCategory = val;
  void updateCarCategory(Function(CarModelStruct) updateFn) =>
      updateFn(_carCategory ??= CarModelStruct());
  bool hasCarCategory() => _carCategory != null;

  // "car_model" field.
  CarModelStruct? _carModel;
  CarModelStruct get carModel => _carModel ?? CarModelStruct();
  set carModel(CarModelStruct? val) => _carModel = val;
  void updateCarModel(Function(CarModelStruct) updateFn) =>
      updateFn(_carModel ??= CarModelStruct());
  bool hasCarModel() => _carModel != null;

  static MyVehicleModelStruct fromMap(Map<String, dynamic> data) =>
      MyVehicleModelStruct(
        id: castToType<int>(data['id']),
        userId: castToType<int>(data['user_id']),
        ownerName: data['owner_name'] as String?,
        address: data['address'] as String?,
        carCategoryId: castToType<int>(data['car_category_id']),
        carModelId: castToType<int>(data['car_model_id']),
        color: data['color'] as String?,
        yearOfManufacturing: data['year_of_manufacturing'] as String?,
        registeredUntil: data['registered_until'] as String?,
        plateNumber: data['plate_number'] as String?,
        registrationNumber: castToType<int>(data['registration_number']),
        vinNumber: data['vin_number'] as String?,
        engineCapacity: data['engine_capacity'] as String?,
        engineNumber: data['engine_number'] as String?,
        fuelTypeId: castToType<int>(data['fuel_type_id']),
        insuranceCompany: data['insurance_company'] as String?,
        fuelType: CarModelStruct.maybeFromMap(data['fuel_type']),
        carCategory: CarModelStruct.maybeFromMap(data['car_category']),
        carModel: CarModelStruct.maybeFromMap(data['car_model']),
      );

  static MyVehicleModelStruct? maybeFromMap(dynamic data) => data is Map
      ? MyVehicleModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'user_id': _userId,
        'owner_name': _ownerName,
        'address': _address,
        'car_category_id': _carCategoryId,
        'car_model_id': _carModelId,
        'color': _color,
        'year_of_manufacturing': _yearOfManufacturing,
        'registered_until': _registeredUntil,
        'plate_number': _plateNumber,
        'registration_number': _registrationNumber,
        'vin_number': _vinNumber,
        'engine_capacity': _engineCapacity,
        'engine_number': _engineNumber,
        'fuel_type_id': _fuelTypeId,
        'insurance_company': _insuranceCompany,
        'fuel_type': _fuelType?.toMap(),
        'car_category': _carCategory?.toMap(),
        'car_model': _carModel?.toMap(),
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
        'owner_name': serializeParam(
          _ownerName,
          ParamType.String,
        ),
        'address': serializeParam(
          _address,
          ParamType.String,
        ),
        'car_category_id': serializeParam(
          _carCategoryId,
          ParamType.int,
        ),
        'car_model_id': serializeParam(
          _carModelId,
          ParamType.int,
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
          ParamType.int,
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
        'fuel_type_id': serializeParam(
          _fuelTypeId,
          ParamType.int,
        ),
        'insurance_company': serializeParam(
          _insuranceCompany,
          ParamType.String,
        ),
        'fuel_type': serializeParam(
          _fuelType,
          ParamType.DataStruct,
        ),
        'car_category': serializeParam(
          _carCategory,
          ParamType.DataStruct,
        ),
        'car_model': serializeParam(
          _carModel,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static MyVehicleModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      MyVehicleModelStruct(
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
        carCategoryId: deserializeParam(
          data['car_category_id'],
          ParamType.int,
          false,
        ),
        carModelId: deserializeParam(
          data['car_model_id'],
          ParamType.int,
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
          ParamType.int,
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
        fuelTypeId: deserializeParam(
          data['fuel_type_id'],
          ParamType.int,
          false,
        ),
        insuranceCompany: deserializeParam(
          data['insurance_company'],
          ParamType.String,
          false,
        ),
        fuelType: deserializeStructParam(
          data['fuel_type'],
          ParamType.DataStruct,
          false,
          structBuilder: CarModelStruct.fromSerializableMap,
        ),
        carCategory: deserializeStructParam(
          data['car_category'],
          ParamType.DataStruct,
          false,
          structBuilder: CarModelStruct.fromSerializableMap,
        ),
        carModel: deserializeStructParam(
          data['car_model'],
          ParamType.DataStruct,
          false,
          structBuilder: CarModelStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'MyVehicleModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MyVehicleModelStruct &&
        id == other.id &&
        userId == other.userId &&
        ownerName == other.ownerName &&
        address == other.address &&
        carCategoryId == other.carCategoryId &&
        carModelId == other.carModelId &&
        color == other.color &&
        yearOfManufacturing == other.yearOfManufacturing &&
        registeredUntil == other.registeredUntil &&
        plateNumber == other.plateNumber &&
        registrationNumber == other.registrationNumber &&
        vinNumber == other.vinNumber &&
        engineCapacity == other.engineCapacity &&
        engineNumber == other.engineNumber &&
        fuelTypeId == other.fuelTypeId &&
        insuranceCompany == other.insuranceCompany &&
        fuelType == other.fuelType &&
        carCategory == other.carCategory &&
        carModel == other.carModel;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        userId,
        ownerName,
        address,
        carCategoryId,
        carModelId,
        color,
        yearOfManufacturing,
        registeredUntil,
        plateNumber,
        registrationNumber,
        vinNumber,
        engineCapacity,
        engineNumber,
        fuelTypeId,
        insuranceCompany,
        fuelType,
        carCategory,
        carModel
      ]);
}

MyVehicleModelStruct createMyVehicleModelStruct({
  int? id,
  int? userId,
  String? ownerName,
  String? address,
  int? carCategoryId,
  int? carModelId,
  String? color,
  String? yearOfManufacturing,
  String? registeredUntil,
  String? plateNumber,
  int? registrationNumber,
  String? vinNumber,
  String? engineCapacity,
  String? engineNumber,
  int? fuelTypeId,
  String? insuranceCompany,
  CarModelStruct? fuelType,
  CarModelStruct? carCategory,
  CarModelStruct? carModel,
}) =>
    MyVehicleModelStruct(
      id: id,
      userId: userId,
      ownerName: ownerName,
      address: address,
      carCategoryId: carCategoryId,
      carModelId: carModelId,
      color: color,
      yearOfManufacturing: yearOfManufacturing,
      registeredUntil: registeredUntil,
      plateNumber: plateNumber,
      registrationNumber: registrationNumber,
      vinNumber: vinNumber,
      engineCapacity: engineCapacity,
      engineNumber: engineNumber,
      fuelTypeId: fuelTypeId,
      insuranceCompany: insuranceCompany,
      fuelType: fuelType ?? CarModelStruct(),
      carCategory: carCategory ?? CarModelStruct(),
      carModel: carModel ?? CarModelStruct(),
    );
