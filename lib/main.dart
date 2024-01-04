import 'dart:async';

import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/internationalization.dart';
import 'flutter_flow/nav/nav.dart';
import 'index.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage? message) async {
  try {
    if (message != null &&
        message.notification != null &&
        message.notification?.title != null &&
        message.notification?.body != null) {}
  } catch (ex) {
    ex.toString();
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  usePathUrlStrategy();

  final appState = FFAppState(); // Initialize FFAppState
  await appState.initializePersistedState();
  await FlutterFlowTheme.initialize();

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  runApp(ChangeNotifierProvider(
    create: (context) => appState,
    child: MyApp(),
  ));
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

  @override
  void initState() {
    FirebaseMessaging.instance.getToken().then((fbToken) {
      FFAppState().FCM = fbToken ?? 'null';
    });
    // initUniLinks();
    super.initState();

    _appStateNotifier = AppStateNotifier.instance;
    _router = createRouter(_appStateNotifier);
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
      'ChatPage': ChatPageWidget(),
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
          CustomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/Group_71272.svg',
              width: 20.0,
              height: 20.0,
              fit: BoxFit.contain,
            ),
          ),
          CustomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/Group_70661.svg',
              width: 20.0,
              height: 20.0,
              fit: BoxFit.contain,
            ),
            badgeCount: FFAppState().badgeCount ,
            showBadge: true
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
