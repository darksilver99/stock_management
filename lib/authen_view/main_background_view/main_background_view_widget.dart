import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'main_background_view_model.dart';
export 'main_background_view_model.dart';

class MainBackgroundViewWidget extends StatefulWidget {
  const MainBackgroundViewWidget({super.key});

  @override
  State<MainBackgroundViewWidget> createState() =>
      _MainBackgroundViewWidgetState();
}

class _MainBackgroundViewWidgetState extends State<MainBackgroundViewWidget> {
  late MainBackgroundViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MainBackgroundViewModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: Image.asset(
                  'assets/images/10108800_17876756_(1).jpg',
                ).image,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Color(0x8E000000),
            ),
          ),
        ],
      ),
    );
  }
}
