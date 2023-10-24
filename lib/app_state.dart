import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      if (prefs.containsKey('ff_userModel')) {
        try {
          final serializedData = prefs.getString('ff_userModel') ?? '{}';
          _userModel =
              UserModelStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<String> _textFromFrontDrivLisn = [];
  List<String> get textFromFrontDrivLisn => _textFromFrontDrivLisn;
  set textFromFrontDrivLisn(List<String> _value) {
    _textFromFrontDrivLisn = _value;
  }

  void addToTextFromFrontDrivLisn(String _value) {
    _textFromFrontDrivLisn.add(_value);
  }

  void removeFromTextFromFrontDrivLisn(String _value) {
    _textFromFrontDrivLisn.remove(_value);
  }

  void removeAtIndexFromTextFromFrontDrivLisn(int _index) {
    _textFromFrontDrivLisn.removeAt(_index);
  }

  void updateTextFromFrontDrivLisnAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _textFromFrontDrivLisn[_index] = updateFn(_textFromFrontDrivLisn[_index]);
  }

  void insertAtIndexInTextFromFrontDrivLisn(int _index, String _value) {
    _textFromFrontDrivLisn.insert(_index, _value);
  }

  List<ShopListItemModelStruct> _itemsShopList = [
    ShopListItemModelStruct.fromSerializableMap(jsonDecode(
        '{\"image_url\":\"https://cdn-icons-png.flaticon.com/512/107/107765.png\",\"title\":\"Filter\",\"description\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent pharetra 123456789\"}')),
    ShopListItemModelStruct.fromSerializableMap(jsonDecode(
        '{\"image_url\":\"https://picsum.photos/seed/571/600\",\"title\":\"Hello World\",\"description\":\"Hello World\"}')),
    ShopListItemModelStruct.fromSerializableMap(jsonDecode(
        '{\"image_url\":\"https://picsum.photos/seed/258/600\",\"title\":\"Hello World\",\"description\":\"Hello World\"}')),
    ShopListItemModelStruct.fromSerializableMap(jsonDecode(
        '{\"image_url\":\"https://picsum.photos/seed/869/600\",\"title\":\"Hello World\",\"description\":\"Hello World\"}')),
    ShopListItemModelStruct.fromSerializableMap(jsonDecode(
        '{\"image_url\":\"https://picsum.photos/seed/463/600\",\"title\":\"Hello World\",\"description\":\"Hello World\"}')),
    ShopListItemModelStruct.fromSerializableMap(jsonDecode(
        '{\"image_url\":\"https://picsum.photos/seed/623/600\",\"title\":\"Hello World\",\"description\":\"Hello World\"}')),
    ShopListItemModelStruct.fromSerializableMap(jsonDecode(
        '{\"image_url\":\"https://picsum.photos/seed/24/600\",\"title\":\"Hello World\",\"description\":\"Hello World\"}')),
    ShopListItemModelStruct.fromSerializableMap(jsonDecode(
        '{\"image_url\":\"https://picsum.photos/seed/65/600\",\"title\":\"Hello World\",\"description\":\"Hello World\"}')),
    ShopListItemModelStruct.fromSerializableMap(jsonDecode(
        '{\"image_url\":\"https://picsum.photos/seed/341/600\",\"title\":\"Hello World\",\"description\":\"Hello World\"}')),
    ShopListItemModelStruct.fromSerializableMap(jsonDecode(
        '{\"image_url\":\"https://picsum.photos/seed/494/600\",\"title\":\"Hello World\",\"description\":\"Hello World\"}')),
    ShopListItemModelStruct.fromSerializableMap(jsonDecode(
        '{\"image_url\":\"https://picsum.photos/seed/821/600\",\"title\":\"Hello World\",\"description\":\"Hello World\"}')),
    ShopListItemModelStruct.fromSerializableMap(jsonDecode(
        '{\"image_url\":\"https://picsum.photos/seed/134/600\",\"title\":\"Hello World\",\"description\":\"Hello World\"}')),
    ShopListItemModelStruct.fromSerializableMap(jsonDecode(
        '{\"image_url\":\"https://picsum.photos/seed/538/600\",\"title\":\"Hello World\",\"description\":\"Hello World\"}')),
    ShopListItemModelStruct.fromSerializableMap(jsonDecode(
        '{\"image_url\":\"https://picsum.photos/seed/706/600\",\"title\":\"Hello World\",\"description\":\"Hello World\"}')),
    ShopListItemModelStruct.fromSerializableMap(jsonDecode(
        '{\"image_url\":\"https://picsum.photos/seed/243/600\",\"title\":\"Hello World\",\"description\":\"Hello World\"}')),
    ShopListItemModelStruct.fromSerializableMap(jsonDecode(
        '{\"image_url\":\"https://picsum.photos/seed/495/600\",\"title\":\"Hello World\",\"description\":\"Hello World\"}')),
    ShopListItemModelStruct.fromSerializableMap(jsonDecode(
        '{\"image_url\":\"https://picsum.photos/seed/379/600\",\"title\":\"Hello World2\",\"description\":\"Hello World\"}'))
  ];
  List<ShopListItemModelStruct> get itemsShopList => _itemsShopList;
  set itemsShopList(List<ShopListItemModelStruct> _value) {
    _itemsShopList = _value;
  }

  void addToItemsShopList(ShopListItemModelStruct _value) {
    _itemsShopList.add(_value);
  }

  void removeFromItemsShopList(ShopListItemModelStruct _value) {
    _itemsShopList.remove(_value);
  }

  void removeAtIndexFromItemsShopList(int _index) {
    _itemsShopList.removeAt(_index);
  }

  void updateItemsShopListAtIndex(
    int _index,
    ShopListItemModelStruct Function(ShopListItemModelStruct) updateFn,
  ) {
    _itemsShopList[_index] = updateFn(_itemsShopList[_index]);
  }

  void insertAtIndexInItemsShopList(
      int _index, ShopListItemModelStruct _value) {
    _itemsShopList.insert(_index, _value);
  }

  UserModelStruct _userModel =
      UserModelStruct.fromSerializableMap(jsonDecode('{}'));
  UserModelStruct get userModel => _userModel;
  set userModel(UserModelStruct _value) {
    _userModel = _value;
    prefs.setString('ff_userModel', _value.serialize());
  }

  void updateUserModelStruct(Function(UserModelStruct) updateFn) {
    updateFn(_userModel);
    prefs.setString('ff_userModel', _userModel.serialize());
  }

  dynamic _reservedUserModel;
  dynamic get reservedUserModel => _reservedUserModel;
  set reservedUserModel(dynamic _value) {
    _reservedUserModel = _value;
  }

  List<NewsModelStruct> _newsModelList = [
    NewsModelStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"0\",\"title_en\":\" \",\"title_ar\":\" \",\"description_en\":\" \",\"description_ar\":\" \",\"main_image\":\" \",\"thumb_image\":\" \",\"date\":\" \",\"status\":\"0\",\"created_at\":\" \",\"updated_at\":\" \",\"full_main_image\":\" \",\"full_thumb_image\":\" \",\"title\":\" \",\"description\":\" \"}'))
  ];
  List<NewsModelStruct> get newsModelList => _newsModelList;
  set newsModelList(List<NewsModelStruct> _value) {
    _newsModelList = _value;
  }

  void addToNewsModelList(NewsModelStruct _value) {
    _newsModelList.add(_value);
  }

  void removeFromNewsModelList(NewsModelStruct _value) {
    _newsModelList.remove(_value);
  }

  void removeAtIndexFromNewsModelList(int _index) {
    _newsModelList.removeAt(_index);
  }

  void updateNewsModelListAtIndex(
    int _index,
    NewsModelStruct Function(NewsModelStruct) updateFn,
  ) {
    _newsModelList[_index] = updateFn(_newsModelList[_index]);
  }

  void insertAtIndexInNewsModelList(int _index, NewsModelStruct _value) {
    _newsModelList.insert(_index, _value);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
