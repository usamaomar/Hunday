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
    'auqle7ga': {
      'en': 'Sign Up',
      'ar': 'اذا اشترك الأن',
    },
    't5xax01h': {
      'en': 'Home',
      'ar': '',
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
      'ar': 'اقسام المحل',
    },
    '8io5q1kq': {
      'en': 'Services',
      'ar': 'خدمات',
    },
    'qts15g7r': {
      'en': 'Car model',
      'ar': 'متجر قطع ',
    },
    '2xlj2tf9': {
      'en': 'Locations',
      'ar': 'مناطق البيع',
    },
    'xifs34ig': {
      'en': 'Monthly offers',
      'ar': 'العروض الشهريه',
    },
    'rncq54oc': {
      'en': 'News',
      'ar': 'الاخبار',
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
  // CarPage
  {
    '4zgsyvj7': {
      'en': 'No content to show',
      'ar': 'لا يوجد محتوى لعرضه',
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
    'op7kr558': {
      'en': 'Completed',
      'ar': 'مكتمل',
    },
    'hm2t9tw7': {
      'en': 'Canceled',
      'ar': 'ألغيت',
    },
    '6iiztaf5': {
      'en': 'Requested',
      'ar': 'مطلوب',
    },
    'qutb036t': {
      'en': 'No :',
      'ar': 'رقم :',
    },
    'f5yq1ofa': {
      'en': 'Hello',
      'ar': 'رقم :',
    },
    'sfxncixb': {
      'en':
          'Duralast Platinum AGM Battery BCI Group Size 47 680 CCA H5-AGMDuralast Platinum AGM Battery BCI Group Size 47 680 CCA H5-AGM',
      'ar': 'رقم :',
    },
    '6zvxe8ov': {
      'en': 'Total :',
      'ar': 'المجموع :',
    },
    'klnf67ip': {
      'en': '100 JOD',
      'ar': 'رقم :',
    },
    't0yzh5p8': {
      'en': '100 JOD',
      'ar': 'رقم :',
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
      'en': 'Enable fingerprint',
      'ar': 'تمكين بصمة الإصبع',
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
      'ar': 'عادي',
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
  // RegularPage
  {
    '5oq745lc': {
      'en': 'Option 1',
      'ar': '',
    },
    '4r4p2eo4': {
      'en': 'Service Type',
      'ar': 'نوع الخدمة',
    },
    'ccv24fw3': {
      'en': 'Search for an item...',
      'ar': '',
    },
    'p8vf7yb6': {
      'en': 'Option 1',
      'ar': '',
    },
    '8cjlzw3f': {
      'en': 'Car Model/License Plate',
      'ar': 'نموذج السيارة/لوحة الترخيص',
    },
    'w6qzjk15': {
      'en': 'Search for an item...',
      'ar': '',
    },
    '9dpoz9s7': {
      'en': 'Vin Number',
      'ar': 'رقم المركبة',
    },
    'qexjtbr5': {
      'en': 'Date',
      'ar': 'تاريخ',
    },
    'az7khk5l': {
      'en': 'Time',
      'ar': 'تاريخ',
    },
    'x53lp7sx': {
      'en': 'Book Now',
      'ar': 'احجز الآن',
    },
    'lrhvbju2': {
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
      'en': 'Car Model/License Plate',
      'ar': 'نموذج السيارة/لوحة الترخيص',
    },
    'scxw8d5x': {
      'en': 'Search for an item...',
      'ar': '',
    },
    'iiexjpsx': {
      'en': 'Vin Number',
      'ar': 'رقم المركبة',
    },
    'ugnvc90c': {
      'en': 'Date',
      'ar': 'تاريخ',
    },
    '5mnf1zjp': {
      'en': 'Time',
      'ar': 'تاريخ',
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
  // ChatPage
  {
    'y2ok92y7': {
      'en': 'No content to show',
      'ar': 'لا يوجد محتوى لعرضه',
    },
  },
  // CartPage
  {
    'wj7mlkzj': {
      'en': 'No content to show',
      'ar': 'لا يوجد محتوى لعرضه',
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
      'ar': 'ملف الشخصي',
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
    'ni09c8q4': {
      'en': 'Owner Name',
      'ar': 'اسم المالك',
    },
    'to0sa4cw': {
      'en': '',
      'ar': '',
    },
    'mcl5jxqb': {
      'en': 'Address',
      'ar': 'عنوان',
    },
    '2kcb6rjt': {
      'en': '',
      'ar': '',
    },
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
      'en': 'Car Catedory',
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
    'wokz9wj7': {
      'en': 'Car Color',
      'ar': 'لون السيارة',
    },
    'dfqt325v': {
      'en': '',
      'ar': '',
    },
    'fgn805t4': {
      'en': 'Year of Manufacturing',
      'ar': 'سنة التصنيع',
    },
    'qveofh35': {
      'en': 'Registered Until',
      'ar': 'مسجل حتى',
    },
    'inti40rk': {
      'en': 'Plate Number',
      'ar': 'رقم لوحة',
    },
    'o2hm26dg': {
      'en': '',
      'ar': '',
    },
    'f7qr92bp': {
      'en': 'Registration Number',
      'ar': 'رقم التسجيل',
    },
    'edmm0k4l': {
      'en': '',
      'ar': '',
    },
    'py8x535l': {
      'en': 'VIN Number',
      'ar': 'رقم المركبة',
    },
    'ydf9otge': {
      'en': '',
      'ar': '',
    },
    'nwqbaqum': {
      'en': 'Engine Number',
      'ar': 'رقم المحرك',
    },
    'sb3bt8mg': {
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
      'en': 'Fule Type',
      'ar': 'نوع فول',
    },
    'c1jll0cs': {
      'en': 'Option 1',
      'ar': '',
    },
    'vw2ha60o': {
      'en': 'Search for an item...',
      'ar': '',
    },
    'op6qsa7d': {
      'en': 'Insurance Company',
      'ar': 'شركة التأمين',
    },
    '1894vfo9': {
      'en': '',
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
      'ar': 'طلبي',
    },
    'c4hbd3hr': {
      'en': 'My Appointment',
      'ar': 'تعييني',
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
    '3q1ra16p': {
      'en': '120 JOD',
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
      'ar': 'أضف أداة جديدة',
    },
    'iyhucrh1': {
      'en': '120 JOD',
      'ar': '',
    },
    '9hdw3ji1': {
      'en': 'Duralast Platinum AGM Battery',
      'ar': '',
    },
    'x461zs9f': {
      'en': '1',
      'ar': '',
    },
    'g0l0qlnf': {
      'en': 'Total',
      'ar': 'المجموع',
    },
    'zpmto5eg': {
      'en': '500',
      'ar': 'عربتك',
    },
    'qpf5wtpv': {
      'en': 'Proceed To Checkout',
      'ar': 'الشروع في الخروج',
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
  // NewsBottomSheetComponentLoading
  {
    'w0ul9775': {
      'en': '',
      'ar': '',
    },
    '48mrpk4y': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent pharetra augue accumsan aliquam tincidunt.',
      'ar': '',
    },
    'ie2txc6w': {
      'en': 'More',
      'ar': 'المزيد',
    },
    'jfuvt7am': {
      'en': '15 May 2023',
      'ar': '',
    },
    's2s256ev': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent pharetra augue accumsan aliquam tincidunt.',
      'ar': '',
    },
    'qlpynpqb': {
      'en': 'More',
      'ar': 'المزيد',
    },
    'zpvkykzr': {
      'en': '15 May 2023',
      'ar': '',
    },
    'cd833pnp': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent pharetra augue accumsan aliquam tincidunt.',
      'ar': '',
    },
    '4cajia55': {
      'en': 'More',
      'ar': 'المزيد',
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
      'ar': 'يحفظ',
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
      'ar': 'متحرك',
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
      'ar': 'يرسل',
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
      'ar': 'يحفظ',
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
      'ar': 'يحفظ',
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
