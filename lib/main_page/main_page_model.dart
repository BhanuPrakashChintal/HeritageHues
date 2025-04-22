import '/flutter_flow/flutter_flow_util.dart';
import '/tiles/maintile/maintile_widget.dart';
import '/index.dart';
import 'main_page_widget.dart' show MainPageWidget;
import 'package:flutter/material.dart';

class MainPageModel extends FlutterFlowModel<MainPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for maintile component.
  late MaintileModel maintileModel;

  @override
  void initState(BuildContext context) {
    maintileModel = createModel(context, () => MaintileModel());
  }

  @override
  void dispose() {
    maintileModel.dispose();
  }
}
