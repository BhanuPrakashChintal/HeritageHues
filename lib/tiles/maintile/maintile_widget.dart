import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'maintile_model.dart';
export 'maintile_model.dart';

class MaintileWidget extends StatefulWidget {
  const MaintileWidget({super.key});

  @override
  State<MaintileWidget> createState() => _MaintileWidgetState();
}

class _MaintileWidgetState extends State<MaintileWidget> {
  late MaintileModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MaintileModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            FFLocalizations.of(context).getText(
              'v9b9tw5w' /* HeritageHues */,
            ),
            style: FlutterFlowTheme.of(context).displaySmall.override(
                  fontFamily: 'Outfit',
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 30.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w500,
                ),
          ),
          InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              context.pushNamed(SearchpageWidget.routeName);
            },
            child: Container(
              width: 50.0,
              height: 50.0,
              decoration: BoxDecoration(
                color: Color(0x4D3DE182),
                shape: BoxShape.circle,
                border: Border.all(
                  color: FlutterFlowTheme.of(context).primary,
                  width: 2.0,
                ),
              ),
              child: Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Icon(
                  Icons.person,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 35.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
