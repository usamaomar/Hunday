import 'dart:io';

import 'package:flutter/foundation.dart';

class InAppPaymentSetting {
  // shopperResultUrl : this name must like scheme in intent-filter , url scheme in xcode
  // static const String shopperResultUrl= "com.mycompany.hyundai?json=109";
  static const String shopperResultUrl= "myapp://test.com/";
  // static const String merchantId= "8a8294174d0595bb014d05d829cb01cd";
  static const String countryCode="JO";
  static getLang() {
    if (Platform.isIOS) {
      return  "en"; // ar
    } else {
      return "en_US"; // ar_AR
    }
  }
}