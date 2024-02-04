// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PartModelStruct extends FFFirebaseStruct {
  PartModelStruct({
    int? id,
    String? nameEn,
    String? nameAr,
    int? categoryId,
    String? partNumber,
    String? weight,
    String? length,
    String? height,
    String? width,
    String? image,
    int? status,
    String? fullImage,
    String? name,
    double? specialPrice,
    int? quantity,
    double? price,
    double? discAmount,
    bool? isLoading,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _nameEn = nameEn,
        _nameAr = nameAr,
        _categoryId = categoryId,
        _partNumber = partNumber,
        _weight = weight,
        _length = length,
        _height = height,
        _width = width,
        _image = image,
        _status = status,
        _fullImage = fullImage,
        _name = name,
        _specialPrice = specialPrice,
        _quantity = quantity,
        _price = price,
        _discAmount = discAmount,
        _isLoading = isLoading,
        super(firestoreUtilData);

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

  // "category_id" field.
  int? _categoryId;
  int get categoryId => _categoryId ?? 0;
  set categoryId(int? val) => _categoryId = val;
  void incrementCategoryId(int amount) => _categoryId = categoryId + amount;
  bool hasCategoryId() => _categoryId != null;

  // "part_number" field.
  String? _partNumber;
  String get partNumber => _partNumber ?? '';
  set partNumber(String? val) => _partNumber = val;
  bool hasPartNumber() => _partNumber != null;

  // "weight" field.
  String? _weight;
  String get weight => _weight ?? '';
  set weight(String? val) => _weight = val;
  bool hasWeight() => _weight != null;

  // "length" field.
  String? _length;
  String get length => _length ?? '';
  set length(String? val) => _length = val;
  bool hasLength() => _length != null;

  // "height" field.
  String? _height;
  String get height => _height ?? '';
  set height(String? val) => _height = val;
  bool hasHeight() => _height != null;

  // "width" field.
  String? _width;
  String get width => _width ?? '';
  set width(String? val) => _width = val;
  bool hasWidth() => _width != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  set image(String? val) => _image = val;
  bool hasImage() => _image != null;

  // "status" field.
  int? _status;
  int get status => _status ?? 0;
  set status(int? val) => _status = val;
  void incrementStatus(int amount) => _status = status + amount;
  bool hasStatus() => _status != null;

  // "full_image" field.
  String? _fullImage;
  String get fullImage => _fullImage ?? '';
  set fullImage(String? val) => _fullImage = val;
  bool hasFullImage() => _fullImage != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "special_price" field.
  double? _specialPrice;
  double get specialPrice => _specialPrice ?? 0.0;
  set specialPrice(double? val) => _specialPrice = val;
  void incrementSpecialPrice(double amount) =>
      _specialPrice = specialPrice + amount;
  bool hasSpecialPrice() => _specialPrice != null;

  // "quantity" field.
  int? _quantity;
  int get quantity => _quantity ?? 0;
  set quantity(int? val) => _quantity = val;
  void incrementQuantity(int amount) => _quantity = quantity + amount;
  bool hasQuantity() => _quantity != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  set price(double? val) => _price = val;
  void incrementPrice(double amount) => _price = price + amount;
  bool hasPrice() => _price != null;

  // "disc_amount" field.
  double? _discAmount;
  double get discAmount => _discAmount ?? 0.0;
  set discAmount(double? val) => _discAmount = val;
  void incrementDiscAmount(double amount) => _discAmount = discAmount + amount;
  bool hasDiscAmount() => _discAmount != null;

  // "isLoading" field.
  bool? _isLoading;
  bool get isLoading => _isLoading ?? false;
  set isLoading(bool? val) => _isLoading = val;
  bool hasIsLoading() => _isLoading != null;

  static PartModelStruct fromMap(Map<String, dynamic> data) => PartModelStruct(
        id: castToType<int>(data['id']),
        nameEn: data['name_en'] as String?,
        nameAr: data['name_ar'] as String?,
        categoryId: castToType<int>(data['category_id']),
        partNumber: data['part_number'] as String?,
        weight: data['weight'] as String?,
        length: data['length'] as String?,
        height: data['height'] as String?,
        width: data['width'] as String?,
        image: data['image'] as String?,
        status: castToType<int>(data['status']),
        fullImage: data['full_image'] as String?,
        name: data['name'] as String?,
        specialPrice: data['special_price'].toDouble() ?? 0,
        quantity: castToType<int>(data['quantity']),
        price: castToType<double>(data['price']),
        discAmount:  data['disc_amount'].toDouble()?? 0.0,
        isLoading: data['isLoading'] as bool?,
      );

  static PartModelStruct? maybeFromMap(dynamic data) => data is Map
      ? PartModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name_en': _nameEn,
        'name_ar': _nameAr,
        'category_id': _categoryId,
        'part_number': _partNumber,
        'weight': _weight,
        'length': _length,
        'height': _height,
        'width': _width,
        'image': _image,
        'status': _status,
        'full_image': _fullImage,
        'name': _name,
        'special_price': _specialPrice,
        'quantity': _quantity,
        'price': _price,
        'disc_amount': _discAmount,
        'isLoading': _isLoading,
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
        'category_id': serializeParam(
          _categoryId,
          ParamType.int,
        ),
        'part_number': serializeParam(
          _partNumber,
          ParamType.String,
        ),
        'weight': serializeParam(
          _weight,
          ParamType.String,
        ),
        'length': serializeParam(
          _length,
          ParamType.String,
        ),
        'height': serializeParam(
          _height,
          ParamType.String,
        ),
        'width': serializeParam(
          _width,
          ParamType.String,
        ),
        'image': serializeParam(
          _image,
          ParamType.String,
        ),
        'status': serializeParam(
          _status,
          ParamType.int,
        ),
        'full_image': serializeParam(
          _fullImage,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'special_price': serializeParam(
          _specialPrice,
          ParamType.double,
        ),
        'quantity': serializeParam(
          _quantity,
          ParamType.int,
        ),
        'price': serializeParam(
          _price,
          ParamType.double,
        ),
        'disc_amount': serializeParam(
          _discAmount,
          ParamType.double,
        ),
        'isLoading': serializeParam(
          _isLoading,
          ParamType.bool,
        ),
      }.withoutNulls;

  static PartModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      PartModelStruct(
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
        categoryId: deserializeParam(
          data['category_id'],
          ParamType.int,
          false,
        ),
        partNumber: deserializeParam(
          data['part_number'],
          ParamType.String,
          false,
        ),
        weight: deserializeParam(
          data['weight'],
          ParamType.String,
          false,
        ),
        length: deserializeParam(
          data['length'],
          ParamType.String,
          false,
        ),
        height: deserializeParam(
          data['height'],
          ParamType.String,
          false,
        ),
        width: deserializeParam(
          data['width'],
          ParamType.String,
          false,
        ),
        image: deserializeParam(
          data['image'],
          ParamType.String,
          false,
        ),
        status: deserializeParam(
          data['status'],
          ParamType.int,
          false,
        ),
        fullImage: deserializeParam(
          data['full_image'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        specialPrice: deserializeParam(
          data['special_price'],
          ParamType.double,
          false,
        ),
        quantity: deserializeParam(
          data['quantity'],
          ParamType.int,
          false,
        ),
        price: deserializeParam(
          data['price'],
          ParamType.double,
          false,
        ),
        discAmount: deserializeParam(
          data['disc_amount'],
          ParamType.double,
          false,
        ),
        isLoading: deserializeParam(
          data['isLoading'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'PartModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PartModelStruct &&
        id == other.id &&
        nameEn == other.nameEn &&
        nameAr == other.nameAr &&
        categoryId == other.categoryId &&
        partNumber == other.partNumber &&
        weight == other.weight &&
        length == other.length &&
        height == other.height &&
        width == other.width &&
        image == other.image &&
        status == other.status &&
        fullImage == other.fullImage &&
        name == other.name &&
        specialPrice == other.specialPrice &&
        quantity == other.quantity &&
        price == other.price &&
        discAmount == other.discAmount &&
        isLoading == other.isLoading;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        nameEn,
        nameAr,
        categoryId,
        partNumber,
        weight,
        length,
        height,
        width,
        image,
        status,
        fullImage,
        name,
        specialPrice,
        quantity,
        price,
        discAmount,
        isLoading
      ]);
}

PartModelStruct createPartModelStruct({
  int? id,
  String? nameEn,
  String? nameAr,
  int? categoryId,
  String? partNumber,
  String? weight,
  String? length,
  String? height,
  String? width,
  String? image,
  int? status,
  String? fullImage,
  String? name,
  double? specialPrice,
  int? quantity,
  double? price,
  double? discAmount,
  bool? isLoading,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PartModelStruct(
      id: id,
      nameEn: nameEn,
      nameAr: nameAr,
      categoryId: categoryId,
      partNumber: partNumber,
      weight: weight,
      length: length,
      height: height,
      width: width,
      image: image,
      status: status,
      fullImage: fullImage,
      name: name,
      specialPrice: specialPrice,
      quantity: quantity,
      price: price,
      discAmount: discAmount,
      isLoading: isLoading,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PartModelStruct? updatePartModelStruct(
  PartModelStruct? partModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    partModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPartModelStructData(
  Map<String, dynamic> firestoreData,
  PartModelStruct? partModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (partModel == null) {
    return;
  }
  if (partModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && partModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final partModelData = getPartModelFirestoreData(partModel, forFieldValue);
  final nestedData = partModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = partModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPartModelFirestoreData(
  PartModelStruct? partModel, [
  bool forFieldValue = false,
]) {
  if (partModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(partModel.toMap());

  // Add any Firestore field values
  partModel.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPartModelListFirestoreData(
  List<PartModelStruct>? partModels,
) =>
    partModels?.map((e) => getPartModelFirestoreData(e, true)).toList() ?? [];
