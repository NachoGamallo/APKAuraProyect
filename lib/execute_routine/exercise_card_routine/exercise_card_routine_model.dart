import '/backend/schema/structs/index.dart';
import '/components/row_serie/row_serie_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'exercise_card_routine_widget.dart' show ExerciseCardRoutineWidget;
import 'package:flutter/material.dart';

class ExerciseCardRoutineModel
    extends FlutterFlowModel<ExerciseCardRoutineWidget> {
  ///  Local state fields for this component.

  RoutineExerciseStruct? dataToModificate;
  void updateDataToModificateStruct(Function(RoutineExerciseStruct) updateFn) {
    updateFn(dataToModificate ??= RoutineExerciseStruct());
  }

  ///  State fields for stateful widgets in this component.

  // Models for RowSerie dynamic component.
  late FlutterFlowDynamicModels<RowSerieModel> rowSerieModels;

  @override
  void initState(BuildContext context) {
    rowSerieModels = FlutterFlowDynamicModels(() => RowSerieModel());
  }

  @override
  void dispose() {
    rowSerieModels.dispose();
  }
}
