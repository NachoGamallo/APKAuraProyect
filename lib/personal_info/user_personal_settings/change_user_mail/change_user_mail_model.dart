import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'change_user_mail_widget.dart' show ChangeUserMailWidget;
import 'package:flutter/material.dart';

class ChangeUserMailModel extends FlutterFlowModel<ChangeUserMailWidget> {
  ///  Local state fields for this page.

  Color buttomColor = Color(4289901244);

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (UpdateUserEmail)] action in Button widget.
  ApiCallResponse? resultEmail;
  // Stores action output result for [Backend Call - API (GetUserData)] action in Button widget.
  ApiCallResponse? dataUser;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
