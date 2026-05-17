import '/backend/api_requests/api_calls.dart';
import '/components/exercice_component/exercice_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'exercices_screen_widget.dart' show ExercicesScreenWidget;
import 'package:flutter/material.dart';

class ExercicesScreenModel extends FlutterFlowModel<ExercicesScreenWidget> {
  ///  Local state fields for this page.

  int? selectedExercices = 0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (GetExerciseSummary)] action in ExercicesScreen widget.
  ApiCallResponse? summaryExercises;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Models for ExerciceComponent dynamic component.
  late FlutterFlowDynamicModels<ExerciceComponentModel> exerciceComponentModels;

  @override
  void initState(BuildContext context) {
    exerciceComponentModels =
        FlutterFlowDynamicModels(() => ExerciceComponentModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    exerciceComponentModels.dispose();
  }
}
