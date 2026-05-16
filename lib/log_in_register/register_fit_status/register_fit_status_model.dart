import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'register_fit_status_widget.dart' show RegisterFitStatusWidget;
import 'package:flutter/material.dart';

class RegisterFitStatusModel extends FlutterFlowModel<RegisterFitStatusWidget> {
  ///  Local state fields for this page.

  int? selectedObjetive = 0;

  ///  State fields for stateful widgets in this page.

  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  // Stores action output result for [Backend Call - API (Register)] action in Button widget.
  ApiCallResponse? registerToken;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
