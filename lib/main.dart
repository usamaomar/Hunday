import 'dart:async';

import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hyundai/backend/schema/structs/index.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/internationalization.dart';
import 'flutter_flow/nav/nav.dart';
import 'index.dart';
import 'dart:io' show Platform;

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage? message) async {
  try {
    if (message != null &&
        message.data != null &&
        message.data['body'] != null &&
        message.data['title'] != null) {
      // FFAppState().addToLocalNotificationLost(NotificationModelStruct(
      //     title: message.data['title'],
      //     body: message.data['body'],
      //     isClicked: false,
      //     date: getCurrentDate(),
      //     time: getCurrentTime()));
    }
  } catch (ex) {
    ex.toString();
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isIOS) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBXCycCdO_1va9JT98V_gAeXi6_S9szxYg",
            appId: "1:779673897933:ios:5905b34966b0810185d284",
            messagingSenderId: "779673897933",
            projectId: "com.comc.hyundai"));
  } else {
    await Firebase.initializeApp();
  }

  final appState = FFAppState(); // Initialize FFAppState
  await appState.initializePersistedState().then((value) => {
        FirebaseMessaging.onBackgroundMessage(
            _firebaseMessagingBackgroundHandler)
      });
  await FlutterFlowTheme.initialize();

  runApp(ChangeNotifierProvider(
    create: (context) => appState,
    child: MyApp(),
  ));
}

String getCurrentDate() {
  DateTime now = DateTime.now();
  String formattedDate = DateFormat('dd / MM / yyyy').format(now);
  return formattedDate;
}

// Method to return current time as "12 : 30 PM"
String getCurrentTime() {
  DateTime now = DateTime.now();
  String formattedTime = DateFormat('hh : mm a').format(now);
  return formattedTime;
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;
  ThemeMode _themeMode = FlutterFlowTheme.themeMode;
  late AppStateNotifier _appStateNotifier;
  late GoRouter _router;
  FlutterLocalNotificationsPlugin? fltNotification;
  GlobalKey<NavigatorState> scaffoldKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    handleInAppMessage();

    FirebaseMessaging.instance.getToken().then((fbToken) {
      FFAppState().FCM = fbToken ?? 'null';
    });
    initMessaging();
    super.initState();

    _appStateNotifier = AppStateNotifier.instance;
    _router = createRouter(_appStateNotifier);
  }

  void handleInAppMessage() {
    FirebaseMessaging.instance.getInitialMessage().then((message) => {
          if (message != null) {_firebaseMessagingInAppHandler(message)}
        });
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      _firebaseMessagingInAppHandler(message);
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      _firebaseMessagingInAppHandler(message);
    });
  }

  Future<void> _firebaseMessagingInAppHandler(RemoteMessage message) async {
    try {
      if (message.notification != null &&
          message.notification?.title != null &&
          message.notification?.body != null) {
        // FFAppState().addToLocalNotificationLost(NotificationModelStruct(
        //     title: message.data['title'],
        //     body: message.data['body'],
        //     isClicked: false,
        //     date: getCurrentDate(),
        //     time: getCurrentTime()));
        showNotification(message);
      }
    } catch (ex) {
      ex.toString();
    }
  }

  void showNotification(RemoteMessage message) async {
    try {
      if (message.notification?.title != null &&
          message.notification?.body != null) {
        var androidDetails =
            AndroidNotificationDetails('channelId', 'channelName', icon: "");
        var iosDetails = DarwinNotificationDetails(
          presentAlert: true,
          presentBadge: true,
          presentSound: true,
          subtitle: message.notification?.title,
        );
        var generalNotificationDetails =
            NotificationDetails(android: androidDetails, iOS: iosDetails);
        await fltNotification?.show(0, message.notification?.title,
            message.notification?.body, generalNotificationDetails,payload: 'Notification');
      }
    } catch (ex) {
      ex.toString();
    }
  }

  void initMessaging() async {
    try {
      var androidInit = AndroidInitializationSettings('@mipmap/ic_launcher');
      var iosInit = DarwinInitializationSettings(
        requestAlertPermission: true,
        requestBadgePermission: true,
        requestSoundPermission: true,
      );
      var initSetting =
          InitializationSettings(android: androidInit, iOS: iosInit);
      fltNotification = FlutterLocalNotificationsPlugin();
      fltNotification?.initialize(initSetting,
          onDidReceiveNotificationResponse: onDidReceiveNotificationResponse );
    } catch (ex) {
      ex.toString();
    }
  }

  void onDidReceiveNotificationResponse(dynamic notificationResponse) async {
    _router.pushNamed(
      'notificationPage'
    );
  }

  void setLocale(String language) {
    setState(() => _locale = createLocale(language));
  }

  void setThemeMode(ThemeMode mode) => setState(() {
        _themeMode = mode;
        FlutterFlowTheme.saveThemeMode(mode);
      });

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      key: scaffoldKey,
      title: 'hyundai',
      localizationsDelegates: [
        FFLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: _locale,
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
      ],
      theme: ThemeData(
        brightness: Brightness.light,
        scrollbarTheme: ScrollbarThemeData(),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scrollbarTheme: ScrollbarThemeData(),
      ),
      themeMode: _themeMode,
      routerConfig: _router,
    );
  }
}

class NavBarPage extends StatefulWidget {
  NavBarPage({Key? key, this.initialPage, this.page}) : super(key: key);

  final String? initialPage;
  final Widget? page;

  @override
  _NavBarPageState createState() => _NavBarPageState();
}

/// This is the private State class that goes with NavBarPage.
class _NavBarPageState extends State<NavBarPage> {
  String _currentPageName = 'HomeScreen';
  late Widget? _currentPage;

  @override
  void initState() {
    super.initState();
    _currentPageName = widget.initialPage ?? _currentPageName;
    _currentPage = widget.page;
  }

  @override
  Widget build(BuildContext context) {
    final tabs = {
      'HomeScreen': HomeScreenWidget(),
      // 'ChatPage': ChatPageWidget(),
      'CartPage': CartPageWidget(),
      'MyVehiclesPage': MyVehiclesPageWidget(),
      'MorePage': MorePageWidget(),
    };
    final currentIndex = _currentPageName.isEmpty
        ? 0
        : tabs.keys.toList().indexOf(_currentPageName);

    final MediaQueryData queryData = MediaQuery.of(context);

    return Scaffold(
      body: MediaQuery(
          data: queryData
              .removeViewInsets(removeBottom: true)
              .removeViewPadding(removeBottom: true),
          child: _currentPage ?? tabs[_currentPageName]!),
      extendBody: true,
      bottomNavigationBar: CustomNavigationBar(
        currentIndex: currentIndex,
        onTap: (i) => setState(() {
          _currentPage = null;
          _currentPageName = tabs.keys.toList()[i];
        }),
        items: [
          CustomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/Group_70668_(1).svg',
              width: 20.0,
              height: 20.0,
              fit: BoxFit.contain,
            ),
          ),
          // CustomNavigationBarItem(
          //   icon: SvgPicture.asset(
          //     'assets/images/Group_71272.svg',
          //     width: 20.0,
          //     height: 20.0,
          //     fit: BoxFit.contain,
          //   ),
          // ),
          CustomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/images/Group_70661.svg',
                width: 20.0,
                height: 20.0,
                fit: BoxFit.contain,
              ),
              badgeCount: FFAppState().badgeCount,
              showBadge: true),
          CustomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/Group_72107.svg',
              width: 20.0,
              height: 20.0,
              fit: BoxFit.contain,
            ),
          ),
          CustomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/Group_72269.svg',
              width: 20.0,
              height: 20.0,
              fit: BoxFit.contain,
            ),
          ),
        ],
        iconSize: 24.0,
        selectedColor: const Color(0xFF3D6398),
        strokeColor: const Color(0x30040307),
        unSelectedColor: const Color(0xFFB7B7B7),
        backgroundColor: Colors.white,
      ),
    );
  }
}


