import '/backend/api_requests/api_calls.dart';
import '/execute_routine/exercise_card_routine/exercise_card_routine_widget.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'execute_routine_widget.dart' show ExecuteRoutineWidget;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';

class ExecuteRoutineModel extends FlutterFlowModel<ExecuteRoutineWidget> {
  ///  Local state fields for this page.

  int? actualTimmer = 0;

  ///  State fields for stateful widgets in this page.

  // State field(s) for Timer widget.
  final timerInitialTimeMs = 0;
  int timerMilliseconds = 0;
  String timerValue = StopWatchTimer.getDisplayTime(
    0,
    hours: false,
    milliSecond: false,
  );
  FlutterFlowTimerController timerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countUp));

  // Stores action output result for [Backend Call - API (SaveSessionData)] action in Button widget.
  ApiCallResponse? apiEndSession;
  // Models for ExerciseCardRoutine dynamic component.
  late FlutterFlowDynamicModels<ExerciseCardRoutineModel>
      exerciseCardRoutineModels;

  @override
  void initState(BuildContext context) {
    exerciseCardRoutineModels =
        FlutterFlowDynamicModels(() => ExerciseCardRoutineModel());
  }

  @override
  void dispose() {
    timerController.dispose();
    exerciseCardRoutineModels.dispose();
  }
}
