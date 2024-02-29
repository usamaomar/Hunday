import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'my_rating_component_model.dart';
export 'my_rating_component_model.dart';

class MyRatingComponentWidget extends StatefulWidget {
  const MyRatingComponentWidget({super.key});

  @override
  State<MyRatingComponentWidget> createState() =>
      _MyRatingComponentWidgetState();
}

class _MyRatingComponentWidgetState extends State<MyRatingComponentWidget> {
  late MyRatingComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MyRatingComponentModel());

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

    return RatingBar.builder(
      onRatingUpdate: (newValue) =>
          setState(() => _model.ratingBarValue = newValue),
      itemBuilder: (context, index) => Icon(
        Icons.star_rounded,
        color: Color(0xFF092853),
      ),
      direction: Axis.horizontal,
      initialRating: _model.ratingBarValue ??= 5.0,
      unratedColor: FlutterFlowTheme.of(context).accent3,
      itemCount: 5,
      itemSize: 20.0,
      glowColor: Color(0xFF092853),
    );
  }
}
