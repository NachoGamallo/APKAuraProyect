import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      if (prefs.containsKey('ff_actualUser')) {
        try {
          final serializedData = prefs.getString('ff_actualUser') ?? '{}';
          _actualUser =
              UserDataStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  CreationUserStruct _actualRegister = CreationUserStruct();
  CreationUserStruct get actualRegister => _actualRegister;
  set actualRegister(CreationUserStruct value) {
    _actualRegister = value;
  }

  void updateActualRegisterStruct(Function(CreationUserStruct) updateFn) {
    updateFn(_actualRegister);
  }

  UserDataStruct _actualUser = UserDataStruct();
  UserDataStruct get actualUser => _actualUser;
  set actualUser(UserDataStruct value) {
    _actualUser = value;
    prefs.setString('ff_actualUser', value.serialize());
  }

  void updateActualUserStruct(Function(UserDataStruct) updateFn) {
    updateFn(_actualUser);
    prefs.setString('ff_actualUser', _actualUser.serialize());
  }

  ExerciseDetailsStruct _actualExerciseDetails = ExerciseDetailsStruct();
  ExerciseDetailsStruct get actualExerciseDetails => _actualExerciseDetails;
  set actualExerciseDetails(ExerciseDetailsStruct value) {
    _actualExerciseDetails = value;
  }

  void updateActualExerciseDetailsStruct(
      Function(ExerciseDetailsStruct) updateFn) {
    updateFn(_actualExerciseDetails);
  }

  List<ExerciseSumaryStruct> _AllExercises = [];
  List<ExerciseSumaryStruct> get AllExercises => _AllExercises;
  set AllExercises(List<ExerciseSumaryStruct> value) {
    _AllExercises = value;
  }

  void addToAllExercises(ExerciseSumaryStruct value) {
    AllExercises.add(value);
  }

  void removeFromAllExercises(ExerciseSumaryStruct value) {
    AllExercises.remove(value);
  }

  void removeAtIndexFromAllExercises(int index) {
    AllExercises.removeAt(index);
  }

  void updateAllExercisesAtIndex(
    int index,
    ExerciseSumaryStruct Function(ExerciseSumaryStruct) updateFn,
  ) {
    AllExercises[index] = updateFn(_AllExercises[index]);
  }

  void insertAtIndexInAllExercises(int index, ExerciseSumaryStruct value) {
    AllExercises.insert(index, value);
  }

  CreateRoutineStruct _creationOfARoutine = CreateRoutineStruct();
  CreateRoutineStruct get creationOfARoutine => _creationOfARoutine;
  set creationOfARoutine(CreateRoutineStruct value) {
    _creationOfARoutine = value;
  }

  void updateCreationOfARoutineStruct(Function(CreateRoutineStruct) updateFn) {
    updateFn(_creationOfARoutine);
  }

  List<RoutineCreatorWithExerciseDataStruct> _RoutineCreatorWithExerciseData =
      [];
  List<RoutineCreatorWithExerciseDataStruct>
      get RoutineCreatorWithExerciseData => _RoutineCreatorWithExerciseData;
  set RoutineCreatorWithExerciseData(
      List<RoutineCreatorWithExerciseDataStruct> value) {
    _RoutineCreatorWithExerciseData = value;
  }

  void addToRoutineCreatorWithExerciseData(
      RoutineCreatorWithExerciseDataStruct value) {
    RoutineCreatorWithExerciseData.add(value);
  }

  void removeFromRoutineCreatorWithExerciseData(
      RoutineCreatorWithExerciseDataStruct value) {
    RoutineCreatorWithExerciseData.remove(value);
  }

  void removeAtIndexFromRoutineCreatorWithExerciseData(int index) {
    RoutineCreatorWithExerciseData.removeAt(index);
  }

  void updateRoutineCreatorWithExerciseDataAtIndex(
    int index,
    RoutineCreatorWithExerciseDataStruct Function(
            RoutineCreatorWithExerciseDataStruct)
        updateFn,
  ) {
    RoutineCreatorWithExerciseData[index] =
        updateFn(_RoutineCreatorWithExerciseData[index]);
  }

  void insertAtIndexInRoutineCreatorWithExerciseData(
      int index, RoutineCreatorWithExerciseDataStruct value) {
    RoutineCreatorWithExerciseData.insert(index, value);
  }

  List<RoutineStruct> _UserRoutines = [];
  List<RoutineStruct> get UserRoutines => _UserRoutines;
  set UserRoutines(List<RoutineStruct> value) {
    _UserRoutines = value;
  }

  void addToUserRoutines(RoutineStruct value) {
    UserRoutines.add(value);
  }

  void removeFromUserRoutines(RoutineStruct value) {
    UserRoutines.remove(value);
  }

  void removeAtIndexFromUserRoutines(int index) {
    UserRoutines.removeAt(index);
  }

  void updateUserRoutinesAtIndex(
    int index,
    RoutineStruct Function(RoutineStruct) updateFn,
  ) {
    UserRoutines[index] = updateFn(_UserRoutines[index]);
  }

  void insertAtIndexInUserRoutines(int index, RoutineStruct value) {
    UserRoutines.insert(index, value);
  }

  RoutineStruct _ActiveRoutine = RoutineStruct();
  RoutineStruct get ActiveRoutine => _ActiveRoutine;
  set ActiveRoutine(RoutineStruct value) {
    _ActiveRoutine = value;
  }

  void updateActiveRoutineStruct(Function(RoutineStruct) updateFn) {
    updateFn(_ActiveRoutine);
  }

  ActualSessionStruct _ActualSession = ActualSessionStruct();
  ActualSessionStruct get ActualSession => _ActualSession;
  set ActualSession(ActualSessionStruct value) {
    _ActualSession = value;
  }

  void updateActualSessionStruct(Function(ActualSessionStruct) updateFn) {
    updateFn(_ActualSession);
  }

  ExerciseReportInfoStruct _ExerciseWeightReport = ExerciseReportInfoStruct();
  ExerciseReportInfoStruct get ExerciseWeightReport => _ExerciseWeightReport;
  set ExerciseWeightReport(ExerciseReportInfoStruct value) {
    _ExerciseWeightReport = value;
  }

  void updateExerciseWeightReportStruct(
      Function(ExerciseReportInfoStruct) updateFn) {
    updateFn(_ExerciseWeightReport);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
