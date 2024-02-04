import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';
import 'package:hyperpay_plugin/flutter_hyperpay.dart';
import 'package:hyperpay_plugin/model/custom_ui.dart';
import 'package:hyundai/ui_screens/checkout/payment_page_page/payment_card.dart';
import '../shipping_address_page/in_app_payment_setting.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/ui_screens/components/hynday_app_bar/hynday_app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'input_formatters.dart';
import 'my_strings.dart';
import 'payment_page_page_model.dart';
export 'payment_page_page_model.dart';

class PaymentPagePageWidget extends StatefulWidget {
  const PaymentPagePageWidget({
    super.key,
    this.deepLinkId,
    this.checkoutId,
  });

  final String? deepLinkId;
  final String? checkoutId;

  @override
  State<PaymentPagePageWidget> createState() => _PaymentPagePageWidgetState();
}

class _PaymentPagePageWidgetState extends State<PaymentPagePageWidget>
    with TickerProviderStateMixin {
  late PaymentPagePageModel _model;
  late FlutterHyperPay flutterHyperPay;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _paymentCard = PaymentCard();
  bool isCardHolder = false;
  bool isCarNumber = false;
  bool isCardCvv = false;
  bool isCardDate = false;
  var _formKey = new GlobalKey<FormState>();

  final animationsMap = {
    'columnOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 100.ms,
          duration: 500.ms,
          begin: Offset(0.0, 650.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaymentPagePageModel());
    _model.cardHolderTextController ??= TextEditingController();
    _model.cardNumberTextController ??= TextEditingController();
    _model.cardCvvTextController ??= TextEditingController();
    _model.cardDateTextController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
    _paymentCard.type = CardType.Others;
    _model.cardNumberTextController?.addListener(_getCardTypeFrmNumber);

    SchedulerBinding.instance.addPostFrameCallback((_) async {
      flutterHyperPay = FlutterHyperPay(
        shopperResultUrl: InAppPaymentSetting.shopperResultUrl,
        paymentMode: PaymentMode.test,
        lang: InAppPaymentSetting.getLang(),
      );
    });
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();
    _model.cardNumberTextController?.removeListener(_getCardTypeFrmNumber);
    _model.cardNumberTextController?.dispose();
    super.dispose();
  }

  void _getCardTypeFrmNumber() {
    String input =
        CardUtils.getCleanedNumber(_model.cardNumberTextController?.text ?? '');
    CardType cardType = CardUtils.getCardTypeFrmNumber(input);
    setState(() {
      this._paymentCard.type = cardType;
    });
  }

  void holderState() {
    setState(() {
      isCardHolder = _model.cardHolderTextController.text.isEmpty;
      isCarNumber = _model.cardNumberTextController.text.isEmpty;
      isCardCvv = _model.cardCvvTextController.text.isEmpty;
      isCardDate = _model.cardDateTextController.text.isEmpty;
    });
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
                alignment: const AlignmentDirectional(0.0, 1.0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(
                      0.0, 150.0, 0.0, 0.0),
                  child: Stack(
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(0.0, 1.0),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            50.0, 0.0, 50.0, 0.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(0.0),
                                      child: Image.asset(
                                        'assets/images/Group_72049.png',
                                        width: 240.0,
                                        height: 230.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 1.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      5.0, 0.0, 5.0, 0.0),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFC1D6EF),
                                      borderRadius: const BorderRadius.only(
                                        bottomLeft: Radius.circular(0.0),
                                        bottomRight: Radius.circular(0.0),
                                        topLeft: Radius.circular(25.0),
                                        topRight: Radius.circular(25.0),
                                      ),
                                      border: Border.all(
                                        color: Color(0xFFC1D6EF),
                                      ),
                                    ),
                                    child: Form(
                                      key: _formKey,
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                  20.0, 20.0, 20.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'jso9ic4z' /* Pay Now */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'HeeboBold',
                                                          color:
                                                              Color(0xFF092853),
                                                          fontSize: 16.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          useGoogleFonts: false,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  20, 20, 20, 0),
                                              child: TextFormField(
                                                onChanged: (value) {
                                                  setState(() {
                                                    isCardHolder = _model
                                                        .cardHolderTextController
                                                        .text
                                                        .isEmpty;
                                                  });
                                                },
                                                controller: _model
                                                    .cardHolderTextController,
                                                decoration: InputDecoration(
                                                  filled: true,
                                                  hintText:
                                                      FFLocalizations.of(context)
                                                          .getVariableText(
                                                    enText: 'Card Holder',
                                                    arText: 'حامل البطاقة',
                                                  ),
                                                  errorText: isCardHolder
                                                      ? FFLocalizations.of(
                                                              context)
                                                          .getVariableText(
                                                          enText:
                                                              'Card holder is missing',
                                                          arText:
                                                              'حامل البطاقة غير موجود',
                                                        )
                                                      : '',
                                                  enabledBorder: isCardHolder
                                                      ? OutlineInputBorder(
                                                          borderSide:
                                                              const BorderSide(
                                                            color:
                                                                Color(0xFFEF2121),
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5.0),
                                                        )
                                                      : OutlineInputBorder(
                                                          borderSide:
                                                              const BorderSide(
                                                            color:
                                                                Color(0xFFC3C1C1),
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5.0),
                                                        ),
                                                  fillColor:
                                                      FlutterFlowTheme.of(context)
                                                          .white,
                                                  focusedBorder: isCardHolder
                                                      ? OutlineInputBorder(
                                                          borderSide:
                                                              const BorderSide(
                                                            color:
                                                                Color(0xFFEF2121),
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5.0),
                                                        )
                                                      : OutlineInputBorder(
                                                          borderSide:
                                                              const BorderSide(
                                                            color:
                                                                Color(0xFFC3C1C1),
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5.0),
                                                        ),
                                                  errorBorder: isCardHolder
                                                      ? OutlineInputBorder(
                                                          borderSide:
                                                              const BorderSide(
                                                            color:
                                                                Color(0xFFEF2121),
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5.0),
                                                        )
                                                      : OutlineInputBorder(
                                                          borderSide:
                                                              const BorderSide(
                                                            color:
                                                                Color(0xFFC3C1C1),
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5.0),
                                                        ),
                                                  focusedErrorBorder: isCardHolder
                                                      ? OutlineInputBorder(
                                                          borderSide:
                                                              const BorderSide(
                                                            color:
                                                                Color(0xFFEF2121),
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5.0),
                                                        )
                                                      : OutlineInputBorder(
                                                          borderSide:
                                                              const BorderSide(
                                                            color:
                                                                Color(0xFFC3C1C1),
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5.0),
                                                        ),
                                                ),
                                                onSaved: (String? value) {
                                                  _paymentCard.name = value;
                                                },
                                                keyboardType: TextInputType.text,
                                                validator: (String? value) =>
                                                    value!.isEmpty
                                                        ? Strings.fieldReq
                                                        : null,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 5.0,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  20, 0, 20, 0),
                                              child: Stack(
                                                alignment:
                                                    FFAppState().currentLanguge ==
                                                            'en'
                                                        ? Alignment.centerRight
                                                        : Alignment.centerLeft,
                                                children: [
                                                  TextFormField(
                                                    onChanged: (value) {
                                                      setState(() {
                                                        isCarNumber = _model
                                                            .cardNumberTextController
                                                            .text
                                                            .isEmpty;
                                                      });
                                                    },
                                                    keyboardType:
                                                        TextInputType.number,
                                                    inputFormatters: [
                                                      FilteringTextInputFormatter
                                                          .digitsOnly,
                                                      LengthLimitingTextInputFormatter(
                                                          19),
                                                      CardNumberInputFormatter()
                                                    ],
                                                    controller: _model
                                                        .cardNumberTextController,
                                                    decoration: InputDecoration(
                                                      filled: true,
                                                      hintText:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getVariableText(
                                                        enText: 'Card Number',
                                                        arText: 'رقم البطاقة',
                                                      ),
                                                      errorText: isCarNumber
                                                          ? FFLocalizations.of(
                                                                  context)
                                                              .getVariableText(
                                                              enText:
                                                                  'Card Number is missing',
                                                              arText:
                                                                  'رقم البطاقة فارغ',
                                                            )
                                                          : '',
                                                      enabledBorder: isCarNumber
                                                          ? OutlineInputBorder(
                                                              borderSide:
                                                                  const BorderSide(
                                                                color: Color(
                                                                    0xFFEF2121),
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5.0),
                                                            )
                                                          : OutlineInputBorder(
                                                              borderSide:
                                                                  const BorderSide(
                                                                color: Color(
                                                                    0xFFC3C1C1),
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5.0),
                                                            ),
                                                      fillColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .white,
                                                      focusedBorder: isCarNumber
                                                          ? OutlineInputBorder(
                                                              borderSide:
                                                                  const BorderSide(
                                                                color: Color(
                                                                    0xFFEF2121),
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5.0),
                                                            )
                                                          : OutlineInputBorder(
                                                              borderSide:
                                                                  const BorderSide(
                                                                color: Color(
                                                                    0xFFC3C1C1),
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5.0),
                                                            ),
                                                      errorBorder: isCarNumber
                                                          ? OutlineInputBorder(
                                                              borderSide:
                                                                  const BorderSide(
                                                                color: Color(
                                                                    0xFFEF2121),
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5.0),
                                                            )
                                                          : OutlineInputBorder(
                                                              borderSide:
                                                                  const BorderSide(
                                                                color: Color(
                                                                    0xFFC3C1C1),
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5.0),
                                                            ),
                                                      focusedErrorBorder:
                                                          isCarNumber
                                                              ? OutlineInputBorder(
                                                                  borderSide:
                                                                      const BorderSide(
                                                                    color: Color(
                                                                        0xFFEF2121),
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5.0),
                                                                )
                                                              : OutlineInputBorder(
                                                                  borderSide:
                                                                      const BorderSide(
                                                                    color: Color(
                                                                        0xFFC3C1C1),
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5.0),
                                                                ),
                                                    ),
                                                    onSaved: (String? value) {
                                                      _paymentCard.number =
                                                          CardUtils
                                                              .getCleanedNumber(
                                                                  value!);
                                                    },
                                                    validator:
                                                        CardUtils.validateCardNum,
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.fromLTRB(
                                                        20, 0, 20, 20),
                                                    child: Align(
                                                      alignment: FFAppState()
                                                                  .currentLanguge ==
                                                              'en'
                                                          ? Alignment.topRight
                                                          : Alignment.topLeft,
                                                      child:
                                                          CardUtils.getCardIcon(
                                                              _paymentCard.type),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 5.0,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  20, 0, 20, 0),
                                              child: TextFormField(
                                                onChanged: (value) {
                                                  setState(() {
                                                    isCardCvv = _model
                                                        .cardCvvTextController
                                                        .text
                                                        .isEmpty;
                                                  });
                                                },
                                                controller:
                                                    _model.cardCvvTextController,
                                                inputFormatters: [
                                                  FilteringTextInputFormatter
                                                      .digitsOnly,
                                                  LengthLimitingTextInputFormatter(
                                                      4),
                                                ],
                                                decoration: InputDecoration(
                                                  filled: true,
                                                  hintText:
                                                      FFLocalizations.of(context)
                                                          .getVariableText(
                                                    enText: 'CVV',
                                                    arText: 'رقم خلف البطاقة',
                                                  ),
                                                  errorText: isCardCvv
                                                      ? FFLocalizations.of(
                                                              context)
                                                          .getVariableText(
                                                          enText:
                                                              'CVV is missing',
                                                          arText:
                                                              'رقم خلف البطاقة غير موجود',
                                                        )
                                                      : '',
                                                  enabledBorder: isCardCvv
                                                      ? OutlineInputBorder(
                                                          borderSide:
                                                              const BorderSide(
                                                            color:
                                                                Color(0xFFEF2121),
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5.0),
                                                        )
                                                      : OutlineInputBorder(
                                                          borderSide:
                                                              const BorderSide(
                                                            color:
                                                                Color(0xFFC3C1C1),
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5.0),
                                                        ),
                                                  fillColor:
                                                      FlutterFlowTheme.of(context)
                                                          .white,
                                                  focusedBorder: isCardCvv
                                                      ? OutlineInputBorder(
                                                          borderSide:
                                                              const BorderSide(
                                                            color:
                                                                Color(0xFFEF2121),
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5.0),
                                                        )
                                                      : OutlineInputBorder(
                                                          borderSide:
                                                              const BorderSide(
                                                            color:
                                                                Color(0xFFC3C1C1),
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5.0),
                                                        ),
                                                  errorBorder: isCardCvv
                                                      ? OutlineInputBorder(
                                                          borderSide:
                                                              const BorderSide(
                                                            color:
                                                                Color(0xFFEF2121),
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5.0),
                                                        )
                                                      : OutlineInputBorder(
                                                          borderSide:
                                                              const BorderSide(
                                                            color:
                                                                Color(0xFFC3C1C1),
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5.0),
                                                        ),
                                                  focusedErrorBorder: isCardCvv
                                                      ? OutlineInputBorder(
                                                          borderSide:
                                                              const BorderSide(
                                                            color:
                                                                Color(0xFFEF2121),
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5.0),
                                                        )
                                                      : OutlineInputBorder(
                                                          borderSide:
                                                              const BorderSide(
                                                            color:
                                                                Color(0xFFC3C1C1),
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5.0),
                                                        ),
                                                ),
                                                validator: CardUtils.validateCVV,
                                                keyboardType:
                                                    TextInputType.number,
                                                onSaved: (value) {
                                                  _paymentCard.cvv =
                                                      int.parse(value!);
                                                },
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 5.0,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  20, 0, 20, 0),
                                              child: TextFormField(
                                                onChanged: (value) {
                                                  setState(() {
                                                    isCardDate = _model
                                                        .cardDateTextController
                                                        .text
                                                        .isEmpty;
                                                  });
                                                },
                                                controller:
                                                    _model.cardDateTextController,
                                                inputFormatters: [
                                                  FilteringTextInputFormatter
                                                      .digitsOnly,
                                                  LengthLimitingTextInputFormatter(
                                                      4),
                                                  CardMonthInputFormatter()
                                                ],
                                                decoration: InputDecoration(
                                                  filled: true,
                                                  hintText:
                                                      FFLocalizations.of(context)
                                                          .getVariableText(
                                                    enText: 'MM/YY',
                                                    arText: 'شهر/سنة',
                                                  ),
                                                  errorText: isCardDate
                                                      ? FFLocalizations.of(
                                                              context)
                                                          .getVariableText(
                                                          enText:
                                                              'Date is missing',
                                                          arText:
                                                              'التاريخ غير موجود',
                                                        )
                                                      : '',
                                                  enabledBorder: isCardDate
                                                      ? OutlineInputBorder(
                                                          borderSide:
                                                              const BorderSide(
                                                            color:
                                                                Color(0xFFEF2121),
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5.0),
                                                        )
                                                      : OutlineInputBorder(
                                                          borderSide:
                                                              const BorderSide(
                                                            color:
                                                                Color(0xFFC3C1C1),
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5.0),
                                                        ),
                                                  fillColor:
                                                      FlutterFlowTheme.of(context)
                                                          .white,
                                                  focusedBorder: isCardDate
                                                      ? OutlineInputBorder(
                                                          borderSide:
                                                              const BorderSide(
                                                            color:
                                                                Color(0xFFEF2121),
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5.0),
                                                        )
                                                      : OutlineInputBorder(
                                                          borderSide:
                                                              const BorderSide(
                                                            color:
                                                                Color(0xFFC3C1C1),
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5.0),
                                                        ),
                                                  errorBorder: isCardDate
                                                      ? OutlineInputBorder(
                                                          borderSide:
                                                              const BorderSide(
                                                            color:
                                                                Color(0xFFEF2121),
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5.0),
                                                        )
                                                      : OutlineInputBorder(
                                                          borderSide:
                                                              const BorderSide(
                                                            color:
                                                                Color(0xFFC3C1C1),
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5.0),
                                                        ),
                                                  focusedErrorBorder: isCardDate
                                                      ? OutlineInputBorder(
                                                          borderSide:
                                                              const BorderSide(
                                                            color:
                                                                Color(0xFFEF2121),
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5.0),
                                                        )
                                                      : OutlineInputBorder(
                                                          borderSide:
                                                              const BorderSide(
                                                            color:
                                                                Color(0xFFC3C1C1),
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5.0),
                                                        ),
                                                ),
                                                validator: CardUtils.validateDate,
                                                keyboardType:
                                                    TextInputType.number,
                                                onSaved: (value) {
                                                  List<int> expiryDate =
                                                      CardUtils.getExpiryDate(
                                                          value!);
                                                  _paymentCard.month =
                                                      expiryDate[0];
                                                  _paymentCard.year =
                                                      expiryDate[1];
                                                },
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                  30.0, 30.5, 30.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  FFButtonWidget(
                                                    onPressed: () async{
                                                      holderState();
                                                      if (!isCardHolder &&
                                                          !isCarNumber &&
                                                          !isCardCvv &&
                                                          !isCardDate) {
                                                        _formKey.currentState?.save();
                                                        await flutterHyperPay.customUICards(customUI:  CustomUI(
                                                          brandName: _paymentCard.type?.toName() ?? '',
                                                          checkoutId: widget.checkoutId ?? '',
                                                          cardNumber: _paymentCard.number ?? '',
                                                          holderName: _paymentCard.name ?? '',
                                                          month: _paymentCard.month.toString(),
                                                          year: '20${_paymentCard.year.toString()}',
                                                          cvv: _paymentCard.cvv.toString(),
                                                          enabledTokenization: false, // default
                                                        ),).catchError((onError){
                                                          print("");
                                                        }).then((paymentResultData) => {
                                                            if (paymentResultData.paymentResult == PaymentResult.success ||
                                                            paymentResultData.paymentResult == PaymentResult.sync) {




                                                        }else{
                                                        print("object")
                                                        }
                                                        });
                                                      } else {
                                                        holderState();
                                                      }
                                                    },
                                                    showLoadingIndicator: true,
                                                    text: FFLocalizations.of(
                                                            context)
                                                        .getText(
                                                      'm0mdulr1' /* Pay Now */,
                                                    ),
                                                    options: FFButtonOptions(
                                                      height: 40.0,
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(50.0, 0.0,
                                                              50.0, 0.0),
                                                      iconPadding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                              0.0, 0.0, 0.0, 0.0),
                                                      color: FlutterFlowTheme.of(
                                                              context)
                                                          .ahayundai,
                                                      textStyle: FlutterFlowTheme
                                                              .of(context)
                                                          .titleSmall
                                                          .override(
                                                            fontFamily: 'Poppins',
                                                            color: Colors.white,
                                                          ),
                                                      borderSide:
                                                          const BorderSide(
                                                        color: Colors.transparent,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ].addToEnd(SizedBox(height: 50.0)),
                                        ),
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
                          isIconsHidden: false,
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
