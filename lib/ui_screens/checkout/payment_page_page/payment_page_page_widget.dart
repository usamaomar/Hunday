import 'package:flutter/cupertino.dart';
import 'package:hyundai/ui_screens/checkout/payment_page_page/payment_card.dart';

import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/ui_screens/components/hynday_app_bar/hynday_app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'input_formatters.dart';
import 'my_strings.dart';
import 'payment_page_page_model.dart';
export 'payment_page_page_model.dart';
import 'dart:io' show Platform;

class PaymentPagePageWidget extends StatefulWidget {
  const PaymentPagePageWidget({
    super.key,
    this.deepLinkId,
  });

  final String? deepLinkId;

  @override
  State<PaymentPagePageWidget> createState() => _PaymentPagePageWidgetState();
}

class _PaymentPagePageWidgetState extends State<PaymentPagePageWidget>
    with TickerProviderStateMixin {
  late PaymentPagePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  var _formKey = new GlobalKey<FormState>();
  var numberController = new TextEditingController();
  var _paymentCard = PaymentCard();
  var _autoValidateMode = AutovalidateMode.disabled;

  var _card = new PaymentCard();


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

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    _paymentCard.type = CardType.Others;
    numberController.addListener(_getCardTypeFrmNumber);

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();
    numberController.removeListener(_getCardTypeFrmNumber);
    numberController.dispose();
    super.dispose();
  }


  void _getCardTypeFrmNumber() {
    String input = CardUtils.getCleanedNumber(numberController.text);
    CardType cardType = CardUtils.getCardTypeFrmNumber(input);
    setState(() {
      this._paymentCard.type = cardType;
    });
  }

  void _validateInputs() {
    final FormState form = _formKey.currentState!;
    if (!form.validate()) {
      setState(() {
        _autoValidateMode =
            AutovalidateMode.always; // Start validating on every change.
      });
      _showInSnackBar('Please fix the errors in red before submitting.');
    } else {
      form.save();
      // Encrypt and send send payment details to payment gateway
      _showInSnackBar('Payment card is valid');
    }
  }

  Widget _getPayButton() {
    if (Platform.isIOS) {
      return CupertinoButton(
        onPressed: _validateInputs,
        color: CupertinoColors.activeBlue,
        child: const Text(
          Strings.pay,
          style: const TextStyle(fontSize: 17.0),
        ),
      );
    } else {
      return ElevatedButton(
        onPressed: _validateInputs,
        child: Text(
          Strings.pay.toUpperCase(),
          style: const TextStyle(fontSize: 17.0),
        ),
      );
    }
  }

  void _showInSnackBar(String value) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(value),
      duration: Duration(seconds: 3),
    ));
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
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 150.0, 0.0, 0.0),
                  child: Stack(
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, 1.0),
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
                                    padding: const EdgeInsetsDirectional.fromSTEB(
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
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5.0, 0.0, 5.0, 0.0),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFC1D6EF),
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(0.0),
                                        bottomRight: Radius.circular(0.0),
                                        topLeft: Radius.circular(25.0),
                                        topRight: Radius.circular(25.0),
                                      ),
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
                                                    30.0, 20.0, 30.0, 0.0),
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
                                          TextFormField(
                                            decoration: const InputDecoration(
                                              border: const UnderlineInputBorder(),
                                              filled: true,
                                              icon: Icon(
                                                Icons.person,
                                                size: 40.0,
                                              ),
                                              hintText: 'What name is written on card?',
                                              labelText: 'Card Name',
                                            ),
                                            onSaved: (String? value) {
                                              _card.name = value;
                                            },
                                            keyboardType: TextInputType.text,
                                            validator: (String? value) =>
                                            value!.isEmpty ? Strings.fieldReq : null,
                                          ),
                                          SizedBox(
                                            height: 30.0,
                                          ),
                                          TextFormField(
                                            keyboardType: TextInputType.number,
                                            inputFormatters: [
                                              FilteringTextInputFormatter.digitsOnly,
                                              new LengthLimitingTextInputFormatter(19),
                                              new CardNumberInputFormatter()
                                            ],
                                            controller: numberController,
                                            decoration: InputDecoration(
                                              border: const UnderlineInputBorder(),
                                              filled: true,
                                              icon: CardUtils.getCardIcon(_paymentCard.type),
                                              hintText: 'What number is written on card?',
                                              labelText: 'Number',
                                            ),
                                            onSaved: (String? value) {
                                              print('onSaved = $value');
                                              print('Num controller has = ${numberController.text}');
                                              _paymentCard.number = CardUtils.getCleanedNumber(value!);
                                            },
                                            validator: CardUtils.validateCardNum,
                                          ),
                                          new SizedBox(
                                            height: 30.0,
                                          ),
                                          new TextFormField(
                                            inputFormatters: [
                                              FilteringTextInputFormatter.digitsOnly,
                                              new LengthLimitingTextInputFormatter(4),
                                            ],
                                            decoration: new InputDecoration(
                                              border: const UnderlineInputBorder(),
                                              filled: true,
                                              icon: new Image.asset(
                                                'assets/images/card_cvv.png',
                                                width: 40.0,
                                                color: Colors.grey[600],
                                              ),
                                              hintText: 'Number behind the card',
                                              labelText: 'CVV',
                                            ),
                                            validator: CardUtils.validateCVV,
                                            keyboardType: TextInputType.number,
                                            onSaved: (value) {
                                              _paymentCard.cvv = int.parse(value!);
                                            },
                                          ),
                                          new SizedBox(
                                            height: 30.0,
                                          ),
                                          new TextFormField(
                                            inputFormatters: [
                                              FilteringTextInputFormatter.digitsOnly,
                                              new LengthLimitingTextInputFormatter(4),
                                              new CardMonthInputFormatter()
                                            ],
                                            decoration: new InputDecoration(
                                              border: const UnderlineInputBorder(),
                                              filled: true,
                                              icon: new Image.asset(
                                                'assets/images/calender.png',
                                                width: 40.0,
                                                color: Colors.grey[600],
                                              ),
                                              hintText: 'MM/YY',
                                              labelText: 'Expiry Date',
                                            ),
                                            validator: CardUtils.validateDate,
                                            keyboardType: TextInputType.number,
                                            onSaved: (value) {
                                              List<int> expiryDate = CardUtils.getExpiryDate(value!);
                                              _paymentCard.month = expiryDate[0];
                                              _paymentCard.year = expiryDate[1];
                                            },
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    30.0, 30.5, 30.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                FFButtonWidget(
                                                  onPressed: () {
                                                    print('Button pressed ...');
                                                  },
                                                  text: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'm0mdulr1' /* Pay Now */,
                                                  ),
                                                  options: FFButtonOptions(
                                                    height: 40.0,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(50.0, 0.0,
                                                                50.0, 0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
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
                                                    borderSide: BorderSide(
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
