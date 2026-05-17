import '/backend/api_requests/api_calls.dart';
import '/components/exercice_card/exercice_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'create_routine_screen_widget.dart' show CreateRoutineScreenWidget;
import 'package:flutter/material.dart';

class CreateRoutineScreenModel
    extends FlutterFlowModel<CreateRoutineScreenWidget> {
  ///  Local state fields for this page.

  int? countExercices = 0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (CreateRoutine)] action in Button widget.
  ApiCallResponse? apiCreateRoutine;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // Models for ExerciceCard dynamic component.
  late FlutterFlowDynamicModels<ExerciceCardModel> exerciceCardModels;

  @override
  void initState(BuildContext context) {
    exerciceCardModels = FlutterFlowDynamicModels(() => ExerciceCardModel());
  }

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    exerciceCardModels.dispose();
  }
}
