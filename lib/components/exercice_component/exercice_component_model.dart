import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'exercice_component_widget.dart' show ExerciceComponentWidget;
import 'package:flutter/material.dart';

class ExerciceComponentModel extends FlutterFlowModel<ExerciceComponentWidget> {
  ///  Local state fields for this component.

  bool isSelected = false;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (GetExerciseDetails)] action in Icon widget.
  ApiCallResponse? apiExerciseDetails;
  // Stores action output result for [Backend Call - API (getReportExercise)] action in Icon widget.
  ApiCallResponse? apiReport;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
