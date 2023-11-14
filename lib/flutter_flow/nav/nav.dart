import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '/backend/schema/structs/index.dart';

import '/index.dart';
import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  bool showSplashImage = true;

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) => SplashPageWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => SplashPageWidget(),
        ),
        FFRoute(
          name: 'loginScreen',
          path: '/loginScreen',
          builder: (context, params) => LoginScreenWidget(),
        ),
        FFRoute(
          name: 'registraationPage',
          path: '/registraationPage',
          builder: (context, params) => RegistraationPageWidget(),
        ),
        FFRoute(
          name: 'HomeScreen',
          path: '/homeScreen',
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'HomeScreen')
              : NavBarPage(
                  initialPage: 'HomeScreen',
                  page: HomeScreenWidget(),
                ),
        ),
        FFRoute(
          name: 'ShopPage',
          path: '/shopPage',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: ShopPageWidget(),
          ),
        ),
        FFRoute(
          name: 'splashPage',
          path: '/splashPage',
          builder: (context, params) => SplashPageWidget(),
        ),
        FFRoute(
          name: 'CarPage',
          path: '/carPage',
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'CarPage')
              : NavBarPage(
                  initialPage: 'CarPage',
                  page: CarPageWidget(),
                ),
        ),
        FFRoute(
          name: 'AboutAppPage',
          path: '/aboutAppPage',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: AboutAppPageWidget(),
          ),
        ),
        FFRoute(
          name: 'CarModelPage',
          path: '/carModelPage',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: CarModelPageWidget(),
          ),
        ),
        FFRoute(
          name: 'MyProfilePage',
          path: '/myProfilePage',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: MyProfilePageWidget(),
          ),
        ),
        FFRoute(
          name: 'PersonalInformationPage',
          path: '/personalInformationPage',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: PersonalInformationPageWidget(),
          ),
        ),
        FFRoute(
          name: 'EditProfilePage',
          path: '/editProfilePage',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: EditProfilePageWidget(),
          ),
        ),
        FFRoute(
          name: 'MyOrderPage',
          path: '/myOrderPage',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: MyOrderPageWidget(),
          ),
        ),
        FFRoute(
          name: 'NewsPage',
          path: '/newsPage',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: NewsPageWidget(),
          ),
        ),
        FFRoute(
          name: 'NewsDetailsPage',
          path: '/newsDetailsPage',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: NewsDetailsPageWidget(
              itemIndex: params.getParam('itemIndex', ParamType.int),
              itemId: params.getParam('itemId', ParamType.String),
            ),
          ),
        ),
        FFRoute(
          name: 'EditPasswordPage',
          path: '/editPasswordPage',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: EditPasswordPageWidget(),
          ),
        ),
        FFRoute(
          name: 'SettingsPage',
          path: '/settingsPage',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: SettingsPageWidget(),
          ),
        ),
        FFRoute(
          name: 'MaintenancePage',
          path: '/maintenancePage',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: MaintenancePageWidget(),
          ),
        ),
        FFRoute(
          name: 'RegularPage',
          path: '/regularPage',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: RegularPageWidget(),
          ),
        ),
        FFRoute(
          name: 'RepairPage',
          path: '/repairPage',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: RepairPageWidget(),
          ),
        ),
        FFRoute(
          name: 'ShopDetailsPage',
          path: '/shopDetailsPage',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: ShopDetailsPageWidget(),
          ),
        ),
        FFRoute(
          name: 'ItemDetailsPage',
          path: '/itemDetailsPage',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: ItemDetailsPageWidget(),
          ),
        ),
        FFRoute(
          name: 'LocationPage',
          path: '/locationPage',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: LocationPageWidget(),
          ),
        ),
        FFRoute(
          name: 'OffersPage',
          path: '/offersPage',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: OffersPageWidget(),
          ),
        ),
        FFRoute(
          name: 'OffersDetailsPage',
          path: '/offersDetailsPage',
          builder: (context, params) => OffersDetailsPageWidget(
            itemIndex: params.getParam('itemIndex', ParamType.int),
          ),
        ),
        FFRoute(
          name: 'CarModelDetails',
          path: '/carModelDetails',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: CarModelDetailsWidget(
              carJsonItem: params.getParam('carJsonItem', ParamType.JSON),
            ),
          ),
        ),
        FFRoute(
          name: 'CarModelDetailsMore',
          path: '/carModelDetailsMore',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: CarModelDetailsMoreWidget(
              carJsonItem: params.getParam('carJsonItem', ParamType.JSON),
            ),
          ),
        ),
        FFRoute(
          name: 'CarModelDetailsMoreWithSlieder',
          path: '/carModelDetailsMoreWithSlieder',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: CarModelDetailsMoreWithSliederWidget(
              carJsonItem: params.getParam('carJsonItem', ParamType.JSON),
            ),
          ),
        ),
        FFRoute(
          name: 'ChatPage',
          path: '/chatPage',
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'ChatPage')
              : NavBarPage(
                  initialPage: 'ChatPage',
                  page: ChatPageWidget(),
                ),
        ),
        FFRoute(
          name: 'CartPage',
          path: '/cartPage',
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'CartPage')
              : NavBarPage(
                  initialPage: 'CartPage',
                  page: CartPageWidget(),
                ),
        ),
        FFRoute(
          name: 'MorePage',
          path: '/morePage',
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'MorePage')
              : NavBarPage(
                  initialPage: 'MorePage',
                  page: MorePageWidget(),
                ),
        ),
        FFRoute(
          name: 'CarModelDetailsPdfViewr',
          path: '/carModelDetailsPdfViewr',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: CarModelDetailsPdfViewrWidget(
              pdfLink: params.getParam('pdfLink', ParamType.String),
            ),
          ),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.extraMap.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, [
    bool isList = false,
  ]) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        pageBuilder: (context, state) {
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder: PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).transitionsBuilder,
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouter.of(context).location;
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}
