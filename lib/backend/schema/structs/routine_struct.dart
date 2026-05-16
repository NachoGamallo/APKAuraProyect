// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RoutineStruct extends BaseStruct {
  RoutineStruct({
    String? routineId,
    String? routineName,
    String? routineDesc,
    List<RoutineExerciseStruct>? exercises,
  })  : _routineId = routineId,
        _routineName = routineName,
        _routineDesc = routineDesc,
        _exercises = exercises;

  // "routineId" field.
  String? _routineId;
  String get routineId => _routineId ?? '';
  set routineId(String? val) => _routineId = val;

  bool hasRoutineId() => _routineId != null;

  // "routineName" field.
  String? _routineName;
  String get routineName => _routineName ?? '';
  set routineName(String? val) => _routineName = val;

  bool hasRoutineName() => _routineName != null;

  // "routineDesc" field.
  String? _routineDesc;
  String get routineDesc => _routineDesc ?? '';
  set routineDesc(String? val) => _routineDesc = val;

  bool hasRoutineDesc() => _routineDesc != null;

  // "exercises" field.
  List<RoutineExerciseStruct>? _exercises;
  List<RoutineExerciseStruct> get exercises => _exercises ?? const [];
  set exercises(List<RoutineExerciseStruct>? val) => _exercises = val;

  void updateExercises(Function(List<RoutineExerciseStruct>) updateFn) {
    updateFn(_exercises ??= []);
  }

  bool hasExercises() => _exercises != null;

  static RoutineStruct fromMap(Map<String, dynamic> data) => RoutineStruct(
        routineId: data['routineId'] as String?,
        routineName: data['routineName'] as String?,
        routineDesc: data['routineDesc'] as String?,
        exercises: getStructList(
          data['exercises'],
          RoutineExerciseStruct.fromMap,
        ),
      );

  static RoutineStruct? maybeFromMap(dynamic data) =>
      data is Map ? RoutineStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'routineId': _routineId,
        'routineName': _routineName,
        'routineDesc': _routineDesc,
        'exercises': _exercises?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'routineId': serializeParam(
          _routineId,
          ParamType.String,
        ),
        'routineName': serializeParam(
          _routineName,
          ParamType.String,
        ),
        'routineDesc': serializeParam(
          _routineDesc,
          ParamType.String,
        ),
        'exercises': serializeParam(
          _exercises,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static RoutineStruct fromSerializableMap(Map<String, dynamic> data) =>
      RoutineStruct(
        routineId: deserializeParam(
          data['routineId'],
          ParamType.String,
          false,
        ),
        routineName: deserializeParam(
          data['routineName'],
          ParamType.String,
          false,
        ),
        routineDesc: deserializeParam(
          data['routineDesc'],
          ParamType.String,
          false,
        ),
        exercises: deserializeStructParam<RoutineExerciseStruct>(
          data['exercises'],
          ParamType.DataStruct,
          true,
          structBuilder: RoutineExerciseStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'RoutineStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is RoutineStruct &&
        routineId == other.routineId &&
        routineName == other.routineName &&
        routineDesc == other.routineDesc &&
        listEquality.equals(exercises, other.exercises);
  }

  @override
  int get hashCode => const ListEquality()
      .hash([routineId, routineName, routineDesc, exercises]);
}

RoutineStruct createRoutineStruct({
  String? routineId,
  String? routineName,
  String? routineDesc,
}) =>
    RoutineStruct(
      routineId: routineId,
      routineName: routineName,
      routineDesc: routineDesc,
    );
