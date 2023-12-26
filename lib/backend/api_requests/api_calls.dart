import 'dart:convert';
import 'dart:typed_data';
import '../schema/structs/index.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class LoginApiCall {
  static Future<ApiCallResponse> call({
    String? phone = '0777882330',
    String? password = 'password',
  }) async {
    final ffApiRequestBody = '''
{"phone":"${phone}","password":"${password}"}''';
    return ApiManager.instance.makeApiCall(
      callName: 'LoginApi',
      apiUrl: 'https://hyundai.completechaintech.com/api/login',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic userJsonModel(dynamic response) => getJsonField(
        response,
        r'''$''',
      );
  static dynamic id(dynamic response) => getJsonField(
        response,
        r'''$.id''',
      );
  static dynamic name(dynamic response) => getJsonField(
        response,
        r'''$.name''',
      );
  static dynamic email(dynamic response) => getJsonField(
        response,
        r'''$.email''',
      );
  static dynamic phone(dynamic response) => getJsonField(
        response,
        r'''$.phone''',
      );
  static dynamic token(dynamic response) => getJsonField(
        response,
        r'''$.token''',
      );
}

class RegisterApiCall {
  static Future<ApiCallResponse> call({
    String? phone = '',
    String? password = '',
    String? name = '',
    String? gender = '',
    String? lang = '',
    String? email = '',
    String? countryCode = 'JO',
    String? date = '',
  }) async {
    final ffApiRequestBody = '''
{
"phone": "${phone}",
"password": "${password}",
"name_en": "${name}",
"name": "${name}",
"gender": "${gender}",
"lang": "${lang}",
"email": "${email}",
"country_code": "JO",
"bod": "${date}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'RegisterApi',
      apiUrl: 'https://hyundai.completechaintech.com/api/register',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic userJsonModel(dynamic response) => getJsonField(
        response,
        r'''$.user''',
      );
  static dynamic id(dynamic response) => getJsonField(
        response,
        r'''$.id''',
      );
  static dynamic name(dynamic response) => getJsonField(
        response,
        r'''$.name''',
      );
  static dynamic email(dynamic response) => getJsonField(
        response,
        r'''$.email''',
      );
  static dynamic phone(dynamic response) => getJsonField(
        response,
        r'''$.phone''',
      );
  static dynamic token(dynamic response) => getJsonField(
        response,
        r'''$.token''',
      );
}

class GetMobileNumberCall {
  static Future<ApiCallResponse> call({
    String? phone = '',
  }) async {
    final ffApiRequestBody = '''
{
"phone": "${phone}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GetMobileNumber',
      apiUrl:
          'https://hyundai.completechaintech.com/api/forgetPassword/getMobileNumber',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetVerifiedCodeApiCall {
  static Future<ApiCallResponse> call({
    String? phone = '',
    String? verifiedCode = '',
  }) async {
    final ffApiRequestBody = '''
{
  "phone": "${phone}",
  "verified_code": "${verifiedCode}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GetVerifiedCodeApi',
      apiUrl:
          'https://hyundai.completechaintech.com/api/forgetPassword/getVerifiedCode',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic token(dynamic response) => getJsonField(
        response,
        r'''$.token''',
      );
}

class ChangePasswordApiCall {
  static Future<ApiCallResponse> call({
    String? passwordConfirmation = '',
    String? password = '',
    String? token = '',
  }) async {
    final ffApiRequestBody = '''
{
  "password": "${password}",
  "password_confirmation": "${passwordConfirmation}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'ChangePasswordApi',
      apiUrl:
          'https://hyundai.completechaintech.com/api/forgetPassword/changePassword',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
        'Accept': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic token(dynamic response) => getJsonField(
        response,
        r'''$.token''',
      );
}

class LicenseScanApiCall {
  static Future<ApiCallResponse> call({
    FFUploadedFile? firstImage,
    FFUploadedFile? secondImage,
    String? token = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'licenseScanApi',
      apiUrl: 'https://hyundai.completechaintech.com/api/vehicle/licenseScan',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
        'Accept': 'application/json',
      },
      params: {
        'first_image': firstImage,
        'second_image': secondImage,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class TestDriveApiCall {
  static Future<ApiCallResponse> call({
    String? date = '',
    String? time = '',
    String? token = '',
    String? note = '',
    String? status = '',
    int? carModelId,
  }) async {
    final ffApiRequestBody = '''
{
  "car_model_id": ${carModelId},
  "date": "${date}",
  "time": "${time}",
  "note": "${note}",
  "status": "${status}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'testDriveApi',
      apiUrl: 'https://hyundai.completechaintech.com/api/testDrive/store',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
        'Accept': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class StoreVehicleApiCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? ownerName = '',
    String? address = '',
    String? carType = '',
    String? carModelId = '',
    String? carCategoryId = '',
    String? color = '',
    String? yearOfManufacturing = '',
    String? registeredUntil = '',
    String? plateNumber = '',
    String? registrationNumber = '',
    String? vinNumber = '',
    String? engineCapacity = '',
    String? engineNumber = '',
    String? fuelTypeId = '',
    String? insuranceCompany = '',
  }) async {
    final ffApiRequestBody = '''
{
  "owner_name": "${ownerName}",
  "address": "${address}",
  "car_type": "${carType}",
  "car_model_id": "${carModelId}",
  "car_category_id": "${carCategoryId}",
  "color": "${color}",
  "year_of_manufacturing": "${yearOfManufacturing}",
  "registered_until": "${registeredUntil}",
  "plate_number": "${plateNumber}",
  "registration_number": "${registrationNumber}",
  "vin_number": "${vinNumber}",
  "engine_capacity": "${engineCapacity}",
  "engine_number": "${engineNumber}",
  "fuel_type_id": "${fuelTypeId}",
  "insurance_company": "${insuranceCompany}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'StoreVehicleApi',
      apiUrl: 'https://hyundai.completechaintech.com/api/vehicle/store',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
        'Accept': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class AddToCartApiCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    int? partId,
  }) async {
    final ffApiRequestBody = '''
{
  "part_id": ${partId}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'AddToCartApi',
      apiUrl: 'https://hyundai.completechaintech.com/api/addToCart',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
        'Accept': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class ClearAllCartApiCall {
  static Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'ClearAllCart Api',
      apiUrl: 'https://hyundai.completechaintech.com/api/clearAllCart',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
        'Accept': 'application/json',
      },
      params: {},
      bodyType: BodyType.NONE,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class RemoveItemFromCartApiCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? partId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "part_id": "${partId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'RemoveItemFromCartApi',
      apiUrl: 'https://hyundai.completechaintech.com/api/removeFromCart',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
        'Accept': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class RegularServiceApiCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    int? serviceTypeId,
    String? date = '',
    int? vehicleId,
  }) async {
    final ffApiRequestBody = '''
{
  "service_type_id": ${serviceTypeId},
  "vehicle_id": ${vehicleId},
  "date": "${date}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'RegularServiceApi',
      apiUrl: 'https://hyundai.completechaintech.com/api/regular/service',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
        'Accept': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class RepairServiceApiCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    int? vehicleId,
    String? date = '',
    String? details = '',
  }) async {
    final ffApiRequestBody = '''
{
  "vehicle_id": ${vehicleId},
  "date": "${date}",
  "details": "${details}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'RepairServiceApi',
      apiUrl: 'https://hyundai.completechaintech.com/api/repair/service',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
        'Accept': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetMyCartApiCall {
  static Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getMyCartApi',
      apiUrl: 'https://hyundai.completechaintech.com/api/myCart',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
        'Accept': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateUserApiCall {
  static Future<ApiCallResponse> call({
    String? email = '',
    String? bod = '',
    String? token = '',
    String? phone = '',
    String? lang = '',
    String? name = '',
  }) async {
    final ffApiRequestBody = '''
{
  "email": "${email}",
  "bod": "${bod}",
  "phone": "${phone}",
  "lang": "${lang}",
  "name_en": "${name}",
  "name_ar": "${name}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'UpdateUserApi',
      apiUrl: 'https://hyundai.completechaintech.com/api/user',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': 'Bearer ${token}',
        'Accept': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic token(dynamic response) => getJsonField(
        response,
        r'''$.token''',
      );
}

class TestAuthUserApiCall {
  static Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'TestAuthUserApi',
      apiUrl: 'https://hyundai.completechaintech.com/api/myProfile',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
        'Accept': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class NewsApiCall {
  static Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'NewsApi',
      apiUrl: 'https://hyundai.completechaintech.com/api/news',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
        'Accept': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List? newsModelList(dynamic response) => getJsonField(
        response,
        r'''$.news.data[:]''',
        true,
      ) as List?;
}

class DetailsNewsApiCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? id = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'DetailsNewsApi',
      apiUrl: 'https://hyundai.completechaintech.com/api/news/${id}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
        'Accept': 'application/json',
      },
      params: {
        'id': id,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic? details(dynamic response) => getJsonField(
        response,
        r'''$..details''',
      );
  static dynamic description(dynamic response) => getJsonField(
        response,
        r'''$.details.description''',
      );
}

class LocationApiCall {
  static Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'LocationApi',
      apiUrl: 'https://hyundai.completechaintech.com/api/location',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
        'Accept': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List? apiLocationsJsonList(dynamic response) => getJsonField(
        response,
        r'''$.locations.data''',
        true,
      ) as List?;
}

class OfferApiCall {
  static Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'OfferApi',
      apiUrl: 'https://hyundai.completechaintech.com/api/offer',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
        'Accept': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List? apiListOffersJson(dynamic response) => getJsonField(
        response,
        r'''$.offers.data''',
        true,
      ) as List?;
}

class OfferDetailsApiCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? id = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'OfferDetailsApi',
      apiUrl: 'https://hyundai.completechaintech.com/api/offer/${id}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
        'Accept': 'application/json',
      },
      params: {
        'id': id,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic? offerJsonModel(dynamic response) => getJsonField(
        response,
        r'''$.offer''',
      );
}

class SettingApiCall {
  static Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'SettingApi',
      apiUrl: 'https://hyundai.completechaintech.com/api/setting',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
        'Accept': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List? socialMediaJsonObject(dynamic response) => getJsonField(
        response,
        r'''$.settings''',
        true,
      ) as List?;
}

class SliderApiCall {
  static Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'SliderApi',
      apiUrl: 'https://hyundai.completechaintech.com/api/slider',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
        'Accept': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? listOfStringUrls(dynamic response) => (getJsonField(
        response,
        r'''$.slider.data[:].full_image''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? listOfTitles(dynamic response) => getJsonField(
        response,
        r'''$.slider.data[:].title''',
        true,
      ) as List?;
  static List? listSliderItems(dynamic response) => getJsonField(
        response,
        r'''$.slider.data''',
        true,
      ) as List?;
  static List<String>? sloganenItems(dynamic response) => (getJsonField(
        response,
        r'''$.slider.data[:].slogan_en''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? sloganarItems(dynamic response) => (getJsonField(
        response,
        r'''$.slider.data[:].slogan_ar''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class CarModelsApiCall {
  static Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'CarModelsApi',
      apiUrl: 'https://hyundai.completechaintech.com/api/carCategory',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
        'Accept': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List? carModelList(dynamic response) => getJsonField(
        response,
        r'''$.carCategories.data''',
        true,
      ) as List?;
}

class GetCarsApiCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? id = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetCarsApi',
      apiUrl:
          'https://hyundai.completechaintech.com/api/carCategory/${id}/cars',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
        'Accept': 'application/json',
      },
      params: {
        'id': id,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List? listOfCars(dynamic response) => getJsonField(
        response,
        r'''$.cars.data''',
        true,
      ) as List?;
}

class GetCarDetailsApiCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? id = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetCarDetailsApi',
      apiUrl: 'https://hyundai.completechaintech.com/api/car/${id}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
        'Accept': 'application/json',
      },
      params: {
        'id': id,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic? detailsModel(dynamic response) => getJsonField(
        response,
        r'''$.car''',
      );
  static String? performanceModel(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.car.performance''',
      ));
  static List? carsSlider(dynamic response) => getJsonField(
        response,
        r'''$.car.car_sliders''',
        true,
      ) as List?;
}

class PartsCategoryApiCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    int? page,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'PartsCategoryApi',
      apiUrl: 'https://hyundai.completechaintech.com/api/partsCategory',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
        'Accept': 'application/json',
      },
      params: {
        'token': token,
        'page': page,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic? detailsModel(dynamic response) => getJsonField(
        response,
        r'''$.car''',
      );
  static String? performanceModel(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.car.performance''',
      ));
  static List? carsSlider(dynamic response) => getJsonField(
        response,
        r'''$.car.car_sliders''',
        true,
      ) as List?;
}

class PartsApiCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    int? id,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'PartsApi',
      apiUrl: 'https://hyundai.completechaintech.com/api/part/${id}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
        'Accept': 'application/json',
      },
      params: {
        'token': token,
        'id': id,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic? detailsModel(dynamic response) => getJsonField(
        response,
        r'''$.car''',
      );
  static String? performanceModel(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.car.performance''',
      ));
  static List? carsSlider(dynamic response) => getJsonField(
        response,
        r'''$.car.car_sliders''',
        true,
      ) as List?;
}

class UpdateCartApiCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    int? id,
    int? partId,
    int? quantity,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'UpdateCart Api',
      apiUrl: 'https://hyundai.completechaintech.com/api/updateCart/${id}',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': 'Bearer ${token}',
        'Accept': 'application/json',
      },
      params: {
        'token': token,
        'id': id,
        'part_id': partId,
        'quantity': quantity,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic? detailsModel(dynamic response) => getJsonField(
        response,
        r'''$.car''',
      );
  static String? performanceModel(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.car.performance''',
      ));
  static List? carsSlider(dynamic response) => getJsonField(
        response,
        r'''$.car.car_sliders''',
        true,
      ) as List?;
}

class VehicleApiCall {
  static Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'VehicleApi',
      apiUrl: 'https://hyundai.completechaintech.com/api/vehicle',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
        'Accept': 'application/json',
      },
      params: {
        'token': token,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class ServiceTypeApiCall {
  static Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'ServiceTypeApi',
      apiUrl: 'https://hyundai.completechaintech.com/api/serviceType',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
        'Accept': 'application/json',
      },
      params: {
        'token': token,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class DeliveryPricesApiCall {
  static Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'deliveryPrices Api',
      apiUrl: 'https://hyundai.completechaintech.com/api/deliveryPrices',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
        'Accept': 'application/json',
      },
      params: {
        'token': token,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetAddressApiCall {
  static Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getAddressApi',
      apiUrl: 'https://hyundai.completechaintech.com/api/address',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
        'Accept': 'application/json',
      },
      params: {
        'token': token,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetPaymentStatusApiCall {
  static Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getPaymentStatusApi',
      apiUrl: 'https://hyundai.completechaintech.com/api/paymentStatus',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
        'Accept': 'application/json',
      },
      params: {
        'token': token,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetMyOrderApiCall {
  static Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getMyOrderApi',
      apiUrl: 'https://hyundai.completechaintech.com/api/myOrder',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
        'Accept': 'application/json',
      },
      params: {
        'token': token,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetMyAppointmentApiCall {
  static Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getMyAppointmentApi',
      apiUrl: 'https://hyundai.completechaintech.com/api/myAppointment',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
        'Accept': 'application/json',
      },
      params: {
        'token': token,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetPaymentIdApiCall {
  static Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getPaymentIdApi',
      apiUrl: 'https://hyundai.completechaintech.com/api/payment',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
        'Accept': 'application/json',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class AddAddressApiCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? name = '',
    String? email = '',
    String? phone = '',
    int? cityId,
    String? streetAddress = '',
    int? buildingNumber,
  }) async {
    final ffApiRequestBody = '''
{
"name": "${name}",
"email": "${email}",
"phone": "${phone}",
"city_id": ${cityId},
"street_address": "${streetAddress}",
"building_number": ${buildingNumber}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'addAddressApi',
      apiUrl: 'https://hyundai.completechaintech.com/api/address',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
        'Accept': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class CashOnDeliveryApiCall {
  static Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'cashOnDeliveryApi',
      apiUrl: 'https://hyundai.completechaintech.com/api/CashonDelivery',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
        'Accept': 'application/json',
      },
      params: {},
      bodyType: BodyType.NONE,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class AddCouponApiCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? couponCode = '',
  }) async {
    final ffApiRequestBody = '''
{
  "coupon_code": "${couponCode}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'addCouponApi',
      apiUrl: 'https://hyundai.completechaintech.com/api/addCoupon',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
        'Accept': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class RemoveCouponApiCall {
  static Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'removeCouponApi',
      apiUrl: 'https://hyundai.completechaintech.com/api/removeCoupon',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
        'Accept': 'application/json',
      },
      params: {},
      bodyType: BodyType.NONE,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
