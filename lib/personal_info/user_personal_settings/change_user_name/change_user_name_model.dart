import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'change_user_name_widget.dart' show ChangeUserNameWidget;
import 'package:flutter/material.dart';

class ChangeUserNameModel extends FlutterFlowModel<ChangeUserNameWidget> {
  ///  Local state fields for this page.

  Color buttomColor = Color(4289901244);

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (UpdateUserName)] action in Button widget.
  ApiCallResponse? resultName;
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
