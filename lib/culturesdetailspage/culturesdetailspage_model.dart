import '/flutter_flow/flutter_flow_util.dart';
import '/tiles/detailstile/detailstile_widget.dart';
import 'culturesdetailspage_widget.dart' show CulturesdetailspageWidget;
import 'package:flutter/material.dart';

class CulturesdetailspageModel
    extends FlutterFlowModel<CulturesdetailspageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for detailstile component.
  late DetailstileModel detailstileModel;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;

  @override
  void initState(BuildContext context) {
    detailstileModel = createModel(context, () => DetailstileModel());
  }

  @override
  void dispose() {
    detailstileModel.dispose();
  }
}
