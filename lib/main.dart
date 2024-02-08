import 'dart:async';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hyundai/backend/schema/structs/index.dart';
import 'package:hyundai/ui_screens/components/customs/CustomNavs.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/flutter_flow_timer.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/internationalization.dart';
import 'flutter_flow/nav/nav.dart';
import 'index.dart';
import 'dart:io' show Platform;
import 'package:redux/redux.dart';
import 'package:badges/badges.dart' as badges;

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage? message) async {
  try {
    showNotification(message);
  } catch (ex) {
    ex.toString();
  }
}

void showNotification(RemoteMessage? message) async {
  try {
    await Firebase.initializeApp();
    FlutterLocalNotificationsPlugin? fltNotification;
    var androidInit = AndroidInitializationSettings('@mipmap/ic_launcher');
    var iosInit = const DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );
    var initSetting =
        InitializationSettings(android: androidInit, iOS: iosInit);
    fltNotification = FlutterLocalNotificationsPlugin();
    fltNotification.initialize(initSetting);
    await fltNotification.cancelAll();
    if (message?.notification?.title != null &&
        message?.notification?.body != null) {
      var androidDetails = const AndroidNotificationDetails(
          'channelId', 'channelName',
          icon: "");
      var iosDetails = DarwinNotificationDetails(
        presentAlert: true,
        presentBadge: true,
        presentSound: true,
        subtitle: message?.notification?.title,
      );
      var generalNotificationDetails =
          NotificationDetails(android: androidDetails, iOS: iosDetails);
      await fltNotification.show(0, '${message?.notification?.title}',
          message?.notification?.body, generalNotificationDetails,
          payload: 'Notification');
      FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
        print("onMessageOpenedApp");
        Map<String, dynamic> value = {'id': 'ooosaaamaaa'};
        // _router.pushNamed('notificationPage',extra:value);
        scaffoldKey.currentState
            ?.pushNamed('notificationPage', arguments: value);
      });
    }
  } catch (ex) {
    ex.toString();
  }
}

final scaffoldKey = GlobalKey<NavigatorState>();

dynamic counterReducer(dynamic state, dynamic storeEventValue) {
  String storeEvent = storeEventValue;
  return storeEvent;
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appState = FFAppState();
  stateCase(true);
  usePathUrlStrategy();

  if (Platform.isIOS) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBXCycCdO_1va9JT98V_gAeXi6_S9szxYg",
            appId: "1:779673897933:ios:5905b34966b0810185d284",
            messagingSenderId: "779673897933",
            projectId: "com.comc.hyundai"));
  } else {
    await Firebase.initializeApp();
  }

  await appState.initializePersistedState().then((value) => {});
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await FlutterFlowTheme.initialize();
  initPushNotifications();
  final store = Store<dynamic>(counterReducer, initialState: String);

  runApp(ChangeNotifierProvider(
    create: (context) => appState,
    child: MyApp(
      store: store,
    ),
  ));
}

void stateCase(bool isLive) {
  if (isLive) {
    FFAppState().stateCaseModel = StateCaseModelStruct(
        baseUrl: 'https://trade-hyundaijo.com', isLive: isLive);
  } else {
    FFAppState().stateCaseModel = StateCaseModelStruct(
        baseUrl: 'https://hyundai.completechaintech.com', isLive: isLive);
  }
}

Future initPushNotifications() async {
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true, badge: true, sound: true);
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

  final Store store;

  MyApp({required this.store});

  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;
  late AppStateNotifier _appStateNotifier;
  late GoRouter _router;
  FlutterLocalNotificationsPlugin? fltNotification;

  @override
  void initState() {
    handleInAppMessage();

    FirebaseMessaging.instance.getToken().then((fbToken) {
      FFAppState().FCM = fbToken ?? 'null';
    });
    initMessaging();
    super.initState();

    _appStateNotifier = AppStateNotifier.instance..setStore(widget.store);
    _router = createRouter(_appStateNotifier);
  }

  void handleInAppMessage() {
    FirebaseMessaging.instance.getInitialMessage().then((message) => {
          if (message != null)
            {
              print("getInitialMessage"),
              _firebaseMessagingInAppHandler(message)
            }
        });
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("onMessage");
      _firebaseMessagingInAppHandler(message);
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print("onMessageOpenedApp");
      handleMessage(message);
    });
  }

  void handleMessage(RemoteMessage? message) {
    Map<String, dynamic> value = {'id': 'ooosaaamaaa'};
    _router.pushNamed('notificationPage', extra: value);
    scaffoldKey.currentState?.pushNamed('notificationPage', arguments: value);
  }

  Future<void> runs(RemoteMessage? message) async {
    try {
      if (message != null &&
          message.data['body'] != null &&
          message.data['title'] != null) {
        _firebaseMessagingInAppHandler(message);
      }
    } catch (ex) {
      ex.toString();
    }
  }

  Future<void> _firebaseMessagingInAppHandler(RemoteMessage message) async {
    try {
      if (message.notification != null &&
          message.notification?.title != null &&
          message.notification?.body != null) {
        FFAppState().addToLocalNotificationLost(NotificationModelStruct(
            title: '',
            body: '',
            isClicked: false,
            date: getCurrentDate(),
            time: getCurrentTime()));
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
            message.notification?.body, generalNotificationDetails,
            payload: 'Notification');
      }
    } catch (ex) {
      ex.toString();
    }
  }

  void initMessaging() async {
    try {
      var androidInit = AndroidInitializationSettings('@mipmap/ic_launcher');
      var iosInit = const DarwinInitializationSettings(
        requestAlertPermission: true,
        requestBadgePermission: true,
        requestSoundPermission: true,
      );
      var initSetting =
          InitializationSettings(android: androidInit, iOS: iosInit);
      fltNotification = FlutterLocalNotificationsPlugin();
      fltNotification?.initialize(initSetting,
          onDidReceiveNotificationResponse: onDidReceiveNotificationResponse);
    } catch (ex) {
      ex.toString();
    }
  }

  void onDidReceiveNotificationResponse(dynamic notificationResponse) async {
    Map<String, dynamic> value = {'id': 'ooosaaamaaa'};
    _router.pushNamed('notificationPage', extra: value);
    scaffoldKey.currentState?.pushNamed('notificationPage', arguments: value);
  }

  void setLocale(String language) {
    setState(() => _locale = createLocale(language));
  }

  void setThemeMode(ThemeMode mode) => setState(() {
        FlutterFlowTheme.saveThemeMode(mode);
      });

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return StoreProvider<dynamic>(
      store: widget.store,
      child: MaterialApp.router(
        key: scaffoldKey,
        title: 'hyundai',
        localizationsDelegates: const [
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
        // themeMode: _themeMode,
        themeMode: ThemeMode.light,
        routerConfig: _router,
      ),
    );
  }
}

class NavBarPage extends StatefulWidget {
  NavBarPage(
      {Key? key,
      this.initialPage,
      this.page,
      this.updateBadgeValue,
      this.store})
      : super(key: key);

  final String? initialPage;
  final Widget? page;
  final Function()? updateBadgeValue;
  Store? store;

  @override
  _NavBarPageState createState() => _NavBarPageState();
}

/// This is the private State class that goes with NavBarPage.
class _NavBarPageState extends State<NavBarPage> with WidgetsBindingObserver {
  String _currentPageName = 'HomeScreen';
  late Widget? _currentPage;
  int count = 0;
  Timer? _timer;
  late FlutterFlowTimerController timerController;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
    _currentPageName = widget.initialPage ?? _currentPageName;
    _currentPage = widget.page;
    count = FFAppState().badgeCount;
    // startTime();
  }

  startTime() async {
    Timer.periodic(Duration(seconds: 2), (timer) {
      updateCount();
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);

    super.dispose();
  }

  int timerMilliseconds = 6000;

  void updateCount() {
    // setState(() {
    //   count = FFAppState().badgeCount;
    // });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      // updateCount();
    }
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
      body: SafeArea(
        top: false,
        bottom: true,
        child: MediaQuery(
            data: queryData
                .removeViewInsets(removeBottom: true)
                .removeViewPadding(removeBottom: true),
            child: _currentPage ?? tabs[_currentPageName]!),
      ),
      extendBody: true,
      bottomNavigationBar: CustomNavs(
        currentIndex: currentIndex,
        onTap: (i) => setState(() {
          _currentPage = null;
          _currentPageName = tabs.keys.toList()[i];
          count = FFAppState().badgeCount;
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
            icon: Stack(
              children: [
                StoreConnector<dynamic, dynamic>(
                  distinct: true,
                  converter: (store) => store.state,
                  builder: (context, storeEvent) {
                    return badges.Badge(
                      badgeStyle: badges.BadgeStyle(padding: EdgeInsets.all(5)),
                      badgeAnimation: badges.BadgeAnimation.scale(),
                      badgeContent: Text(
                        '${FFAppState().badgeCount}',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                      child: SvgPicture.asset(
                        'assets/images/Group_70661.svg',
                        width: 20.0,
                        height: 20.0,
                        fit: BoxFit.contain,
                      ),
                    );
                  },
                )
              ],
            ),
          ),
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
