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
    _safeInit(() {
      _newsModelJsonList =
          prefs.getStringList('ff_newsModelJsonList')?.map((x) {
                try {
                  return jsonDecode(x);
                } catch (e) {
                  print("Can't decode persisted json. Error: $e.");
                  return {};
                }
              }).toList() ??
              _newsModelJsonList;
    });
    _safeInit(() {
      _sliderList = prefs.getStringList('ff_sliderList')?.map((x) {
            try {
              return jsonDecode(x);
            } catch (e) {
              print("Can't decode persisted json. Error: $e.");
              return {};
            }
          }).toList() ??
          _sliderList;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_biomatricDtateModel')) {
        try {
          final serializedData =
              prefs.getString('ff_biomatricDtateModel') ?? '{}';
          _biomatricDtateModel = BiomatricModelStruct.fromSerializableMap(
              jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _isFingerEnabled =
          prefs.getBool('ff_isFingerEnabled') ?? _isFingerEnabled;
    });
    _safeInit(() {
      _currentLanguge = prefs.getString('ff_currentLanguge') ?? _currentLanguge;
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

  List<dynamic> _newsModelJsonList = [];
  List<dynamic> get newsModelJsonList => _newsModelJsonList;
  set newsModelJsonList(List<dynamic> _value) {
    _newsModelJsonList = _value;
    prefs.setStringList(
        'ff_newsModelJsonList', _value.map((x) => jsonEncode(x)).toList());
  }

  void addToNewsModelJsonList(dynamic _value) {
    _newsModelJsonList.add(_value);
    prefs.setStringList('ff_newsModelJsonList',
        _newsModelJsonList.map((x) => jsonEncode(x)).toList());
  }

  void removeFromNewsModelJsonList(dynamic _value) {
    _newsModelJsonList.remove(_value);
    prefs.setStringList('ff_newsModelJsonList',
        _newsModelJsonList.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromNewsModelJsonList(int _index) {
    _newsModelJsonList.removeAt(_index);
    prefs.setStringList('ff_newsModelJsonList',
        _newsModelJsonList.map((x) => jsonEncode(x)).toList());
  }

  void updateNewsModelJsonListAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _newsModelJsonList[_index] = updateFn(_newsModelJsonList[_index]);
    prefs.setStringList('ff_newsModelJsonList',
        _newsModelJsonList.map((x) => jsonEncode(x)).toList());
  }

  void insertAtIndexInNewsModelJsonList(int _index, dynamic _value) {
    _newsModelJsonList.insert(_index, _value);
    prefs.setStringList('ff_newsModelJsonList',
        _newsModelJsonList.map((x) => jsonEncode(x)).toList());
  }

  List<dynamic> _sharedLocationsJsonList = [];
  List<dynamic> get sharedLocationsJsonList => _sharedLocationsJsonList;
  set sharedLocationsJsonList(List<dynamic> _value) {
    _sharedLocationsJsonList = _value;
  }

  void addToSharedLocationsJsonList(dynamic _value) {
    _sharedLocationsJsonList.add(_value);
  }

  void removeFromSharedLocationsJsonList(dynamic _value) {
    _sharedLocationsJsonList.remove(_value);
  }

  void removeAtIndexFromSharedLocationsJsonList(int _index) {
    _sharedLocationsJsonList.removeAt(_index);
  }

  void updateSharedLocationsJsonListAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _sharedLocationsJsonList[_index] =
        updateFn(_sharedLocationsJsonList[_index]);
  }

  void insertAtIndexInSharedLocationsJsonList(int _index, dynamic _value) {
    _sharedLocationsJsonList.insert(_index, _value);
  }

  List<bool> _listOfOpendItems = [];
  List<bool> get listOfOpendItems => _listOfOpendItems;
  set listOfOpendItems(List<bool> _value) {
    _listOfOpendItems = _value;
  }

  void addToListOfOpendItems(bool _value) {
    _listOfOpendItems.add(_value);
  }

  void removeFromListOfOpendItems(bool _value) {
    _listOfOpendItems.remove(_value);
  }

  void removeAtIndexFromListOfOpendItems(int _index) {
    _listOfOpendItems.removeAt(_index);
  }

  void updateListOfOpendItemsAtIndex(
    int _index,
    bool Function(bool) updateFn,
  ) {
    _listOfOpendItems[_index] = updateFn(_listOfOpendItems[_index]);
  }

  void insertAtIndexInListOfOpendItems(int _index, bool _value) {
    _listOfOpendItems.insert(_index, _value);
  }

  List<dynamic> _listOfPublicOffers = [];
  List<dynamic> get listOfPublicOffers => _listOfPublicOffers;
  set listOfPublicOffers(List<dynamic> _value) {
    _listOfPublicOffers = _value;
  }

  void addToListOfPublicOffers(dynamic _value) {
    _listOfPublicOffers.add(_value);
  }

  void removeFromListOfPublicOffers(dynamic _value) {
    _listOfPublicOffers.remove(_value);
  }

  void removeAtIndexFromListOfPublicOffers(int _index) {
    _listOfPublicOffers.removeAt(_index);
  }

  void updateListOfPublicOffersAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _listOfPublicOffers[_index] = updateFn(_listOfPublicOffers[_index]);
  }

  void insertAtIndexInListOfPublicOffers(int _index, dynamic _value) {
    _listOfPublicOffers.insert(_index, _value);
  }

  bool _isDarkMode = false;
  bool get isDarkMode => _isDarkMode;
  set isDarkMode(bool _value) {
    _isDarkMode = _value;
  }

  List<bool> _listOfCatalogOpendBool = [true, false, false, false];
  List<bool> get listOfCatalogOpendBool => _listOfCatalogOpendBool;
  set listOfCatalogOpendBool(List<bool> _value) {
    _listOfCatalogOpendBool = _value;
  }

  void addToListOfCatalogOpendBool(bool _value) {
    _listOfCatalogOpendBool.add(_value);
  }

  void removeFromListOfCatalogOpendBool(bool _value) {
    _listOfCatalogOpendBool.remove(_value);
  }

  void removeAtIndexFromListOfCatalogOpendBool(int _index) {
    _listOfCatalogOpendBool.removeAt(_index);
  }

  void updateListOfCatalogOpendBoolAtIndex(
    int _index,
    bool Function(bool) updateFn,
  ) {
    _listOfCatalogOpendBool[_index] = updateFn(_listOfCatalogOpendBool[_index]);
  }

  void insertAtIndexInListOfCatalogOpendBool(int _index, bool _value) {
    _listOfCatalogOpendBool.insert(_index, _value);
  }

  String _password = '';
  String get password => _password;
  set password(String _value) {
    _password = _value;
  }

  List<dynamic> _listOfCarsModelAppState = [];
  List<dynamic> get listOfCarsModelAppState => _listOfCarsModelAppState;
  set listOfCarsModelAppState(List<dynamic> _value) {
    _listOfCarsModelAppState = _value;
  }

  void addToListOfCarsModelAppState(dynamic _value) {
    _listOfCarsModelAppState.add(_value);
  }

  void removeFromListOfCarsModelAppState(dynamic _value) {
    _listOfCarsModelAppState.remove(_value);
  }

  void removeAtIndexFromListOfCarsModelAppState(int _index) {
    _listOfCarsModelAppState.removeAt(_index);
  }

  void updateListOfCarsModelAppStateAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _listOfCarsModelAppState[_index] =
        updateFn(_listOfCarsModelAppState[_index]);
  }

  void insertAtIndexInListOfCarsModelAppState(int _index, dynamic _value) {
    _listOfCarsModelAppState.insert(_index, _value);
  }

  List<dynamic> _socialMediaJsonObject = [];
  List<dynamic> get socialMediaJsonObject => _socialMediaJsonObject;
  set socialMediaJsonObject(List<dynamic> _value) {
    _socialMediaJsonObject = _value;
  }

  void addToSocialMediaJsonObject(dynamic _value) {
    _socialMediaJsonObject.add(_value);
  }

  void removeFromSocialMediaJsonObject(dynamic _value) {
    _socialMediaJsonObject.remove(_value);
  }

  void removeAtIndexFromSocialMediaJsonObject(int _index) {
    _socialMediaJsonObject.removeAt(_index);
  }

  void updateSocialMediaJsonObjectAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _socialMediaJsonObject[_index] = updateFn(_socialMediaJsonObject[_index]);
  }

  void insertAtIndexInSocialMediaJsonObject(int _index, dynamic _value) {
    _socialMediaJsonObject.insert(_index, _value);
  }

  List<dynamic> _sliderList = [];
  List<dynamic> get sliderList => _sliderList;
  set sliderList(List<dynamic> _value) {
    _sliderList = _value;
    prefs.setStringList(
        'ff_sliderList', _value.map((x) => jsonEncode(x)).toList());
  }

  void addToSliderList(dynamic _value) {
    _sliderList.add(_value);
    prefs.setStringList(
        'ff_sliderList', _sliderList.map((x) => jsonEncode(x)).toList());
  }

  void removeFromSliderList(dynamic _value) {
    _sliderList.remove(_value);
    prefs.setStringList(
        'ff_sliderList', _sliderList.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromSliderList(int _index) {
    _sliderList.removeAt(_index);
    prefs.setStringList(
        'ff_sliderList', _sliderList.map((x) => jsonEncode(x)).toList());
  }

  void updateSliderListAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _sliderList[_index] = updateFn(_sliderList[_index]);
    prefs.setStringList(
        'ff_sliderList', _sliderList.map((x) => jsonEncode(x)).toList());
  }

  void insertAtIndexInSliderList(int _index, dynamic _value) {
    _sliderList.insert(_index, _value);
    prefs.setStringList(
        'ff_sliderList', _sliderList.map((x) => jsonEncode(x)).toList());
  }

  dynamic _firstImage;
  dynamic get firstImage => _firstImage;
  set firstImage(dynamic _value) {
    _firstImage = _value;
  }

  dynamic _secendImage;
  dynamic get secendImage => _secendImage;
  set secendImage(dynamic _value) {
    _secendImage = _value;
  }

  BiomatricModelStruct _biomatricDtateModel = BiomatricModelStruct();
  BiomatricModelStruct get biomatricDtateModel => _biomatricDtateModel;
  set biomatricDtateModel(BiomatricModelStruct _value) {
    _biomatricDtateModel = _value;
    prefs.setString('ff_biomatricDtateModel', _value.serialize());
  }

  void updateBiomatricDtateModelStruct(
      Function(BiomatricModelStruct) updateFn) {
    updateFn(_biomatricDtateModel);
    prefs.setString('ff_biomatricDtateModel', _biomatricDtateModel.serialize());
  }

  bool _isFingerEnabled = false;
  bool get isFingerEnabled => _isFingerEnabled;
  set isFingerEnabled(bool _value) {
    _isFingerEnabled = _value;
    prefs.setBool('ff_isFingerEnabled', _value);
  }

  String _currentLanguge = '';
  String get currentLanguge => _currentLanguge;
  set currentLanguge(String _value) {
    _currentLanguge = _value;
    prefs.setString('ff_currentLanguge', _value);
  }

  String _FCM = '';
  String get FCM => _FCM;
  set FCM(String _value) {
    _FCM = _value;
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
