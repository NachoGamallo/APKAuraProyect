import '/flutter_flow/flutter_flow_util.dart';
import 'custom_send_data_message_integer_widget.dart'
    show CustomSendDataMessageIntegerWidget;
import 'package:flutter/material.dart';

class CustomSendDataMessageIntegerModel
    extends FlutterFlowModel<CustomSendDataMessageIntegerWidget> {
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
