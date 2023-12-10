import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/ui_screens/components/modal06_basic_information/modal06_basic_information_widget.dart';
import '/ui_screens/components/password_edit_text_values/password_edit_text_values_widget.dart';
import '/ui_screens/components/phone_edit_text_values/phone_edit_text_values_widget.dart';
import '/ui_screens/components/reguler_edit_text_values/reguler_edit_text_values_widget.dart';
import '/ui_screens/components/verify_bottom_dialog/verify_bottom_dialog_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'registraation_page_model.dart';
export 'registraation_page_model.dart';

class RegistraationPageWidget extends StatefulWidget {
  const RegistraationPageWidget({Key? key}) : super(key: key);

  @override
  _RegistraationPageWidgetState createState() =>
      _RegistraationPageWidgetState();
}

class _RegistraationPageWidgetState extends State<RegistraationPageWidget> {
  late RegistraationPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RegistraationPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.localIsPasswordConfirme = true;
      });
      _model.localEmailIsValid = true;
      _model.localPhoneNumberValid = true;
      _model.localNameValid = true;
      setState(() {
        _model.localDateOfBirth = FFLocalizations.of(context).getVariableText(
          enText: 'Date of Birth',
          arText: 'تاريخ الميلاد',
        );
      });
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {
          _model.textController?.text = FFLocalizations.of(context).getText(
            's7fl3d67' /*  */,
          );
        }));
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
        backgroundColor: FlutterFlowTheme.of(context).white,
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 33.0, 0.0, 0.0),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  alignment: AlignmentDirectional(0.00, -1.00),
                  image: Image.asset(
                    'assets/images/oness.png',
                  ).image,
                ),
                shape: BoxShape.rectangle,
              ),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(),
                    child: SingleChildScrollView(
                      primary: false,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 50.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SvgPicture.asset(
                                  'assets/images/Group_70060.svg',
                                  fit: BoxFit.none,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 36.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'oba5wz92' /* Sign Up */,
                                  ),
                                  style: TextStyle(
                                    fontFamily: 'Seagoe Ui Bold',
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'ui88c5fh' /* Welcome to Hyundai */,
                                  ),
                                  style: TextStyle(
                                    fontFamily: 'Seagoe Ui Bold',
                                    color: Color(0xFF3D6398),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                30.0, 30.0, 30.0, 5.0),
                            child: Stack(
                              children: [
                                wrapWithModel(
                                  model: _model.regulerEditTextValuesModel,
                                  updateCallback: () => setState(() {}),
                                  child: RegulerEditTextValuesWidget(
                                    titleahint: FFLocalizations.of(context)
                                        .getVariableText(
                                      enText: 'Name',
                                      arText: 'الأسم',
                                    ),
                                    isErrorColor: valueOrDefault<Color>(
                                      _model.localNameValid == true
                                          ? Color(0x00FFFFFF)
                                          : FlutterFlowTheme.of(context).error,
                                      Color(0x000FFFFF),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5.0, 15.0, 5.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      if (_model.localNameValid == false)
                                        AlignedTooltip(
                                          content: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      5.0, 10.0, 5.0, 10.0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'rj0wbgbg' /* at least begin with letter */,
                                                ),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyLarge
                                                    .override(
                                                      fontFamily: 'Poppins',
                                                      color: _model
                                                                  .localNameValid ==
                                                              true
                                                          ? Color(0xFFD6D6D6)
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      fontSize: 14.0,
                                                    ),
                                              )),
                                          offset: 4.0,
                                          preferredDirection:
                                              AxisDirection.down,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          backgroundColor: Colors.white,
                                          elevation: 4.0,
                                          tailBaseWidth: 24.0,
                                          tailLength: 12.0,
                                          waitDuration:
                                              Duration(milliseconds: 100),
                                          showDuration:
                                              Duration(milliseconds: 1500),
                                          triggerMode: TooltipTriggerMode.tap,
                                          child: Icon(
                                            Icons.error,
                                            color: valueOrDefault<Color>(
                                              _model.localNameValid == true
                                                  ? Color(0xFFD6D6D6)
                                                  : FlutterFlowTheme.of(context)
                                                      .error,
                                              Color(0x3EFFFFFF),
                                            ),
                                            size: 20.0,
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                35.0, 0.0, 35.0, 0.0),
                            child: Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xB8FFFEFE),
                                    borderRadius: BorderRadius.circular(3.0),
                                    border: Border.all(
                                      color: valueOrDefault<Color>(
                                        _model.localEmailIsValid == true
                                            ? Color(0x00FFFFFF)
                                            : FlutterFlowTheme.of(context)
                                                .error,
                                        Color(0x000FFFFF),
                                      ),
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5.0, 0.0, 5.0, 0.0),
                                          child: TextFormField(
                                            controller: _model.textController,
                                            focusNode:
                                                _model.textFieldFocusNode,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              isDense: true,
                                              hintText:
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                '6zaw2uxi' /* Email */,
                                              ),
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily: 'Heebo',
                                                        color:
                                                            Color(0xFFAAAAAA),
                                                        fontSize: 14.0,
                                                        useGoogleFonts: false,
                                                      ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft: Radius.circular(4.0),
                                                  topRight:
                                                      Radius.circular(4.0),
                                                ),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft: Radius.circular(4.0),
                                                  topRight:
                                                      Radius.circular(4.0),
                                                ),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft: Radius.circular(4.0),
                                                  topRight:
                                                      Radius.circular(4.0),
                                                ),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft: Radius.circular(4.0),
                                                  topRight:
                                                      Radius.circular(4.0),
                                                ),
                                              ),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .titleSmall,
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            validator: _model
                                                .textControllerValidator
                                                .asValidator(context),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5.0, 15.0, 5.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      if (_model.localEmailIsValid == false)
                                        AlignedTooltip(
                                          content: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      5.0, 10.0, 5.0, 10.0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'x9clt4nt' /* Invalid Email Address */,
                                                ),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyLarge
                                                    .override(
                                                      fontFamily: 'Poppins',
                                                      color: _model
                                                                  .localEmailIsValid ==
                                                              true
                                                          ? Color(0xFFD6D6D6)
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      fontSize: 14.0,
                                                    ),
                                              )),
                                          offset: 4.0,
                                          preferredDirection:
                                              AxisDirection.down,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          backgroundColor: Colors.white,
                                          elevation: 4.0,
                                          tailBaseWidth: 24.0,
                                          tailLength: 12.0,
                                          waitDuration:
                                              Duration(milliseconds: 100),
                                          showDuration:
                                              Duration(milliseconds: 1500),
                                          triggerMode: TooltipTriggerMode.tap,
                                          child: Icon(
                                            Icons.error,
                                            color: valueOrDefault<Color>(
                                              _model.localEmailIsValid == true
                                                  ? Color(0xFFD6D6D6)
                                                  : FlutterFlowTheme.of(context)
                                                      .error,
                                              Color(0x3EFFFFFF),
                                            ),
                                            size: 20.0,
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                30.0, 0.0, 30.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Stack(
                                    children: [
                                      wrapWithModel(
                                        model: _model.phoneEditTextValuesModel,
                                        updateCallback: () => setState(() {}),
                                        child: PhoneEditTextValuesWidget(
                                          titleahint:
                                              FFLocalizations.of(context)
                                                  .getVariableText(
                                            enText: 'Phone Number',
                                            arText: 'رقم الهاتف',
                                          ),
                                          isErrorColor: valueOrDefault<Color>(
                                            _model.localPhoneNumberValid == true
                                                ? Color(0x00FFFFFF)
                                                : FlutterFlowTheme.of(context)
                                                    .error,
                                            Color(0x000FFFFF),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 15.0, 10.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            if (_model.localPhoneNumberValid ==
                                                false)
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    1.00, 0.00),
                                                child: AlignedTooltip(
                                                  content: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  5.0,
                                                                  10.0,
                                                                  5.0,
                                                                  10.0),
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'ylfefilo' /* Invalid Phone Number */,
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyLarge
                                                            .override(
                                                              fontFamily:
                                                                  'Poppins',
                                                              color: _model
                                                                          .localPhoneNumberValid ==
                                                                      true
                                                                  ? Color(
                                                                      0x3EFFFFFF)
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                              fontSize: 14.0,
                                                            ),
                                                      )),
                                                  offset: 4.0,
                                                  preferredDirection:
                                                      AxisDirection.down,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  backgroundColor: Colors.white,
                                                  elevation: 4.0,
                                                  tailBaseWidth: 24.0,
                                                  tailLength: 12.0,
                                                  waitDuration: Duration(
                                                      milliseconds: 100),
                                                  showDuration: Duration(
                                                      milliseconds: 1500),
                                                  triggerMode:
                                                      TooltipTriggerMode.tap,
                                                  child: Icon(
                                                    Icons.error,
                                                    color:
                                                        valueOrDefault<Color>(
                                                      _model.localPhoneNumberValid ==
                                                              true
                                                          ? Color(0x3EFFFFFF)
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      Color(0x3EFFFFFF),
                                                    ),
                                                    size: 20.0,
                                                  ),
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      30.0, 0.0, 30.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Flexible(
                                        child: Opacity(
                                          opacity: 0.8,
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 0.0, 5.0, 0.0),
                                            child: FlutterFlowDropDown<String>(
                                              controller: _model
                                                      .dropDownValueController ??=
                                                  FormFieldController<String>(
                                                      null),
                                              options: [
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  '6a79dl98' /* Male */,
                                                ),
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  '8tmgnkrr' /* Female */,
                                                )
                                              ],
                                              onChanged: (val) => setState(() =>
                                                  _model.dropDownValue = val),
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                              hintText:
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                '1ok3uuc1' /* Gender */,
                                              ),
                                              icon: Icon(
                                                Icons
                                                    .keyboard_arrow_down_rounded,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 24.0,
                                              ),
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              elevation: 0.0,
                                              borderColor: Colors.transparent,
                                              borderWidth: 0.0,
                                              borderRadius: 3.0,
                                              margin: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 0.0, 10.0, 0.0),
                                              hidesUnderline: true,
                                              isSearchable: false,
                                              isMultiSelect: false,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        child: Opacity(
                                          opacity: 0.8,
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              final _datePickedDate =
                                                  await showDatePicker(
                                                context: context,
                                                initialDate:
                                                    getCurrentTimestamp,
                                                firstDate: DateTime(1900),
                                                lastDate: getCurrentTimestamp,
                                              );

                                              if (_datePickedDate != null) {
                                                safeSetState(() {
                                                  _model.datePicked = DateTime(
                                                    _datePickedDate.year,
                                                    _datePickedDate.month,
                                                    _datePickedDate.day,
                                                  );
                                                });
                                              }
                                              if (!functions.is18YearsOrOlder(
                                                  _model.datePicked!
                                                      .secondsSinceEpoch)) {
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return AlertDialog(
                                                      title: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getVariableText(
                                                        enText: 'Error',
                                                        arText: 'خطأ',
                                                      )),
                                                      content: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getVariableText(
                                                        enText:
                                                            'Your age must be over 18 ',
                                                        arText:
                                                            'يجب أن يكون عمرك أكبر من 18 عامًا',
                                                      )),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  alertDialogContext),
                                                          child: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getVariableText(
                                                            enText: 'ok',
                                                            arText: 'حسنا',
                                                          )),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                );
                                                return;
                                              }
                                              setState(() {
                                                _model.localDateOfBirth =
                                                    functions
                                                        .formatDateTimeDrop(
                                                            _model.datePicked!);
                                              });
                                            },
                                            child: Card(
                                              clipBehavior:
                                                  Clip.antiAliasWithSaveLayer,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              elevation: 0.0,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(3.0),
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                14.0,
                                                                14.0,
                                                                14.0,
                                                                14.0),
                                                    child: Text(
                                                      _model.localDateOfBirth!,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Heebo',
                                                            color: Color(
                                                                0xFF646464),
                                                            useGoogleFonts:
                                                                false,
                                                          ),
                                                    ),
                                                  ),
                                                  FaIcon(
                                                    FontAwesomeIcons
                                                        .calendarAlt,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    size: 20.0,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                30.0, 0.0, 30.0, 0.0),
                            child: ClipRRect(
                              child: Container(
                                decoration: BoxDecoration(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Stack(
                                            children: [
                                              wrapWithModel(
                                                model: _model
                                                    .passwordEditTextValuesModel1,
                                                updateCallback: () =>
                                                    setState(() {}),
                                                child:
                                                    PasswordEditTextValuesWidget(
                                                  titleahint:
                                                      FFLocalizations.of(
                                                              context)
                                                          .getVariableText(
                                                    enText: 'Password',
                                                    arText: 'كلمة السر',
                                                  ),
                                                  isErrorColor: _model
                                                          .localIsPasswordConfirme
                                                      ? Color(0x00000000)
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .error,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        4.0, 18.0, 4.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    if (_model
                                                            .localIsPasswordConfirme ==
                                                        false)
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                1.00, 0.00),
                                                        child: AlignedTooltip(
                                                          content: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          10.0,
                                                                          5.0,
                                                                          10.0),
                                                              child: Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'sxhbvk0f' /* Password Mismatch */,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      color: _model.localIsPasswordConfirme ==
                                                                              true
                                                                          ? Color(
                                                                              0x3EFFFFFF)
                                                                          : FlutterFlowTheme.of(context)
                                                                              .error,
                                                                      fontSize:
                                                                          14.0,
                                                                    ),
                                                              )),
                                                          offset: 4.0,
                                                          preferredDirection:
                                                              AxisDirection
                                                                  .down,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          backgroundColor:
                                                              Colors.white,
                                                          elevation: 4.0,
                                                          tailBaseWidth: 24.0,
                                                          tailLength: 12.0,
                                                          waitDuration:
                                                              Duration(
                                                                  milliseconds:
                                                                      100),
                                                          showDuration:
                                                              Duration(
                                                                  milliseconds:
                                                                      1500),
                                                          triggerMode:
                                                              TooltipTriggerMode
                                                                  .tap,
                                                          child: Icon(
                                                            Icons.error,
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
                                                              _model.localIsPasswordConfirme ==
                                                                      true
                                                                  ? Color(
                                                                      0x3EFFFFFF)
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                              Color(0x3EFFFFFF),
                                                            ),
                                                            size: 20.0,
                                                          ),
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: wrapWithModel(
                                            model: _model
                                                .passwordEditTextValuesModel2,
                                            updateCallback: () =>
                                                setState(() {}),
                                            child: PasswordEditTextValuesWidget(
                                              titleahint:
                                                  FFLocalizations.of(context)
                                                      .getVariableText(
                                                enText: 'Confirm Password',
                                                arText:
                                                    'الموافقة على كلمة السر',
                                              ),
                                              isErrorColor: _model
                                                      .localIsPasswordConfirme
                                                  ? Color(0x00000000)
                                                  : FlutterFlowTheme.of(context)
                                                      .error,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                40.0, 0.0, 40.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 5.0, 0.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        await launchURL(
                                            'https://hyundai.completechaintech.com');
                                      },
                                      child: RichText(
                                        textScaleFactor: MediaQuery.of(context)
                                            .textScaleFactor,
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: FFLocalizations.of(context)
                                                  .getVariableText(
                                                enText:
                                                    'By creating this account, you acknowledge that you have read and understand the ',
                                                arText:
                                                    'من خلال إنشاء هذا الحساب، فإنك تقر بأنك قد قرأت وفهمت',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Heebo Regular',
                                                        color: Colors.black,
                                                        fontSize: 13.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        useGoogleFonts: false,
                                                      ),
                                            ),
                                            TextSpan(
                                              text: FFLocalizations.of(context)
                                                  .getVariableText(
                                                enText: 'Terms of Use',
                                                arText: 'شروط الاستخدام',
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .labelLarge
                                                  .override(
                                                    fontFamily: 'Heebo Regular',
                                                    color: Color(0xFF3D6398),
                                                    decoration: TextDecoration
                                                        .underline,
                                                    useGoogleFonts: false,
                                                  ),
                                            ),
                                            TextSpan(
                                              text: FFLocalizations.of(context)
                                                  .getVariableText(
                                                enText: 'and',
                                                arText: 'و',
                                              ),
                                              style: TextStyle(
                                                fontFamily: 'Heebo Regular',
                                                color: Colors.black,
                                                fontSize: 13.0,
                                              ),
                                            ),
                                            TextSpan(
                                              text: FFLocalizations.of(context)
                                                  .getVariableText(
                                                enText: ' Privacy Statement.',
                                                arText: 'بيان الخصوصية.',
                                              ),
                                              style: TextStyle(
                                                fontFamily: 'Heebo Regular',
                                                color: Color(0xFF3D6398),
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14.0,
                                                decoration:
                                                    TextDecoration.underline,
                                              ),
                                            )
                                          ],
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Poppins',
                                                color: Colors.black,
                                              ),
                                        ),
                                        textAlign: TextAlign.start,
                                        maxLines: 10,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                30.0, 10.0, 30.0, 10.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Theme(
                                  data: ThemeData(
                                    checkboxTheme: CheckboxThemeData(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                      ),
                                    ),
                                    unselectedWidgetColor: _model.privacyOne ==
                                            true
                                        ? FlutterFlowTheme.of(context).accent2
                                        : FlutterFlowTheme.of(context).error,
                                  ),
                                  child: Checkbox(
                                    value: _model.checkboxValue1 ??= false,
                                    onChanged: (newValue) async {
                                      setState(() =>
                                          _model.checkboxValue1 = newValue!);
                                      if (newValue!) {
                                        setState(() {
                                          _model.privacyOne = true;
                                        });
                                      } else {
                                        setState(() {
                                          _model.privacyOne = false;
                                        });
                                      }
                                    },
                                    activeColor:
                                        FlutterFlowTheme.of(context).ahayundai,
                                    checkColor: Color(0xEBFFFFFF),
                                  ),
                                ),
                                Expanded(
                                  child: RichText(
                                    textScaleFactor:
                                        MediaQuery.of(context).textScaleFactor,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: FFLocalizations.of(context)
                                              .getVariableText(
                                            enText:
                                                'yes, I have read and consent to the terms and conditions',
                                            arText:
                                                'نعم، لقد قرأت الشروط والأحكام ووافقت عليها',
                                          ),
                                          style: TextStyle(
                                            color: Color(0xFF000508),
                                          ),
                                        )
                                      ],
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Heebo Regular',
                                            color: FlutterFlowTheme.of(context)
                                                .white,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                    textAlign: TextAlign.start,
                                    maxLines: 2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                30.0, 10.0, 30.0, 10.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Theme(
                                  data: ThemeData(
                                    checkboxTheme: CheckboxThemeData(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                      ),
                                    ),
                                    unselectedWidgetColor:
                                        FlutterFlowTheme.of(context).accent2,
                                  ),
                                  child: Checkbox(
                                    value: _model.checkboxValue2 ??= false,
                                    onChanged: (newValue) async {
                                      setState(() =>
                                          _model.checkboxValue2 = newValue!);
                                    },
                                    activeColor:
                                        FlutterFlowTheme.of(context).ahayundai,
                                    checkColor: Color(0xEBFFFFFF),
                                  ),
                                ),
                                Expanded(
                                  child: RichText(
                                    textScaleFactor:
                                        MediaQuery.of(context).textScaleFactor,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: FFLocalizations.of(context)
                                              .getVariableText(
                                            enText: 'Receive',
                                            arText: 'يستلم',
                                          ),
                                          style: TextStyle(
                                            fontFamily: 'Heebo Regular',
                                            color: Color(0xFF060000),
                                          ),
                                        ),
                                        TextSpan(
                                          text: FFLocalizations.of(context)
                                              .getVariableText(
                                            enText: ' News letters',
                                            arText: 'النشرات الإخبارية',
                                          ),
                                          style: GoogleFonts.getFont(
                                            'Open Sans',
                                            color: Color(0xFF0F0000),
                                            fontWeight: FontWeight.w900,
                                            fontSize: 14.0,
                                          ),
                                        ),
                                        TextSpan(
                                          text: FFLocalizations.of(context)
                                              .getVariableText(
                                            enText: ' from Hyundai',
                                            arText: 'من هيونداي',
                                          ),
                                          style: TextStyle(
                                            fontFamily: 'Heebo Regular',
                                            color: Color(0xFF020000),
                                          ),
                                        )
                                      ],
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Heebo Regular',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                    textAlign: TextAlign.start,
                                    maxLines: 3,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                30.0, 30.5, 30.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  child: Builder(
                                    builder: (context) => FFButtonWidget(
                                      onPressed: () async {
                                        var _shouldSetState = false;
                                        if (_model.textController.text ==
                                                null ||
                                            _model.textController.text == '') {
                                          setState(() {
                                            _model.localEmailIsValid = false;
                                          });
                                          if (_shouldSetState) setState(() {});
                                          return;
                                        } else {
                                          if (functions.newCustomFunction(
                                              _model.textController.text)!) {
                                            if ((_model.passwordEditTextValuesModel1
                                                            .textController.text !=
                                                        null &&
                                                    _model
                                                            .passwordEditTextValuesModel1
                                                            .textController
                                                            .text !=
                                                        '') &&
                                                (_model.passwordEditTextValuesModel1
                                                        .textController.text ==
                                                    _model
                                                        .passwordEditTextValuesModel2
                                                        .textController
                                                        .text)) {
                                              setState(() {
                                                _model.localEmailIsValid = true;
                                                _model.localIsPasswordConfirme =
                                                    true;
                                              });
                                              setState(() {
                                                _model.localPhoneNumber = functions
                                                    .checkNumberAndValidate(_model
                                                        .phoneEditTextValuesModel
                                                        .textController
                                                        .text);
                                              });
                                              if (functions.checkNumberCount(
                                                      _model
                                                          .localPhoneNumber) !=
                                                  true) {
                                                setState(() {
                                                  _model.localPhoneNumberValid =
                                                      false;
                                                });
                                                if (_shouldSetState)
                                                  setState(() {});
                                                return;
                                              }
                                              setState(() {
                                                _model.localPhoneNumberValid =
                                                    true;
                                              });
                                              if (_model.regulerEditTextValuesModel
                                                          .textController.text !=
                                                      null &&
                                                  _model.regulerEditTextValuesModel
                                                          .textController.text !=
                                                      '') {
                                                setState(() {
                                                  _model.localNameValid = true;
                                                });
                                                if (_model.privacyOne == true) {
                                                  setState(() {});
                                                  if (functions.charsCount(_model
                                                          .passwordEditTextValuesModel2
                                                          .textController
                                                          .text) !=
                                                      true) {
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return AlertDialog(
                                                          title: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getVariableText(
                                                            enText: 'Error',
                                                            arText: 'خطأ',
                                                          )),
                                                          content: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getVariableText(
                                                            enText:
                                                                'Password should be over 6 digits',
                                                            arText:
                                                                'يجب أن تكون كلمة المرور أكثر من 6 أرقام',
                                                          )),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext),
                                                              child: Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getVariableText(
                                                                enText: 'ok',
                                                                arText: 'حسنا',
                                                              )),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    );
                                                    if (_shouldSetState)
                                                      setState(() {});
                                                    return;
                                                  }
                                                } else {
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return AlertDialog(
                                                        title: Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getVariableText(
                                                          enText: 'Error',
                                                          arText: 'خطأ',
                                                        )),
                                                        content: Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getVariableText(
                                                          enText:
                                                              'Check Privacy and policy',
                                                          arText:
                                                              'تحقق من الخصوصية والسياسة',
                                                        )),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext),
                                                            child: Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getVariableText(
                                                              enText: 'ok',
                                                              arText: 'حسنا',
                                                            )),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  );
                                                  if (_shouldSetState)
                                                    setState(() {});
                                                  return;
                                                }

                                                _model.apiResult7h5 =
                                                    await RegisterApiCall.call(
                                                  phone:
                                                      _model.localPhoneNumber,
                                                  name: _model
                                                      .regulerEditTextValuesModel
                                                      .textController
                                                      .text,
                                                  password: _model
                                                      .passwordEditTextValuesModel2
                                                      .textController
                                                      .text,
                                                  gender: _model.dropDownValue,
                                                  lang: FFLocalizations.of(
                                                          context)
                                                      .languageCode,
                                                  email: _model
                                                      .textController.text,
                                                  countryCode: 'JO',
                                                  date: _model.localDateOfBirth,
                                                );
                                                _shouldSetState = true;
                                                if ((_model.apiResult7h5
                                                        ?.succeeded ??
                                                    true)) {
                                                  setState(() {
                                                    FFAppState()
                                                            .reservedUserModel =
                                                        getJsonField(
                                                      (_model.apiResult7h5
                                                              ?.jsonBody ??
                                                          ''),
                                                      r'''$.user''',
                                                    );
                                                  });
                                                  setState(() {
                                                    FFAppState().password = _model
                                                        .passwordEditTextValuesModel2
                                                        .textController
                                                        .text;
                                                  });
                                                  _model.apiResultjcw =
                                                      await GetMobileNumberCall
                                                          .call(
                                                    phone: getJsonField(
                                                      FFAppState()
                                                          .reservedUserModel,
                                                      r'''$.phone''',
                                                    ).toString(),
                                                  );
                                                  _shouldSetState = true;
                                                  if ((_model.apiResultjcw
                                                          ?.succeeded ??
                                                      true)) {
                                                    await showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      enableDrag: false,
                                                      context: context,
                                                      builder: (context) {
                                                        return GestureDetector(
                                                          onTap: () => _model
                                                                  .unfocusNode
                                                                  .canRequestFocus
                                                              ? FocusScope.of(
                                                                      context)
                                                                  .requestFocus(
                                                                      _model
                                                                          .unfocusNode)
                                                              : FocusScope.of(
                                                                      context)
                                                                  .unfocus(),
                                                          child: Padding(
                                                            padding: MediaQuery
                                                                .viewInsetsOf(
                                                                    context),
                                                            child: Container(
                                                              height: 400.0,
                                                              child:
                                                                  VerifyBottomDialogWidget(),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ).then((value) =>
                                                        safeSetState(() {}));
                                                  } else {
                                                    await showAlignedDialog(
                                                      context: context,
                                                      isGlobal: true,
                                                      avoidOverflow: false,
                                                      targetAnchor:
                                                          AlignmentDirectional(
                                                                  0.0, 0.0)
                                                              .resolve(
                                                                  Directionality.of(
                                                                      context)),
                                                      followerAnchor:
                                                          AlignmentDirectional(
                                                                  0.0, 0.0)
                                                              .resolve(
                                                                  Directionality.of(
                                                                      context)),
                                                      builder: (dialogContext) {
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
                                                                    .requestFocus(
                                                                        _model
                                                                            .unfocusNode)
                                                                : FocusScope.of(
                                                                        context)
                                                                    .unfocus(),
                                                            child:
                                                                Modal06BasicInformationWidget(
                                                              body: (_model
                                                                      .apiResultjcw
                                                                      ?.bodyText ??
                                                                  ''),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ).then((value) =>
                                                        setState(() {}));

                                                    if (_shouldSetState)
                                                      setState(() {});
                                                    return;
                                                  }
                                                } else {
                                                  await showAlignedDialog(
                                                    context: context,
                                                    isGlobal: true,
                                                    avoidOverflow: false,
                                                    targetAnchor:
                                                        AlignmentDirectional(
                                                                0.0, 0.0)
                                                            .resolve(
                                                                Directionality.of(
                                                                    context)),
                                                    followerAnchor:
                                                        AlignmentDirectional(
                                                                0.0, 0.0)
                                                            .resolve(
                                                                Directionality.of(
                                                                    context)),
                                                    builder: (dialogContext) {
                                                      return Material(
                                                        color:
                                                            Colors.transparent,
                                                        child: GestureDetector(
                                                          onTap: () => _model
                                                                  .unfocusNode
                                                                  .canRequestFocus
                                                              ? FocusScope.of(
                                                                      context)
                                                                  .requestFocus(
                                                                      _model
                                                                          .unfocusNode)
                                                              : FocusScope.of(
                                                                      context)
                                                                  .unfocus(),
                                                          child:
                                                              Modal06BasicInformationWidget(
                                                            body: (_model
                                                                    .apiResult7h5
                                                                    ?.bodyText ??
                                                                ''),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      setState(() {}));

                                                  if (_shouldSetState)
                                                    setState(() {});
                                                  return;
                                                }
                                              } else {
                                                setState(() {
                                                  _model.localNameValid = false;
                                                });
                                                if (_shouldSetState)
                                                  setState(() {});
                                                return;
                                              }
                                            } else {
                                              setState(() {
                                                _model.localIsPasswordConfirme =
                                                    false;
                                              });
                                              if (_shouldSetState)
                                                setState(() {});
                                              return;
                                            }
                                          } else {
                                            setState(() {
                                              _model.localEmailIsValid = false;
                                            });
                                            if (_shouldSetState)
                                              setState(() {});
                                            return;
                                          }
                                        }

                                        if (_shouldSetState) setState(() {});
                                      },
                                      text: FFLocalizations.of(context).getText(
                                        'd8f3cwvn' /* Create Account */,
                                      ),
                                      options: FFButtonOptions(
                                        height: 40.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .ahayundai,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: Colors.white,
                                            ),
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ].addToEnd(SizedBox(height: 55.0)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
