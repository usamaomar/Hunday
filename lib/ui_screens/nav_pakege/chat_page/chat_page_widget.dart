import 'package:firebase_messaging/firebase_messaging.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
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

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final TextEditingController _textEditingController = TextEditingController();
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatPageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();
    _textEditingController.dispose();

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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // StreamBuilder<QuerySnapshot>(
              //     stream:
              //     FirebaseFirestore.instance.collection('msgs').snapshots(),
              //     builder: (BuildContext context,
              //         AsyncSnapshot<QuerySnapshot> snapshot) {
              //       if (snapshot.hasData) {
              //         final listMessages = snapshot.data!.docs;
              //         if (listMessages.isNotEmpty) {
              //           return ListView.builder(
              //               padding: const EdgeInsets.all(10),
              //               itemCount: snapshot.data?.docs.length,
              //               reverse: true,
              //               itemBuilder: (context, index) {
              //
              //                 return Container(child : Text('${snapshot.data?.docs[index].data().toString()}'));
              //               });
              //         } else {
              //           return const Center(
              //             child: Text('No messages...'),
              //           );
              //         }
              //       } else {
              //         return Container();
              //       }
              //     }),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _textEditingController,
                        decoration: InputDecoration(
                          hintText: 'Type a message',
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.send),
                      onPressed: () => _sendMessage(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _sendMessage() async {
    final text = _textEditingController.text.trim();
    if (text.isNotEmpty) {
      try {
        // await FirebaseMessaging.instance('msgs').add({
        //   'msg': text,
        //   'time': FieldValue.serverTimestamp(),
        // });
        messaging.setAutoInitEnabled(true);

       final dat =  await    messaging.subscribeToTopic(
           '/msgs'
        ).catchError((error){
          error.toString();
        }).then((value) => {
          print("")
        });

       dat.add("value");

        _textEditingController.clear();
      } catch (e) {
        print('Error sending message: $e');
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Error'),
              content: Text('Failed to send message. Please try again.'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      }
    }
  }
}
