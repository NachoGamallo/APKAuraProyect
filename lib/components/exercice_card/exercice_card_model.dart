import '/backend/schema/structs/index.dart';
import '/components/row_serie/row_serie_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'exercice_card_widget.dart' show ExerciceCardWidget;
import 'package:flutter/material.dart';

class ExerciceCardModel extends FlutterFlowModel<ExerciceCardWidget> {
  ///  Local state fields for this component.

  double? actualKG;

  int? actualReps;

  int? restSeconds = 0;

  RoutineCreatorWithExerciseDataStruct? dataToModificate;
  void updateDataToModificateStruct(
      Function(RoutineCreatorWithExerciseDataStruct) updateFn) {
    updateFn(dataToModificate ??= RoutineCreatorWithExerciseDataStruct());
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
