import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/nav_bar/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'routines_screen_widget.dart' show RoutinesScreenWidget;
import 'package:flutter/material.dart';

class RoutinesScreenModel extends FlutterFlowModel<RoutinesScreenWidget> {
  ///  Local state fields for this page.

  List<RoutineBasicDataStruct> routines = [];
  void addToRoutines(RoutineBasicDataStruct item) => routines.add(item);
  void removeFromRoutines(RoutineBasicDataStruct item) => routines.remove(item);
  void removeAtIndexFromRoutines(int index) => routines.removeAt(index);
  void insertAtIndexInRoutines(int index, RoutineBasicDataStruct item) =>
      routines.insert(index, item);
  void updateRoutinesAtIndex(
          int index, Function(RoutineBasicDataStruct) updateFn) =>
      routines[index] = updateFn(routines[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (getRoutinesOfUser)] action in RoutinesScreen widget.
  ApiCallResponse? apiGetRoutines;
  // Stores action output result for [Backend Call - API (GetRoutineById)] action in Container widget.
  ApiCallResponse? apiGetRoutineById;
  // Model for NavBar component.
  late NavBarModel navBarModel;

  @override
  void initState(BuildContext context) {
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    navBarModel.dispose();
  }
}
