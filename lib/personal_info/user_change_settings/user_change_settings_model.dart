import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'user_change_settings_widget.dart' show UserChangeSettingsWidget;
import 'package:flutter/material.dart';

class UserChangeSettingsModel
    extends FlutterFlowModel<UserChangeSettingsWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (GetUserData)] action in Text widget.
  ApiCallResponse? userDataOutput;
  // Stores action output result for [Backend Call - API (ChangeUserImg)] action in Text widget.
  ApiCallResponse? resultImgChange;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
