import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/ui_screens/components/hynday_app_bar/hynday_app_bar_widget.dart';
import '/ui_screens/components/modal06_basic_information/modal06_basic_information_widget.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'shipping_address_page_model.dart';
export 'shipping_address_page_model.dart';

class ShippingAddressPageWidget extends StatefulWidget {
  const ShippingAddressPageWidget({Key? key}) : super(key: key);

  @override
  _ShippingAddressPageWidgetState createState() =>
      _ShippingAddressPageWidgetState();
}

class _ShippingAddressPageWidgetState extends State<ShippingAddressPageWidget>
    with TickerProviderStateMixin {
  late ShippingAddressPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'columnOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 100.ms,
          duration: 500.ms,
          begin: Offset(0, 650),
          end: Offset(0, 0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ShippingAddressPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.apiResult5ds = await DeliveryPricesApiCall.call(
        token: FFAppState().userModel.token,
      );
      if ((_model.apiResult5ds?.succeeded ?? true)) {
        setState(() {
          _model.listOfLocalDeliveryPriceModels = functions
              .convertFromJsonListToAddressListModels(getJsonField(
            (_model.apiResult5ds?.jsonBody ?? ''),
            r'''$.deliveryPrices''',
          ))
              .toList()
              .cast<DeliveryPriceModelStruct>();
        });
      }
      _model.apiResultqwk = await GetAddressApiCall.call(
        token: FFAppState().userModel.token,
      );
      if ((_model.apiResultqwk?.succeeded ?? true)) {
        setState(() {
          _model.addressModel = getJsonField(
            (_model.apiResultqwk?.jsonBody ?? ''),
            r'''$.address''',
          ) !=
              null &&
              getJsonField(
                (_model.apiResultqwk?.jsonBody ?? ''),
                r'''$.address''',
              ) !=
                  ''
              ? AddressModelStruct.fromMap(getJsonField(
            (_model.apiResultqwk?.jsonBody ?? ''),
            r'''$.address''',
          ))
              : null;
        });
        setState(() {
          _model.textController1?.text = (_model.addressModel?.name != null &&
              _model.addressModel?.name != ''
              ? _model.addressModel!.name
              : FFAppState().userModel.name);
        });
        setState(() {
          _model.textController2?.text = (_model.addressModel?.email != null &&
              _model.addressModel?.email != ''
              ? _model.addressModel!.email
              : FFAppState().userModel.email);
        });
        setState(() {
          _model.textController3?.text = (_model.addressModel?.phone != null &&
              _model.addressModel?.phone != ''
              ? _model.addressModel!.phone
              : FFAppState().userModel.phone);
        });
        setState(() {
          _model.textController4?.text =
          (_model.addressModel?.streetAddress != null &&
              _model.addressModel?.streetAddress != ''
              ? _model.addressModel!.streetAddress
              : '-');
        });
        setState(() {
          _model.textController5?.text =
          (_model.addressModel?.buildingNumber != null
              ? _model.addressModel!.buildingNumber.toString()
              : '-');
        });
        setState(() {
          _model.selectedCityModelString = functions
              .getCityModelById(_model.listOfLocalDeliveryPriceModels.toList(),
              _model.addressModel?.id != null ? _model.addressModel!.id : 0)
              .name;
        });
      }
    });

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();

    _model.textController3 ??= TextEditingController();
    _model.textFieldFocusNode3 ??= FocusNode();

    _model.textController4 ??= TextEditingController();
    _model.textFieldFocusNode4 ??= FocusNode();

    _model.textController5 ??= TextEditingController();
    _model.textFieldFocusNode5 ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).white,
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 150, 0, 0),
                  child: Stack(
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, 1.0),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                decoration: BoxDecoration(),
                                child: Stack(
                                  alignment: AlignmentDirectional(0, 1),
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5, 0, 5, 0),
                                      child: Material(
                                        color: Colors.transparent,
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(0),
                                            bottomRight: Radius.circular(0),
                                            topLeft: Radius.circular(20),
                                            topRight: Radius.circular(20),
                                          ),
                                        ),
                                        child: Container(
                                          width: double.infinity,
                                          height: 30,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFC1D6EF),
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(0),
                                              bottomRight: Radius.circular(0),
                                              topLeft: Radius.circular(20),
                                              topRight: Radius.circular(20),
                                            ),
                                            border: Border.all(
                                              color: Color(0xFFC1D6EF),
                                              width: 0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              50, 0, 50, 0),
                                          child: ClipRRect(
                                            borderRadius:
                                            BorderRadius.circular(0),
                                            child: SvgPicture.asset(
                                              'assets/images/Group_71544.svg',
                                              width: 250,
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 1.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5, 0, 5, 0),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFC1D6EF),
                                      borderRadius: BorderRadius.circular(0),
                                      border: Border.all(
                                        color: Color(0xFFC1D6EF),
                                      ),
                                    ),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                30, 20, 30, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'm24x7hjn' /* Shipping Address */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                      context)
                                                      .bodyMedium
                                                      .override(
                                                    fontFamily: 'HeeboBold',
                                                    color:
                                                    Color(0xFF092853),
                                                    fontSize: 16,
                                                    fontWeight:
                                                    FontWeight.bold,
                                                    useGoogleFonts: false,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Opacity(
                                            opacity: 0.8,
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(30, 20, 30, 0),
                                              child:
                                              FlutterFlowDropDown<String>(
                                                controller: _model
                                                    .dropDownValueController ??=
                                                    FormFieldController<String>(
                                                        null),
                                                options: _model
                                                    .listOfLocalDeliveryPriceModels
                                                    .map((e) => e.name)
                                                    .toList(),
                                                onChanged: (val) async {
                                                  setState(() => _model
                                                      .dropDownValue = val);
                                                  setState(() {
                                                    _model.selectedCityModelString =
                                                    _model.dropDownValue!;
                                                  });
                                                },
                                                width: double.infinity,
                                                textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium,
                                                hintText: _model
                                                    .selectedCityModelString,
                                                icon: Icon(
                                                  Icons.arrow_drop_down,
                                                  color: FlutterFlowTheme.of(
                                                      context)
                                                      .secondaryText,
                                                  size: 24,
                                                ),
                                                fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .white,
                                                elevation: 2,
                                                borderColor: Color(0xFF646464),
                                                borderWidth: 1,
                                                borderRadius: 8,
                                                margin: EdgeInsetsDirectional
                                                    .fromSTEB(16, 4, 16, 4),
                                                hidesUnderline: true,
                                                isSearchable: false,
                                                isMultiSelect: false,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                30, 20, 30, 0),
                                            child: TextFormField(
                                              controller:
                                              _model.textController1,
                                              focusNode:
                                              _model.textFieldFocusNode1,
                                              textInputAction:
                                              TextInputAction.next,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelText:
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'n66nkzcb' /* Your Name Here */,
                                                ),
                                                labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium,
                                                hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium,
                                                enabledBorder:
                                                OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0xFF646464),
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                  BorderRadius.circular(8),
                                                ),
                                                focusedBorder:
                                                OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0xFF646464),
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                  BorderRadius.circular(8),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                        context)
                                                        .error,
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                  BorderRadius.circular(8),
                                                ),
                                                focusedErrorBorder:
                                                OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                        context)
                                                        .error,
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                  BorderRadius.circular(8),
                                                ),
                                                filled: true,
                                                fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .white,
                                              ),
                                              style:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium,
                                              validator: _model
                                                  .textController1Validator
                                                  .asValidator(context),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                30, 20, 30, 0),
                                            child: TextFormField(
                                              controller:
                                              _model.textController2,
                                              focusNode:
                                              _model.textFieldFocusNode2,
                                              textInputAction:
                                              TextInputAction.next,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelText:
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'fxfuisg9' /* Email */,
                                                ),
                                                labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium,
                                                hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium,
                                                enabledBorder:
                                                OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0xFF646464),
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                  BorderRadius.circular(8),
                                                ),
                                                focusedBorder:
                                                OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0xFF646464),
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                  BorderRadius.circular(8),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                        context)
                                                        .error,
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                  BorderRadius.circular(8),
                                                ),
                                                focusedErrorBorder:
                                                OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                        context)
                                                        .error,
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                  BorderRadius.circular(8),
                                                ),
                                                filled: true,
                                                fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .white,
                                              ),
                                              style:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium,
                                              keyboardType:
                                              TextInputType.emailAddress,
                                              validator: _model
                                                  .textController2Validator
                                                  .asValidator(context),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                30, 20, 30, 0),
                                            child: TextFormField(
                                              controller:
                                              _model.textController3,
                                              focusNode:
                                              _model.textFieldFocusNode3,
                                              textInputAction:
                                              TextInputAction.next,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelText:
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'wizto9iw' /* Phone Number */,
                                                ),
                                                labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium,
                                                hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium,
                                                enabledBorder:
                                                OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0xFF646464),
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                  BorderRadius.circular(8),
                                                ),
                                                focusedBorder:
                                                OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0xFF646464),
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                  BorderRadius.circular(8),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                        context)
                                                        .error,
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                  BorderRadius.circular(8),
                                                ),
                                                focusedErrorBorder:
                                                OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                        context)
                                                        .error,
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                  BorderRadius.circular(8),
                                                ),
                                                filled: true,
                                                fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .white,
                                              ),
                                              style:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium,
                                              keyboardType: TextInputType.phone,
                                              validator: _model
                                                  .textController3Validator
                                                  .asValidator(context),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                30, 20, 30, 0),
                                            child: TextFormField(
                                              controller:
                                              _model.textController4,
                                              focusNode:
                                              _model.textFieldFocusNode4,
                                              textInputAction:
                                              TextInputAction.next,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelText:
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'ickq9vgb' /* Street Address */,
                                                ),
                                                labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium,
                                                hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium,
                                                enabledBorder:
                                                OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0xFF646464),
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                  BorderRadius.circular(8),
                                                ),
                                                focusedBorder:
                                                OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0xFF646464),
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                  BorderRadius.circular(8),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                        context)
                                                        .error,
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                  BorderRadius.circular(8),
                                                ),
                                                focusedErrorBorder:
                                                OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                        context)
                                                        .error,
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                  BorderRadius.circular(8),
                                                ),
                                                filled: true,
                                                fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .white,
                                              ),
                                              style:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium,
                                              keyboardType:
                                              TextInputType.streetAddress,
                                              validator: _model
                                                  .textController4Validator
                                                  .asValidator(context),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                30, 20, 30, 0),
                                            child: TextFormField(
                                              controller:
                                              _model.textController5,
                                              focusNode:
                                              _model.textFieldFocusNode5,
                                              textInputAction:
                                              TextInputAction.done,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelText:
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'y6n4rs3m' /* Building Number */,
                                                ),
                                                labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium,
                                                hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium,
                                                enabledBorder:
                                                OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0xFF646464),
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                  BorderRadius.circular(8),
                                                ),
                                                focusedBorder:
                                                OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0xFF646464),
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                  BorderRadius.circular(8),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                        context)
                                                        .error,
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                  BorderRadius.circular(8),
                                                ),
                                                focusedErrorBorder:
                                                OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                        context)
                                                        .error,
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                  BorderRadius.circular(8),
                                                ),
                                                filled: true,
                                                fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .white,
                                              ),
                                              style:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium,
                                              keyboardType:
                                                  TextInputType.number,
                                              validator: _model
                                                  .textController5Validator
                                                  .asValidator(context),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                30, 30.5, 30, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              children: [
                                                Builder(
                                                  builder: (context) =>
                                                      FFButtonWidget(
                                                        onPressed: () async {
                                                          _model.apiResultdip =
                                                          await AddAddressApiCall
                                                              .call(
                                                            token: FFAppState()
                                                                .userModel
                                                                .token,
                                                            name: _model
                                                                .textController1
                                                                .text,
                                                            email: _model
                                                                .textController2
                                                                .text,
                                                            phone: _model
                                                                .textController3
                                                                .text,
                                                            cityId: functions
                                                                .getCityModelByName(
                                                                _model
                                                                    .listOfLocalDeliveryPriceModels
                                                                    .toList(),
                                                                _model
                                                                    .selectedCityModelString)
                                                                .id,
                                                            streetAddress: _model
                                                                .textController4
                                                                .text,
                                                            buildingNumber:
                                                            int.tryParse(_model
                                                                .textController5
                                                                .text),
                                                          );
                                                          if ((_model.apiResultdip
                                                              ?.succeeded ??
                                                              true)) {
                                                            context.pushNamed(
                                                              'CartSummaryPage',
                                                              extra: <String,
                                                                  dynamic>{
                                                                kTransitionInfoKey:
                                                                TransitionInfo(
                                                                  hasTransition:
                                                                  true,
                                                                  transitionType:
                                                                  PageTransitionType
                                                                      .leftToRight,
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                      50),
                                                                ),
                                                              },
                                                            );
                                                          } else {
                                                            await showAlignedDialog(
                                                              context: context,
                                                              isGlobal: true,
                                                              avoidOverflow: false,
                                                              targetAnchor:
                                                              AlignmentDirectional(
                                                                  0, 0)
                                                                  .resolve(
                                                                  Directionality.of(
                                                                      context)),
                                                              followerAnchor:
                                                              AlignmentDirectional(
                                                                  0, 0)
                                                                  .resolve(
                                                                  Directionality.of(
                                                                      context)),
                                                              builder:
                                                                  (dialogContext) {
                                                                return Material(
                                                                  color: Colors
                                                                      .transparent,
                                                                  child:
                                                                  GestureDetector(
                                                                    onTap: () => _model
                                                                        .unfocusNode
                                                                        .canRequestFocus
                                                                        ? FocusScope.of(
                                                                        context)
                                                                        .requestFocus(_model
                                                                        .unfocusNode)
                                                                        : FocusScope.of(
                                                                        context)
                                                                        .unfocus(),
                                                                    child:
                                                                    Modal06BasicInformationWidget(
                                                                      body: (_model
                                                                          .apiResultdip
                                                                          ?.bodyText ??
                                                                          ''),
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            ).then((value) =>
                                                                setState(() {}));
                                                          }

                                                          setState(() {});
                                                        },
                                                        text: FFLocalizations.of(
                                                            context)
                                                            .getText(
                                                          'zwca6rlo' /* Next */,
                                                        ),
                                                        options: FFButtonOptions(
                                                          height: 40,
                                                          padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                              50, 0, 50, 0),
                                                          iconPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                              0, 0, 0, 0),
                                                          color:
                                                          FlutterFlowTheme.of(
                                                              context)
                                                              .ahayundai,
                                                          textStyle:
                                                          FlutterFlowTheme.of(
                                                              context)
                                                              .titleSmall
                                                              .override(
                                                            fontFamily:
                                                            'Poppins',
                                                            color: Colors
                                                                .white,
                                                          ),
                                                          borderSide: BorderSide(
                                                            color:
                                                            Colors.transparent,
                                                            width: 1,
                                                          ),
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                        ),
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ].addToEnd(SizedBox(height: 50)),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ).animateOnPageLoad(
                            animationsMap['columnOnPageLoadAnimation']!),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      wrapWithModel(
                        model: _model.hyndayAppBarModel,
                        updateCallback: () => setState(() {}),
                        child: HyndayAppBarWidget(
                          appBarTitle:
                          FFLocalizations.of(context).getVariableText(
                            enText: 'Checkout',
                            arText: 'الدفع',
                          ),
                          isMyProfileOpend: false,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
