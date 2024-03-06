import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:get/utils.dart';
import 'package:hyundai/ui_screens/components/select_image_or_take/select_image_or_take_widget.dart';
import '../../../flutter_flow/flutter_flow_animations.dart';
import '../../../flutter_flow/flutter_flow_icon_button.dart';
import '../../../flutter_flow/upload_data.dart';
import '../../components/select_image_or_take/select_image_or_take_model.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'chat_page_model.dart';
export 'chat_page_model.dart';

class ChatPageWidget extends StatefulWidget {
  const ChatPageWidget({super.key});

  @override
  State<ChatPageWidget> createState() => _ChatPageWidgetState();
}

class _ChatPageWidgetState extends State<ChatPageWidget> {
  late ChatPageModel _model;
  final mainRef = FirebaseDatabase.instance;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  ScrollController _controller = ScrollController();
  String _displayedDate = "";
  int mainValue = 0;
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  final animationsMap = {
    'newsBottomSheetComponentOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 100.ms,
          duration: 500.ms,
          begin: const Offset(0.0, 700.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatPageModel());
    _model.unfocusNode?.addListener(_onCvcFormFieldFocusChanged);
    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
    _controller.addListener(_scrollListener);

    mainRef
        .ref()
        .child("chat")
        .child('${FFAppState().userModel.id}')
        .child("admin_unread")
        .onValue
        .listen((event) {
      if (event.snapshot.exists) {
        _model.adminUnRead = event.snapshot.value as int;
      }
    });

    mainRef
        .ref()
        .child("chat")
        .child('${FFAppState().userModel.id}')
        .child("admin_unread_key")
        .onValue
        .listen((event) {
      if (event.snapshot.exists) {
        _model.adminUnReadKey = event.snapshot.value as String;
      }
    });

    final prefs = mainRef
        .ref()
        .child("chat")
        .child('${FFAppState().userModel.id}')
        .once();
    Map<dynamic, dynamic> mapValue = {};
    prefs.then((value) => {
          if (value.snapshot.exists)
            {
              mainRef
                  .ref()
                  .child("chat")
                  .child("${FFAppState().userModel.id}")
                  .update({"admin_unread": _model.adminUnRead ?? 1}),
            }
          else
            {
              mapValue['name'] = FFAppState().userModel.name,
              mapValue['admin'] = 0,
              mapValue['admin_unread'] = 0,
              mapValue['admin_unread_key'] = '',
              mapValue['user_unread'] = 0,
              mapValue['user_unread_key'] = '',
              mainRef
                  .ref()
                  .child("chat")
                  .set({"${FFAppState().userModel.id}": mapValue}),
            }
        });

    mainRef
        .ref()
        .child("chat")
        .child('${FFAppState().userModel.id}')
        .child("messages")
        .onValue
        .listen((event) {
      if (event.snapshot.exists) {
        _model.mapValue.clear();
        Map<dynamic, dynamic> maps =
            event.snapshot.value as Map<Object?, Object?>;
        maps.forEach((key, value) {
          _model.mapValue.add(value as Map<Object?, Object?>);
        });
        _model.mapValue.sort(
            (a, b) => a['time'].toString().compareTo(b['time'].toString()));
        _model.mapValue = _model.mapValue.reversed.toList();
        setState(() {});
      }
    });
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  void _onCvcFormFieldFocusChanged() {
    setState(() => (_model.unfocusNode?.hasFocus ?? false) ? true : false);
  }

  @override
  void dispose() {
    _model.dispose();
    _model.unfocusNode?.removeListener(_onCvcFormFieldFocusChanged);
    _model.unfocusNode?.dispose();
    _model.unfocusNode = null;
    _controller.removeListener(_scrollListener);
    _controller.dispose();
    super.dispose();
  }

  int calculateIndex(double scrollOffset, double itemHeight) {
    return (scrollOffset / itemHeight).floor();
  }

  void _scrollListener() {
    setState(() {
      // Get the first visible item index
      final index = _controller.position
          .pixels; // You may need to adjust this depending on your list item height
      // Update the displayed date based on the index or any other conditions you want
      int ind = calculateIndex(index, 50);
      print('ONE ${ind}');
      if (_model.mapValue.isNotEmpty) {
        _displayedDate = formatDate(
            _model.mapValue[ind % _model.mapValue.length]['time'].toString());
      }
    });
  }

  String formatDate(String timestampString) {
    int timestamp = int.tryParse(timestampString) ?? 0;
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);

    // Get current date without time
    DateTime currentDate = DateTime.now();
    DateTime previousDate = currentDate.subtract(Duration(days: 1));

    // Compare the provided date with current date to determine the appropriate string
    if (dateTime.year == currentDate.year &&
        dateTime.month == currentDate.month &&
        dateTime.day == currentDate.day) {
      return 'Today';
    } else if (dateTime.year == previousDate.year &&
        dateTime.month == previousDate.month &&
        dateTime.day == previousDate.day) {
      return 'Yesterday';
    } else {
      // Format the date as "dd/MM/yyyy"
      return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
    }
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
      onTap: () => _model.unfocusNode?.canRequestFocus ?? false
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        // key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).white,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: ListView.builder(
                    controller: _controller,
                    padding: const EdgeInsets.fromLTRB(5, 10, 5, 20),
                    itemCount: _model.mapValue.length,
                    reverse: true,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return _model.mapValue[index]['is_admin'] == false
                          ? Stack(
                              children: [
                                Visibility(
                                  visible: hasPassedAll(_model.mapValue[index]),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        margin:
                                            EdgeInsets.fromLTRB(0, 15, 0, 0),
                                        decoration: BoxDecoration(
                                          color: Color(0xFF092853),
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(50.0),
                                            bottomRight: Radius.circular(50.0),
                                            topLeft: Radius.circular(50.0),
                                            topRight: Radius.circular(50.0),
                                          ),
                                        ),
                                        padding:
                                            EdgeInsets.fromLTRB(20, 5, 20, 5),
                                        alignment: Alignment.center,
                                        child: Text(
                                          '${getDatea()}',
                                          style: TextStyle(
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  children: [
                                    Visibility(
                                      visible:
                                          hasNextAdmin(_model.mapValue, index),
                                      child: Padding(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              convertToAmBmFormat(_model
                                                  .mapValue[index]['time']
                                                  .toString()),
                                              textAlign: TextAlign.start,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Heebo',
                                                        color:
                                                            Color(0xFF092853),
                                                        fontSize: 12.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        useGoogleFonts: false,
                                                      ),
                                            ),
                                          ],
                                        ),
                                        padding:
                                            EdgeInsets.fromLTRB(10, 10, 10, 0),
                                      ),
                                    ),
                                    ChatBubble(
                                      clipper: ChatBubbleClipper5(
                                          radius: 50,
                                          type: BubbleType.sendBubble),
                                      alignment: Alignment.topRight,
                                      margin: EdgeInsets.only(top: 20),
                                      backGroundColor: Color(0xffECF3FB),
                                      child: Container(
                                        margin:
                                            EdgeInsets.fromLTRB(30, 10, 30, 0),
                                        constraints: BoxConstraints(
                                          maxWidth: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.7,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(50.0),
                                            bottomRight: Radius.circular(50.0),
                                            topLeft: Radius.circular(50.0),
                                            topRight: Radius.circular(50.0),
                                          ),
                                        ),
                                        child: Text(
                                          "${_model.mapValue[index]['body']}",
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          : Column(
                              children: [
                                Visibility(
                                  visible: hasNextUser(_model.mapValue, index),
                                  child: Padding(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          convertToAmBmFormat(_model
                                              .mapValue[index]['time']
                                              .toString()),
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Heebo',
                                                color: Color(0xFF092853),
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.normal,
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                      ],
                                    ),
                                    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                                  ),
                                ),
                                ChatBubble(
                                  clipper: ChatBubbleClipper5(
                                      type: BubbleType.receiverBubble),
                                  backGroundColor: Color(0xffC1D6EF),
                                  margin: EdgeInsets.only(top: 20),
                                  child: Container(
                                    constraints: BoxConstraints(
                                      maxWidth:
                                          MediaQuery.of(context).size.width *
                                              0.7,
                                    ),
                                    child: Text(
                                      "${_model.mapValue[index]['body']}",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ),
                              ],
                            );
                    }),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(30.0, 10.0, 30.0, 20.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFECECEC),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50.0),
                      bottomRight: Radius.circular(50.0),
                      topLeft: Radius.circular(50.0),
                      topRight: Radius.circular(50.0),
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              5.0, 0.0, 5.0, 0.0),
                          child: TextFormField(
                            controller: _model.textController,
                            focusNode: _model.textFieldFocusNode,
                            textInputAction: TextInputAction.send,
                            obscureText: false,
                            decoration: InputDecoration(
                              hintText: FFLocalizations.of(context).getText(
                                'u6fjtru6' /* Message ... */,
                              ),
                              labelStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'HeeboBold',
                                    color: Color(0xFF092853),
                                    fontSize: 13.0,
                                    useGoogleFonts: false,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x0092853),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(0),
                              ),
                              hintStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .copyWith(color: Color(0xFF1C4494)),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x0092853),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x0092853),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x0092853),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(0),
                              ),
                              filled: true,
                              fillColor: Color(0x0092853),
                              contentPadding:
                                  EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  color: Color(0xFF092853),
                                ),
                            validator: _model.textControllerValidator
                                .asValidator(context),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          InkWell(
                            onTap: () async {
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                enableDrag: false,
                                context: context,
                                builder: (context) {
                                  return Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: SelectImageOrTakeWidget(
                                      onPressedFromCamera: () {
                                        attachFile(context);
                                      },
                                      onPressedFromGallary: () {
                                        fromGallary(context);
                                      },
                                    ),
                                  );
                                },
                              ).then((value) => safeSetState(() {}));
                            },
                            child: Transform.rotate(
                              angle: 0.6632,
                              child: Icon(
                                Icons.attach_file,
                                color: Color(0xFF3D6398),
                                size: 24.0,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                5.0, 5.0, 15.0, 5.0),
                            child: FlutterFlowIconButton(
                              borderColor: Color(0xFF3D6398),
                              borderRadius: 25.0,
                              borderWidth: 1.0,
                              buttonSize: 41.0,
                              fillColor: Color(0xFF3D6398),
                              icon: Icon(
                                Icons.send_rounded,
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                size: 24.0,
                              ),
                              onPressed: () {
                                _sendMessage();
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void attachFile(BuildContext contextBuild) async {
    final selectedMedia = await selectMedia(
      multiImage: false,
    );
    if (selectedMedia != null &&
        selectedMedia
            .every((m) => validateFileFormat(m.storagePath, context))) {
      setState(() => _model.isDataUploading1 = true);
      var selectedUploadedFiles = <FFUploadedFile>[];
      try {
        selectedUploadedFiles = selectedMedia
            .map((m) => FFUploadedFile(
                  name: m.storagePath.split('/').last,
                  bytes: m.bytes,
                  height: m.dimensions?.height,
                  width: m.dimensions?.width,
                  blurHash: m.blurHash,
                ))
            .toList();
      } finally {
        _model.isDataUploading1 = false;
      }
      if (selectedUploadedFiles.length == selectedMedia.length) {
        setState(() {
          _model.uploadedLocalFile1 = selectedUploadedFiles.first;
        });
      } else {
        setState(() {});
        return;
      }
    }

    if (_model.uploadedLocalFile1.bytes?.isNotEmpty ?? false) {
      Navigator.pop(contextBuild);
      // setState(() {
      //   _model.frontFaceImage =
      //       _model.uploadedLocalFile1;
      // });
      // setState(() {
      //   _model.isFrontFaceAdded = true;
      // });
    }
  }


  void fromGallary(BuildContext contextBuild) async{
    final selectedFiles = await selectFiles(
      multiFile: false,
    );
    if (selectedFiles != null) {
      setState(() =>
      _model.isDataUploading1 = true);
      var selectedUploadedFiles =
      <FFUploadedFile>[];

      try {
        selectedUploadedFiles =
            selectedFiles
                .map((m) => FFUploadedFile(
              name: m.storagePath
                  .split('/')
                  .last,
              bytes: m.bytes,
            ))
                .toList();
      } finally {
        _model.isDataUploading1 = false;
      }
      if (selectedUploadedFiles.length ==
          selectedFiles.length) {
        setState(() {
          _model.uploadedLocalFile1 =
              selectedUploadedFiles.first;
        });
      } else {
        setState(() {});
        return;
      }
    }
    if (_model.uploadedLocalFile1.bytes?.isNotEmpty ?? false) {
      Navigator.pop(contextBuild);
    }
  }

  String? key = '';

  void _sendMessage() async {
    final text = _model.textController.text;
    if (text.isNotEmpty) {
      Map<String, dynamic> mapValue = {};
      mapValue['admin_unread'] =
          _model.adminUnRead = (_model.adminUnRead ?? 0) + 1;
      mainRef
          .ref()
          .child("chat")
          .child('${FFAppState().userModel.id}')
          .update(mapValue);

      Map<dynamic, dynamic> keyMap = {};
      keyMap['body'] = text;
      keyMap['type'] = 'text';
      keyMap['time'] = DateTime.now().millisecondsSinceEpoch.toString();
      keyMap['is_admin'] = false;
      keyMap['read'] = false;

      final vmm = mainRef
          .ref()
          .child("chat")
          .child('${FFAppState().userModel.id}')
          .child('messages')
          .push();
      key = vmm.key;
      vmm.set(keyMap);
      setState(() {
        _model.textController.text = '';
      });

      Map<String, dynamic> mapValues = {};
      if (_model.adminUnReadKey?.isEmpty ?? true) {
        mapValues['admin_unread_key'] = key;
      }
      mainRef
          .ref()
          .child("chat")
          .child('${FFAppState().userModel.id}')
          .update(mapValues);
    }
  }

  String convertToAmBmFormat(String timestampString) {
    int timestamp = int.tryParse(timestampString) ?? 0;
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
    String formattedTime =
        "${dateTime.hour < 10 ? '0' : ''}${dateTime.hour % 12}:${dateTime.minute < 10 ? '0' : ''}${dateTime.minute} ${dateTime.hour < 12 ? 'am' : 'pm'}";
    return formattedTime;
  }

  bool hasNextAdmin(List<Map<Object?, Object?>> mapValue, int index) {
    if (index >= 0 && index < mapValue.length - 1) {
      if (mapValue[index + 1]['is_admin'] == true) {
        if (mapValue[index]['is_admin'] == false) {
          return true;
        }
      }
    }
    return false;
  }

  bool hasPassedAll(Map<Object?, Object?> mapValue) {
    DateTime dateFromService = DateTime.fromMillisecondsSinceEpoch(mainValue);
    DateTime dateFromList = DateTime.fromMillisecondsSinceEpoch(
        int.parse(mapValue['time'].toString()));
    DateTime dateFromServiceSaved = DateTime(
        dateFromService.year, dateFromService.month, dateFromService.day);
    DateTime dateFromListSaved =
        DateTime(dateFromList.year, dateFromList.month, dateFromList.day);
    if (dateFromServiceSaved.isAtSameMomentAs(dateFromListSaved)) {
      return false;
    } else {
      mainValue = int.parse(mapValue['time'].toString());
      return true;
    }
  }

  String getDatea() {
    DateTime dateFromService = DateTime.fromMillisecondsSinceEpoch(mainValue);
    return '${dateFromService.year}/${dateFromService.month}/${dateFromService.day}';
  }

  bool hasNextUser(List<Map<Object?, Object?>> mapValue, int index) {
    if (index >= 0 && index < mapValue.length - 1) {
      if (mapValue[index + 1]['is_admin'] == false) {
        return true;
      }
    }
    return false;
  }
}
