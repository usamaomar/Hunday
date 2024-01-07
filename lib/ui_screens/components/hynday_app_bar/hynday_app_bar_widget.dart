import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'hynday_app_bar_model.dart';
export 'hynday_app_bar_model.dart';

class HyndayAppBarWidget extends StatefulWidget {
  const HyndayAppBarWidget({
    Key? key,
    required this.appBarTitle,
    this.isMyProfileOpend,
  }) : super(key: key);

  final String? appBarTitle;
  final bool? isMyProfileOpend;

  @override
  _HyndayAppBarWidgetState createState() => _HyndayAppBarWidgetState();
}

class _HyndayAppBarWidgetState extends State<HyndayAppBarWidget> {
  late HyndayAppBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HyndayAppBarModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
      child: ClipRRect(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                color: FlutterFlowTheme.of(context).secondaryBackground,
                elevation: 15.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0.0),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 30.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            if (widget.isMyProfileOpend != true) {
                              context.pushNamed(
                                'MyProfilePage',
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: TransitionInfo(
                                    hasTransition: true,
                                    transitionType: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 0),
                                  ),
                                },
                              );
                            }
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(0.0),
                            child: SvgPicture.asset(
                              'assets/images/Group_70676.svg',
                              width: 40.0,
                              height: 40.0,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          showGeneralDialog(
                            context: context,
                            barrierDismissible: true,
                            transitionDuration: Duration(milliseconds: 500),
                            barrierLabel:
                                MaterialLocalizations.of(context).dialogLabel,
                            barrierColor: Colors.black.withOpacity(0),
                            pageBuilder: (context, _, __) {
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    child: Card(
                                      child: ListView(
                                        primary: false,
                                        shrinkWrap: true,
                                        children: <Widget>[
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                15, 20, 15, 20),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getVariableText(
                                                    enText: 'Notifications',
                                                    arText: 'الاشعارات',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'HeeboBold',
                                                        color:
                                                            Color(0xFF092853),
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        useGoogleFonts: false,
                                                      ),
                                                ),
                                                InkWell(
                                                  onTap: (){
                                                    context.safePop();
                                                  },
                                                  child: Icon(
                                                    Icons.close_outlined,
                                                    color: Color(0xFF3D6398),
                                                    size: 24.0,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Container(
                                            width: 200,
                                            margin: EdgeInsets.fromLTRB(
                                                20, 0, 20, 0),
                                            height: 1,
                                            color: Color(0xFF3D6398),
                                          ),
                                          ListTile(
                                            leading: Icon(
                                              Icons.notifications,
                                              color: Color(0xFF3D6398),
                                              size: 24.0,
                                            ),
                                            title: Text('Item 1'),
                                            onTap: () => Navigator.of(context)
                                                .pop('item1'),
                                            subtitle: Text('Item 1' ,style: FlutterFlowTheme.of(
                                                context)
                                                .bodyMedium
                                                .override(
                                              fontFamily: 'Rajdhani',
                                              color:
                                              Color(0xFF092853),
                                              fontSize: 12,
                                              fontWeight:
                                              FontWeight.normal,
                                              useGoogleFonts: false,
                                            )),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                            transitionBuilder: (context, animation,
                                secondaryAnimation, child) {
                              return SlideTransition(
                                position: CurvedAnimation(
                                  parent: animation,
                                  curve: Curves.easeOut,
                                ).drive(Tween<Offset>(
                                  begin: Offset(0, -1.0),
                                  end: Offset.zero,
                                )),
                                child: child,
                              );
                            },
                          );
                        },
                        child: Icon(
                          Icons.notifications_sharp,
                          color: Color(0xFF092853),
                          size: 30.0,
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: SvgPicture.asset(
                                'assets/images/Group_70674.svg',
                                width: 80.0,
                                height: 20.0,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(30.0, 10.0, 30.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.safePop();
                      },
                      child: Icon(
                        Icons.keyboard_backspace,
                        color: Color(0xFF092853),
                        size: 40.0,
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                      child: Text(
                        widget.appBarTitle!,
                        style: TextStyle(
                          fontFamily: 'HeeboBold',
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0,
                        ),
                      ),
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
}
