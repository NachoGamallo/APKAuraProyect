import '/flutter_flow/flutter_flow_util.dart';
import 'custom_send_data_message_double_widget.dart'
    show CustomSendDataMessageDoubleWidget;
import 'package:flutter/material.dart';

class CustomSendDataMessageDoubleModel
    extends FlutterFlowModel<CustomSendDataMessageDoubleWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
