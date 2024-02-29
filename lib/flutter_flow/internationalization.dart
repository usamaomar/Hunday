import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'ar'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? arText = '',
  }) =>
      [enText, arText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // loginScreen
  {
    'jhn8bmqs': {
      'en': 'Login',
      'ar': 'تسجيل',
    },
    'okssl': {
      'en': 'Unlock the full experience! Please log in to access exclusive features',
      'ar': 'فتح التجربة الكاملة! يرجى تسجيل الدخول للوصول إلى الميزات الحصرية',
    },
    'ia2zdqa6': {
      'en': 'Welcome to Hyundai',
      'ar': 'مرحبا بكم في هيونداي',
    },
    'stnutt99': {
      'en': '',
      'ar': '',
    },
    'nf01u1yj': {
      'en': 'Password',
      'ar': 'كلمة السر',
    },
    'x7qgrwbk': {
      'en': '',
      'ar': '',
    },
    '5uqvx4l6': {
      'en': 'Forgot Password?',
      'ar': 'نسيت كلمه السر',
    },
    '4akeqapx': {
      'en': 'Login',
      'ar': 'تسجيل الدخول',
    },
    'n5n9jw4q': {
      'en': 'Already have an account?  ',
      'ar': 'هل لديك حساب؟  ',
    },
    'n5n9ddjw4q': {
      'en': 'Press here to login using your saved biometrics',
      'ar': 'اضغط هنا لأستخدام بصمة الاصبع',
    },
    'auqle7ga': {
      'en': 'Sign Up',
      'ar': 'انضم الينا',
    },
    't5xax01h': {
      'en': 'Home',
      'ar': '',
    },
    'c2pz80f3': {
      'en': 'we would like to take biometric as login',
      'ar': 'نود أن نأخذ القياسات الحيوية لتسجيل الدخول',
    },
  },
  // registraationPage
  {
    'oba5wz92': {
      'en': 'Sign Up',
      'ar': 'تسجيل',
    },
    'ui88c5fh': {
      'en': 'Welcome to Hyundai',
      'ar': 'مرحبا بكم في هيونداي',
    },
    'rj0wbgbg': {
      'en': 'at least begin with letter',
      'ar': 'على الأقل تبدأ بالحرف',
    },
    'z0kh61i4': {
      'en': '',
      'ar': '',
    },
    '6zaw2uxi': {
      'en': 'Email',
      'ar': 'البريد الاكتروني',
    },
    's7fl3d67': {
      'en': '',
      'ar': '',
    },
    'x9clt4nt': {
      'en': 'Invalid Email Address',
      'ar': 'عنوان البريد الإلكتروني غير صالح',
    },
    'ylfefilo': {
      'en': 'Invalid Phone Number',
      'ar': 'رقم الهاتف غير صحيح',
    },
    '6a79dl98': {
      'en': 'Male',
      'ar': 'ذكر',
    },
    '8tmgnkrr': {
      'en': 'Female',
      'ar': 'انثى',
    },
    '1ok3uuc1': {
      'en': 'Gender',
      'ar': 'الجنس',
    },
    '8fg3dd47': {
      'en': 'Search for an item...',
      'ar': '',
    },
    'sxhbvk0f': {
      'en': 'Password Mismatch',
      'ar': 'عدم تطابق كلمة المرور',
    },
    'd8f3cwvn': {
      'en': 'Create Account',
      'ar': 'إنشاء حساب',
    },
    '6cxadh9k': {
      'en': 'Home',
      'ar': '',
    },
  },
  // HomeScreen
  {
    '0pq4i1m3': {
      'en': 'Parts Shop',
      'ar': 'متجر قطع الغيار',
    },
    '8io5q1kq': {
      'en': 'Services',
      'ar': 'خدمات الصيانة',
    },
    'qts15g7r': {
      'en': 'Car model',
      'ar': 'موديلات المركبات ',
    },
    '2xlj2tf9': {
      'en': 'Locations',
      'ar': 'مواقعنا',
    },
    'xifs34ig': {
      'en': 'Monthly offers',
      'ar': 'اخر العروض',
    },
    'rncq54oc': {
      'en': 'News',
      'ar': 'اخر الاخبار',
    },
    'x8otlfzl': {
      'en': '',
      'ar': '',
    },
  },
  // ShopPage
  {
    'u7s8q71f': {
      'en': 'Search...',
      'ar': 'البحث...',
    },
    'r9bql2qs': {
      'en': 'Home',
      'ar': '',
    },
  },
  // splashPage
  {
    '7b3yfalm': {
      'en': 'Home',
      'ar': '',
    },
  },
  // AboutAppPage
  {
    'ccaswkvd': {
      'en': 'About App',
      'ar': 'حول التطبيق',
    },
    's2jkoquf': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent pharetra augue accumsan aliquam tincidunt. Aenean eu elit et nunc scelerisque rutrum in sed tellus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nam nec eleifend est, in euismod felis. Sed pulvinar risus quis felis sodales, a faucibus leo iaculis. Quisque vitae mauris ut mi semper volutpat.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent pharetra augue accumsan aliquam tincidunt. Aenean eu elit et nunc scelerisque rutrum in sed tellus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nam nec eleifend est, in euismod felis. Sed pulvinar risus quis felis sodales, a faucibus leo iaculis. Quisque vitae mauris ut mi semper volutpat.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent pharetra augue accumsan aliquam tincidunt. Aenean eu elit et nunc scelerisque rutrum in sed tellus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nam nec eleifend est, in euismod felis. Sed pulvinar risus quis felis sodales, a faucibus leo iaculis. Quisque vitae mauris ut mi semper volutpat.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent pharetra augue accumsan aliquam tincidunt. Aenean eu elit et nunc scelerisque rutrum in sed tellus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nam nec eleifend est, in euismod felis. Sed pulvinar risus quis felis sodales, a faucibus leo iaculis. Quisque vitae mauris ut mi semper volutpat.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent pharetra augue accumsan aliquam tincidunt. Aenean eu elit et nunc scelerisque rutrum in sed tellus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nam nec eleifend est, in euismod felis. Sed pulvinar risus quis felis sodales, a faucibus leo iaculis. Quisque vitae mauris ut mi semper volutpat.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent pharetra augue accumsan aliquam tincidunt. Aenean eu elit et nunc scelerisque rutrum in sed tellus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nam nec eleifend est, in euismod felis. Sed pulvinar risus quis felis sodales, a faucibus leo iaculis. Quisque vitae mauris ut mi semper volutpat.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent pharetra augue accumsan aliquam tincidunt. Aenean eu elit et nunc scelerisque rutrum in sed tellus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nam nec eleifend est, in euismod felis. Sed pulvinar risus quis felis sodales, a faucibus leo iaculis. Quisque vitae mauris ut mi semper volutpat.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent pharetra augue accumsan aliquam tincidunt. Aenean eu elit et nunc scelerisque rutrum in sed tellus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nam nec eleifend est, in euismod felis. Sed pulvinar risus quis felis sodales, a faucibus leo iaculis. Quisque vitae mauris ut mi semper volutpat.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent pharetra augue accumsan aliquam tincidunt. Aenean eu elit et nunc scelerisque rutrum in sed tellus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nam nec eleifend est, in euismod felis. Sed pulvinar risus quis felis sodales, a faucibus leo iaculis. Quisque vitae mauris ut mi semper volutpat.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent pharetra augue accumsan aliquam tincidunt. Aenean eu elit et nunc scelerisque rutrum in sed tellus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nam nec eleifend est, in euismod felis. Sed pulvinar risus quis felis sodales, a faucibus leo iaculis. Quisque vitae mauris ut mi semper volutpat.',
      'ar': '',
    },
    'dfqxrl8y': {
      'en': 'Home',
      'ar': '',
    },
  },
  // CarModelPage
  {
    '9ybgd254': {
      'en': 'Home',
      'ar': '',
    },
  },
  // MyProfilePage
  {
    'g8y2etl1': {
      'en': 'Personal Information',
      'ar': 'معلومات شخصية',
    },
    '59whv50y': {
      'en': 'Reset Password',
      'ar': 'إعادة تعيين كلمة المرور',
    },
    '1808e521': {
      'en': 'My Vehicles',
      'ar': 'مركباتي',
    },
    'q0tybub2': {
      'en': 'Logout',
      'ar': 'تسجيل خروج',
    },
    'fzdj439r': {
      'en': 'Home',
      'ar': '',
    },
  },
  // PersonalInformationPage
  {
    'wc6fd6q0': {
      'en': 'Personal Information',
      'ar': 'معلومات شخصية',
    },
    '9lib3jj8': {
      'en': 'Name',
      'ar': 'الاسم',
    },
    '479vu35o': {
      'en': 'Email',
      'ar': 'البريد الألكتروني',
    },
    'z7ln3s0h': {
      'en': 'Phone Number',
      'ar': 'رقم الهاتف',
    },
    'tl9k7w8d': {
      'en': 'Home',
      'ar': '',
    },
  },
  // EditProfilePage
  {
    '0ot0fqwj': {
      'en': 'Edit Profile',
      'ar': 'تعديل الملف الشخصي',
    },
    '4wy32pc5': {
      'en': '',
      'ar': 'البحث...',
    },
    'gyvl0k6r': {
      'en': '',
      'ar': 'البحث...',
    },
    '9ug6mtde': {
      'en': '',
      'ar': 'البحث...',
    },
    'xbberk0c': {
      'en': 'Save',
      'ar': 'حفظ',
    },
    '0ngiecrx': {
      'en': 'Home',
      'ar': '',
    },
  },
  // MyOrderPage
  {
    '4uv784pe': {
      'en': 'Completed',
      'ar': 'مكتمل',
    },
    'ow6mnw00': {
      'en': 'No :',
      'ar': 'رقم :',
    },
    'lyiy9dln': {
      'en': 'Total :',
      'ar': 'المجموع :',
    },
    'bt7eplas': {
      'en': 'Cancled',
      'ar': 'ملغى',
    },
    '4511l167': {
      'en': 'No :',
      'ar': 'رقم :',
    },
    's989ymiy': {
      'en': 'Total :',
      'ar': 'المجموع :',
    },
    '6rbqvu50': {
      'en': 'Requested',
      'ar': 'مطلوب',
    },
    'wimhgt37': {
      'en': 'No :',
      'ar': 'رقم :',
    },
    'wb9dvh64': {
      'en': 'Total :',
      'ar': 'المجموع :',
    },
    '2m4xuvht': {
      'en': 'Home',
      'ar': '',
    },
  },
  // NewsPage
  {
    'buiei7e4': {
      'en': 'Home',
      'ar': '',
    },
  },
  // NewsDetailsPage
  {
    't37vk1vy': {
      'en': 'Home',
      'ar': '',
    },
  },
  // EditPasswordPage
  {
    'bfuzctld': {
      'en': 'Edit Password',
      'ar': 'تعديل كلمة السر',
    },
    '86cmjy7m': {
      'en': 'Old Password',
      'ar': 'كلمة السر القديمة',
    },
    '12fz7gae': {
      'en': 'New Password',
      'ar': 'كلمة السر الجديدة',
    },
    'vuuexi7y': {
      'en': 'Save',
      'ar': 'حفظ',
    },
    't4527qge': {
      'en': 'Home',
      'ar': '',
    },
  },
  // SettingsPage
  {
    'av01m895': {
      'en': 'Settings',
      'ar': 'الأعدادات',
    },
    '6tp1dk3s': {
      'en': 'English',
      'ar': 'الانجليزية',
    },
    's66g1rxi': {
      'en': 'Arabic',
      'ar': 'العربية',
    },
    'icx7hoih': {
      'en': 'Languge',
      'ar': 'اللغة',
    },
    'zt3rwd0w': {
      'en': 'Search for an item...',
      'ar': '',
    },
    'ue3obsq6': {
      'en': 'App Version',
      'ar': 'نسخة التطبيق',
    },
    '8muh1h1k': {
      'en': '3.8.10',
      'ar': '3.8.10',
    },
    'rf3peq4r': {
      'en': 'Dark mode',
      'ar': 'الوضع الليلي',
    },
    'gup13knb': {
      'en': 'Enable Biometric',
      'ar': 'تمكين القياسات الحيوية',
    },
    '6yklnh8p': {
      'en': 'app is requesting your finger print ',
      'ar': 'التطبيق يطلب بصمة إصبعك',
    },
    'zgpc70uw': {
      'en': 'Terms And Conditions',
      'ar': 'الأحكام والشروط',
    },
    'kuzu2j3c': {
      'en': 'Read More',
      'ar': 'اقرأ أكثر',
    },
    'yu6oaebt': {
      'en': 'Home',
      'ar': '',
    },
  },
  // MaintenancePage
  {
    'g4qrl71e': {
      'en': 'Choose Your Requested Maintenance',
      'ar': 'اختر الصيانة المطلوبة',
    },
    '1x66u28j': {
      'en': 'Regular',
      'ar': 'صيانة دورية',
    },
    'xdtk43lc': {
      'en': 'Repair',
      'ar': 'اصلاح',
    },
    '3ce8lahi': {
      'en': 'Home',
      'ar': '',
    },
  },
  // RepairPage
  {
    '1fj9ttrv': {
      'en': 'Option 1',
      'ar': '',
    },
    'v3cn7fl3': {
      'en': 'License Plate',
      'ar': 'رقم اللوحة / موديل المركبة',
    },
    'scxw8d5x': {
      'en': 'Search for an item...',
      'ar': '',
    },
    'yqkqi4qe': {
      'en': 'Details ...',
      'ar': 'تفاصيل ...',
    },
    'q4gc7rvw': {
      'en': 'Book Now',
      'ar': 'احجز الآن',
    },
    '43r92x1o': {
      'en': 'Home',
      'ar': '',
    },
  },
  // ItemDetailsPage
  {
    'ck6fuofr': {
      'en': 'Weight (Kg)',
      'ar': 'الوزن (كجم)',
    },
    '83ihzfx7': {
      'en': 'Length (mm)',
      'ar': 'الطول (مم)',
    },
    'h86tnhha': {
      'en': 'Width (mm)',
      'ar': 'العرض (مم)',
    },
    'km3ujc8c': {
      'en': 'Model Year',
      'ar': 'سنة الصنع',
    },
    'hesmbsvo': {
      'en': 'Hello World',
      'ar': '',
    },
    'awj659y0': {
      'en': 'Model',
      'ar': 'نموذج',
    },
    'lcbpx0vq': {
      'en': 'Add to Cart',
      'ar': 'اضافة الى السلة',
    },
    'xmzqjzbt': {
      'en': 'Home',
      'ar': '',
    },
  },
  // LocationPage
  {
    'shs8tnad': {
      'en': 'Home',
      'ar': '',
    },
  },
  // OffersPage
  {
    '9zgu400x': {
      'en': 'Home',
      'ar': '',
    },
  },
  // OffersDetailsPage
  {
    'g6x2pbik': {
      'en': 'Share',
      'ar': 'مشاركة',
    },
    'guoi6rgz': {
      'en': 'Call Now',
      'ar': 'اتصل الان',
    },
    'a8s2x5fj': {
      'en': 'Home',
      'ar': '',
    },
  },
  // CarModelDetails
  {
    'd75dh9y9': {
      'en': 'Details',
      'ar': 'تفاصيل',
    },
    'qhwrowev': {
      'en': 'Home',
      'ar': '',
    },
  },
  // CarModelDetailsMore
  {
    'qjt5bf8n': {
      'en': 'Description',
      'ar': 'وصف',
    },
    'tcjczaa0': {
      'en': 'Specifications >>',
      'ar': 'المواصفات >>',
    },
    'sj7f1zjw': {
      'en': 'Catalog',
      'ar': 'فهرس',
    },
    'hw8gasge': {
      'en': 'Book a test drive',
      'ar': 'احجز تجربة قيادة',
    },
    'yjokpnbb': {
      'en': 'Home',
      'ar': '',
    },
  },
  // CarModelDetailsMoreWithSlieder
  {
    'z1s82dpt': {
      'en': 'Description',
      'ar': 'وصف',
    },
    '9rfbujwq': {
      'en': 'Specifications >>',
      'ar': 'المواصفات >>',
    },
    'ca7jaj1r': {
      'en': 'Catalog',
      'ar': 'فهرس',
    },
    'kgthw2vc': {
      'en': 'Book a test drive',
      'ar': 'احجز تجربة قيادة',
    },
    '6vo4oqd8': {
      'en': 'Home',
      'ar': '',
    },
  },
  // MorePage
  {
    'p6oewnbh': {
      'en': 'Menu',
      'ar': 'القائمة',
    },
    'gn9dd2uh': {
      'en': 'My Profile',
      'ar': 'ملفي الشخصي',
    },
    'zsl2n2ki': {
      'en': 'My Orders',
      'ar': 'طلباتي',
    },
    'f87dmor3': {
      'en': 'My Appointment',
      'ar': 'مواعيدي',
    },
    'g406osl6': {
      'en': 'About App',
      'ar': 'عن التطبيق',
    },
    '2jxn0p4u': {
      'en': 'Notification',
      'ar': 'إشعاراتي',
    },
    'rtfhfshd': {
      'en': 'Settings',
      'ar': 'اعدادات',
    },
  },
  // CarModelDetailsPdfViewr
  {
    'wmsoocl8': {
      'en': 'Home',
      'ar': '',
    },
  },
  // RegularPage
  {
    '3vciz0fa': {
      'en': 'Option 1',
      'ar': '',
    },
    'atzmlm1q': {
      'en': 'Service Type',
      'ar': 'نوع الخدمة',
    },
    'mj3jmnh7': {
      'en': 'Search for an item...',
      'ar': '',
    },
    'kbyps9c2': {
      'en': 'Option 1',
      'ar': '',
    },
    '3jd0kk0r': {
      'en': 'Car Model / License Plate',
      'ar': 'رقم اللوحه/ موديل المركبه',
    },
    'exh9lqzu': {
      'en': 'Search for an item...',
      'ar': '',
    },
    'j3282cea': {
      'en': 'Book Now',
      'ar': 'احجز الآن',
    },
    '2ubt6fvn': {
      'en': 'Home',
      'ar': '',
    },
  },
  // ShippingAddressPage
  {
    'm24x7hjn': {
      'en': 'Shipping Address',
      'ar': 'عنوان الشحن',
    },
    'ur6wydsk': {
      'en': 'Search for an item...',
      'ar': '',
    },
    'n66nkzcb': {
      'en': 'Your Name Here',
      'ar': 'اسمك هنا',
    },
    'fxfuisg9': {
      'en': 'Email',
      'ar': 'بريد إلكتروني',
    },
    'wizto9iw': {
      'en': 'Phone Number',
      'ar': 'رقم التليفون',
    },
    'ickq9vgb': {
      'en': 'Street Address',
      'ar': 'عنوان الشارع',
    },
    'y6n4rs3m': {
      'en': 'Building Number',
      'ar': 'رقم المبنى',
    },
    'zwca6rlo': {
      'en': 'Next',
      'ar': 'التالي',
    },
    'i6l65ykt': {
      'en': 'Home',
      'ar': '',
    },
  },
  // CartSummaryPage
  {
    '6xd0p129': {
      'en': 'Cart Summary',
      'ar': 'ملخص العربة',
    },
    'rfsw40l6': {
      'en': 'Discounted item—no additional coupons apply',
      'ar': 'منتج مخفض - لا تنطبق كوبونات إضافية',
    },
    'w5s8atya': {
      'en': 'Discount Code',
      'ar': 'رمز قسيمة الخصم',
    },
    'afzcb7rj': {
      'en': 'Add Coupon',
      'ar': 'أضف رمز القسيمة',
    },
    'e4uz6sgz': {
      'en': 'Invalid Coupon Code',
      'ar': 'رقم قسيمه غير صالح',
    },
    'dzu6yv39': {
      'en': 'Apply coupon',
      'ar': 'تطبيق القسيمة',
    },
    'fq044a94': {
      'en': 'Discount Code',
      'ar': 'الرقم التسلسلي للخصم',
    },
    'bgg33jaj': {
      'en': 'Coupon Code',
      'ar': 'رمز الكوبون',
    },
    'k2htpnfe': {
      'en': 'Discount',
      'ar': 'تخفيض',
    },
    'p2uap002': {
      'en': 'Remove Coupon',
      'ar': 'إزالة القسيمة',
    },
    'wj0lz5jr': {
      'en': 'Subtotal',
      'ar': 'المجموع الفرعي',
    },
    'ewcugq5a': {
      'en': 'Shipping Cost',
      'ar': 'تكلفة الشحن',
    },
    '2sx1fy0c': {
      'en': 'VAT/Tax',
      'ar': 'ضريبة المبيعات',
    },
    'qjum9ia7': {
      'en': 'Coupon',
      'ar': 'قسيمة',
    },
    '0gl4jwe1': {
      'en': 'Total Cost',
      'ar': 'التكلفة الإجمالية',
    },
    'qcfm77ue': {
      'en': 'Next',
      'ar': 'التالي',
    },
    'mnwe6l4v': {
      'en': 'Home',
      'ar': '',
    },
  },
  // MyAppointmentPage
  {
    'lmokc1fb': {
      'en': 'Completed',
      'ar': 'مكتمل',
    },
    '0hq0yfi8': {
      'en': 'No :',
      'ar': 'رقم :',
    },
    'wu913olh': {
      'en': 'Cancled',
      'ar': 'ملغى',
    },
    'cemww359': {
      'en': 'Requested',
      'ar': 'مطلوب',
    },
    'nydqvto1': {
      'en': 'Home',
      'ar': '',
    },
  },
  // MyVehiclesPage
  {
    '5ww6ldok': {
      'en': 'Add New Vehicles',
      'ar': 'إضافة مركبات جديدة',
    },
    'nbroyo6w': {
      'en': 'Vin . No',
      'ar': 'رقم الشاصي',
    },
    'o4jbzhjp': {
      'en': 'Plate . No',
      'ar': 'رقم . اللوحة',
    },
    '2nonl3qp': {
      'en': 'Details',
      'ar': 'تفاصيل',
    },
    'jjflr5eb': {
      'en': '',
      'ar': '',
    },
  },
  // MyVehiclesDetailsPage
  {
    'h5tps4y9': {
      'en': '-',
      'ar': '',
    },
    '0jhokdvo': {
      'en': 'Owner Name',
      'ar': 'اسم المالك',
    },
    'ttad25oy': {
      'en': 'Address',
      'ar': 'عنوان',
    },
    'snefw7t4': {
      'en': 'Car Type',
      'ar': 'موديل السيارة',
    },
    'u3gfgsq5': {
      'en': '-',
      'ar': 'رقم . اللوحة',
    },
    'wwqyjst1': {
      'en': 'Car Category',
      'ar': 'فئة السيارة',
    },
    'paplehe5': {
      'en': '-',
      'ar': 'رقم . اللوحة',
    },
    'pqh4aozw': {
      'en': 'Car Color',
      'ar': 'لون السيارة',
    },
    '1uf8k20q': {
      'en': ' Model year',
      'ar': 'سنة الصنع',
    },
    'chfp6y8s': {
      'en': 'Registered Until',
      'ar': 'مسجل لغاية',
    },
    '02vir69e': {
      'en': 'Plate Number',
      'ar': 'رقم المحرك',
    },
    'xnun2lk7': {
      'en': 'Engine Capacity',
      'ar': 'سعة المحرك',
    },
    'b24zprrk': {
      'en': 'Fuel Type',
      'ar': 'نوع الوقود',
    },
    'ul6rt32s': {
      'en': '-',
      'ar': 'رقم الشاصي',
    },
    'mxlgzph1': {
      'en': 'Registration Number',
      'ar': 'رقم التسجيل',
    },
    '7pcq4s78': {
      'en': 'Vin number',
      'ar': 'رقم الشاصي',
    },
    'lp1r5j5x': {
      'en': 'Engine Number',
      'ar': 'رقم المحرك',
    },
    'i9y7wmtv': {
      'en': 'Insurance Company',
      'ar': 'شركة التأمين',
    },
    'iettw4s8': {
      'en': 'Home',
      'ar': '',
    },
  },
  // SheckOutPagePage
  {
    'utnohcb9': {
      'en': 'Payment Method',
      'ar': 'طريقة الدفع او السداد',
    },
    'zc0zuzu7': {
      'en': 'Payment Gateway',
      'ar': 'بوابة الدفع',
    },
    'p8ns4vw1': {
      'en': 'Cash on Delivery',
      'ar': 'الدفع عند الاستلام',
    },
    'nmxvz08q': {
      'en': 'By clicking the button you agree to',
      'ar': 'الموافقة على الشروط والأحكام',
    },
    'c4kn7j9t': {
      'en': 'Terms & Conditions',
      'ar': 'رابط الشروط والأحكام',
    },
    '7cavw78u': {
      'en': 'Complete your purchase',
      'ar': 'اتمام عملية الشراء',
    },
    'ztueekub': {
      'en': 'Home',
      'ar': '',
    },
  },
  // NotificationPage
  {
    'msx02ztx': {
      'en': 'Home',
      'ar': '',
    },
  },
  // PaymentPagePage
  {
    'jso9ic4z': {
      'en': 'Pay Now',
      'ar': 'ادفع الآن',
    },
    '3iobzvz8': {
      'en': 'Label here...',
      'ar': 'رسالة ...',
    },
    'm0mdulr1': {
      'en': 'Pay Now',
      'ar': 'ادفع الآن',
    },
    'm07toug2': {
      'en': 'Home',
      'ar': '',
    },
  },
  // ChatInputComponent
  {
    'kxvtaikg': {
      'en': '',
      'ar': 'رسالة ...',
    },
    'u6fjtru6': {
      'en': 'Message ...',
      'ar': 'رسالة ...',
    },
    'iitztydi': {
      'en': 'Home',
      'ar': '',
    },
  },
  // startPage
  {
    'w66lu1y3': {
      'en':
          'If you are a Hyundai car owner Login, Sign up or continue as a guest',
      'ar': 'رخصة المركبة',
    },
    'tak69zzg': {
      'en': 'Login',
      'ar': 'تسجيل الدخول',
    },
    '0lrrev87': {
      'en': 'Sign Up',
      'ar': 'اشتراك',
    },
    '6po5rtz9': {
      'en': 'Continue as a guest',
      'ar': 'استمر كضيف',
    },
    'yblbzlly': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Fild
  {
    '12neuu73': {
      'en': '',
      'ar': '',
    },
    '0maaa2t2': {
      'en': '',
      'ar': '',
    },
  },
  // EditTextValues
  {
    'wj5qbvs4': {
      'en': '',
      'ar': '',
    },
    'cun8src4': {
      'en': '',
      'ar': '',
    },
  },
  // RegulerEditTextValues
  {
    '4c5o99dn': {
      'en': '',
      'ar': '',
    },
    'em4dg915': {
      'en': '',
      'ar': '',
    },
  },
  // VerifyBottomDialog
  {
    '8xe7ud21': {
      'en': 'Verify your phone number',
      'ar': '',
    },
    'a7wt5e6q': {
      'en': 'Check your sms and enter 4 digits code',
      'ar': 'تحقق من الرسائل القصيرة الخاصة بك وأدخل الرمز المكون من 4 أرقام',
    },
  },
  // EditTextValuesPassword
  {
    'da36j1l5': {
      'en': '',
      'ar': '',
    },
    'jn87cmya': {
      'en': '',
      'ar': '',
    },
  },
  // forgetPasswordComponent
  {
    '50yxbv27': {
      'en': 'Forget Password',
      'ar': 'نسيت كلمة السر',
    },
    '621mrpxx': {
      'en': 'You will receive a code on your phone number for password reset',
      'ar': 'سوف تتلقى رمزًا على رقم هاتفك لإعادة تعيين كلمة المرور',
    },
    'oz0r4il2': {
      'en': '',
      'ar': '',
    },
    'utqibc5w': {
      'en': 'Phone Number',
      'ar': '',
    },
    '902lootp': {
      'en': 'Send',
      'ar': 'ارسال',
    },
  },
  // ScannedCardAnimationComponent
  {
    '3z8i1b9g': {
      'en':
          'Unleash possibilities with our app - seamlessly scan both sides of your driving license!',
      'ar':
          'أطلق العنان للإمكانيات من خلال تطبيقنا - قم بمسح جانبي رخصة القيادة الخاصة بك بسلاسة!',
    },
    '69fe1ieu': {
      'en': 'Scan Now',
      'ar': 'إفحص الآن',
    },
    '3vcezyv0': {
      'en': 'Choose from Gallery',
      'ar': 'اختر من المعرض',
    },
  },
  // ListOfStringItemsComponent
  {
    '6xtulesf': {
      'en': 'Car Type',
      'ar': 'نوع السيارة',
    },
    'j8fz13eu': {
      'en': 'Option 1',
      'ar': '',
    },
    'u8smlxxg': {
      'en': 'Search for an item...',
      'ar': '',
    },
    '5r2w1sdp': {
      'en': 'Car Category',
      'ar': 'فئة السيارة',
    },
    'hbc49vtj': {
      'en': 'Option 1',
      'ar': '',
    },
    '043onftn': {
      'en': 'Search for an item...',
      'ar': '',
    },
    'fgn805t4': {
      'en': 'Model year',
      'ar': 'سنة الصنع',
    },
    'qveofh35': {
      'en': 'Registered Until',
      'ar': 'مسجل لغاية',
    },
    'inti40rk': {
      'en': 'Plate Number',
      'ar': 'رقم اللوحة',
    },
    'o2hm26dg': {
      'en': '',
      'ar': '',
    },
    'py8x535l': {
      'en': 'VIN Number',
      'ar': 'رقم الشاصي',
    },
    'ydf9otge': {
      'en': '',
      'ar': '',
    },
    'g1uqeq5j': {
      'en': 'Engine Cpacity',
      'ar': 'سعة المحرك',
    },
    '188vcdas': {
      'en': '',
      'ar': '',
    },
    'acbq9clz': {
      'en': 'Fuel type',
      'ar': 'نوع الوقود',
    },
    'c1jll0cs': {
      'en': 'Option 1',
      'ar': '',
    },
    'vw2ha60o': {
      'en': 'Search for an item...',
      'ar': '',
    },
    'ndp3se3p': {
      'en': 'Save',
      'ar': 'حفظ',
    },
  },
  // HyndayAppBar
  {
    'nn9je08c': {
      'en': 'Message...',
      'ar': '',
    },
  },
  // MyOrdersAndAppointmentsComponent
  {
    'i3kbyih3': {
      'en': 'My Order',
      'ar': 'طلباتي',
    },
    'c4hbd3hr': {
      'en': 'My Appointment',
      'ar': 'مواعيدي',
    },
  },
  // NewsBottomSheetComponent
  {
    'bj6c5d55': {
      'en': 'More',
      'ar': 'المزيد',
    },
  },
  // AddComponentShopingDetails
  {
    'ebrw9fwu': {
      'en': 'Search by Name or Part Number',
      'ar': 'البحث بالاسم أو رقم القطعة',
    },
    'z8gmn5ek': {
      'en': 'Option 1',
      'ar': '',
    },
    'rt1i3fku': {
      'en': 'Car Model / License Plate',
      'ar': 'نموذج السيارة/لوحة الترخيص',
    },
    'b8235shm': {
      'en': 'Search for an item...',
      'ar': '',
    },
  },
  // CartBottomSheet
  {
    'xjep3rwe': {
      'en': 'Your Cart',
      'ar': 'عربتك',
    },
    'eqnxfwdp': {
      'en': 'Add New Item',
      'ar': 'اضف قطعة جديدة',
    },
    'g0l0qlnf': {
      'en': 'Total',
      'ar': 'المجموع',
    },
    'qpf5wtpv': {
      'en': 'Proceed To Checkout',
      'ar': 'استكمال الدفع',
    },
  },
  // Modal06BasicInformation
  {
    'p305q9up': {
      'en': 'Error',
      'ar': 'مشكلة في الخادم',
    },
    '5ayz050s': {
      'en': 'Cancel',
      'ar': 'انهاء',
    },
  },
  // PasswordEditTextValues
  {
    'ey5qh8z2': {
      'en': '',
      'ar': '',
    },
    '1afb5unb': {
      'en': '',
      'ar': '',
    },
  },
  // PhoneEditTextValues
  {
    'p6jmdg3b': {
      'en': '',
      'ar': '',
    },
    'jcuvrswu': {
      'en': '',
      'ar': '',
    },
  },
  // VerifyForgetPasswordBottomDialog
  {
    'x13100ln': {
      'en': 'Forget Password',
      'ar': 'نسيت كلمة المرور',
    },
    'ae0t356p': {
      'en': 'Check your sms and enter 4 digits code',
      'ar': 'تحقق من الرسائل القصيرة الخاصة بك وأدخل الرمز المكون من 4 أرقام',
    },
  },
  // resetPasswordComponent
  {
    'nqo6qsgz': {
      'en': 'Forget Password',
      'ar': 'نسيت كلمة السر',
    },
    'jqb0n3kk': {
      'en': '',
      'ar': '',
    },
    'yq2npxjx': {
      'en': 'New Password',
      'ar': 'كلمة المرور الجديدة',
    },
    '48pczr00': {
      'en': '',
      'ar': '',
    },
    'oqqu4z0b': {
      'en': 'Confirm New Password',
      'ar': 'تأكيد كلمة المرور الجديدة',
    },
    'hzhy9oyu': {
      'en': 'Save',
      'ar': 'حفظ',
    },
  },
  // carDeteailsComponents
  {
    'hbpd88lb': {
      'en': 'Technical Presentation',
      'ar': 'العرض الفني',
    },
    'khvo8lsz': {
      'en': 'Performance',
      'ar': 'أداء',
    },
    'lc6uwna8': {
      'en': 'Safety',
      'ar': 'أمان',
    },
    'vhxcox48': {
      'en': 'Interior',
      'ar': 'الداخلية',
    },
    'ekqa9og1': {
      'en': 'Exterior',
      'ar': 'الخارج',
    },
  },
  // testDriveComponent
  {
    'smmv6dor': {
      'en': 'Test Drive',
      'ar': 'اختبار القيادة',
    },
    'zy6luwtl': {
      'en': 'Name',
      'ar': 'اسم',
    },
    'j8gvjivm': {
      'en': 'Mobile',
      'ar': 'رقم الهاتف',
    },
    '2cld7qli': {
      'en': 'Notes',
      'ar': 'ملحوظات',
    },
    '1s87izjp': {
      'en': 'You will be contacted',
      'ar': 'سيتم الاتصال بك',
    },
    '4nqcrahs': {
      'en': 'Send',
      'ar': 'ارسال',
    },
  },
  // ScanNowCard
  {
    '2doxlyqt': {
      'en': 'Scan Now',
      'ar': 'إفحص الآن',
    },
    'f8ub7r14': {
      'en': 'Front Face',
      'ar': 'الوجه الأمامي',
    },
    '4mxuj11u': {
      'en': 'Scan',
      'ar': 'مسح',
    },
    '6unw2udt': {
      'en': 'Back Face',
      'ar': 'الوجه الخلفي',
    },
    '7gkzwtaa': {
      'en': 'Scan',
      'ar': 'مسح',
    },
    '2ksh7kyf': {
      'en': 'Save',
      'ar': 'حفظ',
    },
  },
  // FromGallerCard
  {
    's4gh60ui': {
      'en': 'Choose from Gallery',
      'ar': 'اختر من المعرض',
    },
    'vp1op5ww': {
      'en': 'Front Face',
      'ar': 'الوجه الأمامي',
    },
    'ssqteoc6': {
      'en': 'Choose File',
      'ar': 'اختر ملف',
    },
    'a029ysp7': {
      'en': 'Back Face',
      'ar': 'الوجه الخلفي',
    },
    's0cyrb39': {
      'en': 'Choose File',
      'ar': 'اختر ملف',
    },
    '2l3ucgna': {
      'en': 'Save',
      'ar': 'حفظ',
    },
  },
  // EmptyListComponent
  {
    'vgub0o34': {
      'en': 'No content to show',
      'ar': 'لا يوجد محتوى لعرضه',
    },
  },
  // ThankYouComponent
  {
    'v9l6ir1m': {
      'en': 'Thank you for your purchase',
      'ar': 'شكرا لك على الشراء',
    },
    'qik04uao': {
      'en': 'OK',
      'ar': 'نعم',
    },
  },
  // ratingComponent
  {
    'a78ezigy': {
      'en': 'Feedback',
      'ar': 'تقييم',
    },
    'prpj44fo': {
      'en': 'What is Your Rate?',
      'ar': 'ما هو تقييمك؟',
    },
    'c2rubek4': {
      'en': 'Text Here ...',
      'ar': 'النص هنا...',
    },
    '1uhf3p34': {
      'en': 'Save',
      'ar': 'حفظ',
    },
  },
  // DeleteAcctounComponent
  {
    'p2kvejv5': {
      'en': 'Delete Account',
      'ar': 'حذف الحساب',
    },
  },
  // AnimationCardTween
  {
    '7m6vzx4p': {
      'en': 'Vehicle License',
      'ar': 'رخصة المركبة',
    },
  },
  // Miscellaneous
  {
    '6hathkzr': {
      'en': 'Label here...',
      'ar': '',
    },
    'n8k9o3h8': {
      'en': '',
      'ar': '',
    },
    'qhq2f3uc': {
      'en': '',
      'ar': '',
    },
    'lm2t7vie': {
      'en': '',
      'ar': '',
    },
    '5ie0vk66': {
      'en': '',
      'ar': '',
    },
    'k08yr7o8': {
      'en': '',
      'ar': '',
    },
    'nwsdyiqa': {
      'en': '',
      'ar': '',
    },
    'bd1c640i': {
      'en': '',
      'ar': '',
    },
    '5y9uait3': {
      'en': '',
      'ar': '',
    },
    'vn54wel6': {
      'en': '',
      'ar': '',
    },
    '4p5wek7c': {
      'en': '',
      'ar': '',
    },
    'sp2j30ax': {
      'en': '',
      'ar': '',
    },
    '9zdyfal2': {
      'en': '',
      'ar': '',
    },
    'xfs5wuni': {
      'en': '',
      'ar': '',
    },
    'q11woosj': {
      'en': '',
      'ar': '',
    },
    'rmgdrxx9': {
      'en': '',
      'ar': '',
    },
    'p7xyunbf': {
      'en': '',
      'ar': '',
    },
    '6in56thc': {
      'en': '',
      'ar': '',
    },
    't720l5p9': {
      'en': '',
      'ar': '',
    },
    'rd98387h': {
      'en': '',
      'ar': '',
    },
    'dh17wocr': {
      'en': '',
      'ar': '',
    },
    '5qfm8glz': {
      'en': '',
      'ar': '',
    },
    'syteps6p': {
      'en': '',
      'ar': '',
    },
    '9zrvlc3t': {
      'en': '',
      'ar': '',
    },
    'se3ye2va': {
      'en': '',
      'ar': '',
    },
    'zocaqk3g': {
      'en': '',
      'ar': '',
    },
    'mpp5greu': {
      'en': '',
      'ar': '',
    },
  },
].reduce((a, b) => a..addAll(b));
