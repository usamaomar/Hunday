import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/ui_screens/components/bottom_nav_bar_component/bottom_nav_bar_component_widget.dart';
import '/ui_screens/components/hynday_app_bar/hynday_app_bar_widget.dart';
import '/ui_screens/components/shop_list_item_component/shop_list_item_component_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'shop_page_widget.dart' show ShopPageWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ShopPageModel extends FlutterFlowModel<ShopPageWidget> {
  ///  Local state fields for this page.

  List<ShopListItemModelStruct> localListOfItemsShop = [];
  void addToLocalListOfItemsShop(ShopListItemModelStruct item) =>
      localListOfItemsShop.add(item);
  void removeFromLocalListOfItemsShop(ShopListItemModelStruct item) =>
      localListOfItemsShop.remove(item);
  void removeAtIndexFromLocalListOfItemsShop(int index) =>
      localListOfItemsShop.removeAt(index);
  void insertAtIndexInLocalListOfItemsShop(
          int index, ShopListItemModelStruct item) =>
      localListOfItemsShop.insert(index, item);
  void updateLocalListOfItemsShopAtIndex(
          int index, Function(ShopListItemModelStruct) updateFn) =>
      localListOfItemsShop[index] = updateFn(localListOfItemsShop[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for HyndayAppBar component.
  late HyndayAppBarModel hyndayAppBarModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Models for ShopListItemComponent dynamic component.
  late FlutterFlowDynamicModels<ShopListItemComponentModel>
      shopListItemComponentModels;
  // Model for BottomNavBarComponent component.
  late BottomNavBarComponentModel bottomNavBarComponentModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    hyndayAppBarModel = createModel(context, () => HyndayAppBarModel());
    shopListItemComponentModels =
        FlutterFlowDynamicModels(() => ShopListItemComponentModel());
    bottomNavBarComponentModel =
        createModel(context, () => BottomNavBarComponentModel());
  }

  void dispose() {
    unfocusNode.dispose();
    hyndayAppBarModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    shopListItemComponentModels.dispose();
    bottomNavBarComponentModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
