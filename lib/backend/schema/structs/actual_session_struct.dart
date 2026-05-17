// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ActualSessionStruct extends BaseStruct {
  ActualSessionStruct({
    String? routineId,
    int? durationSeconds,
    List<RoutineExerciseStruct>? exercises,
  })  : _routineId = routineId,
        _durationSeconds = durationSeconds,
        _exercises = exercises;

  // "routineId" field.
  String? _routineId;
  String get routineId => _routineId ?? '';
  set routineId(String? val) => _routineId = val;

  bool hasRoutineId() => _routineId != null;

  // "durationSeconds" field.
  int? _durationSeconds;
  int get durationSeconds => _durationSeconds ?? 0;
  set durationSeconds(int? val) => _durationSeconds = val;

  void incrementDurationSeconds(int amount) =>
      durationSeconds = durationSeconds + amount;

  bool hasDurationSeconds() => _durationSeconds != null;

  // "exercises" field.
  List<RoutineExerciseStruct>? _exercises;
  List<RoutineExerciseStruct> get exercises => _exercises ?? const [];
  set exercises(List<RoutineExerciseStruct>? val) => _exercises = val;

  void updateExercises(Function(List<RoutineExerciseStruct>) updateFn) {
    updateFn(_exercises ??= []);
  }

  bool hasExercises() => _exercises != null;

  static ActualSessionStruct fromMap(Map<String, dynamic> data) =>
      ActualSessionStruct(
        routineId: data['routineId'] as String?,
        durationSeconds: castToType<int>(data['durationSeconds']),
        exercises: getStructList(
          data['exercises'],
          RoutineExerciseStruct.fromMap,
        ),
      );

  static ActualSessionStruct? maybeFromMap(dynamic data) => data is Map
      ? ActualSessionStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'routineId': _routineId,
        'durationSeconds': _durationSeconds,
        'exercises': _exercises?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'routineId': serializeParam(
          _routineId,
          ParamType.String,
        ),
        'durationSeconds': serializeParam(
          _durationSeconds,
          ParamType.int,
        ),
        'exercises': serializeParam(
          _exercises,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static ActualSessionStruct fromSerializableMap(Map<String, dynamic> data) =>
      ActualSessionStruct(
        routineId: deserializeParam(
          data['routineId'],
          ParamType.String,
          false,
        ),
        durationSeconds: deserializeParam(
          data['durationSeconds'],
          ParamType.int,
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
  String toString() => 'ActualSessionStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ActualSessionStruct &&
        routineId == other.routineId &&
        durationSeconds == other.durationSeconds &&
        listEquality.equals(exercises, other.exercises);
  }

  @override
  int get hashCode =>
      const ListEquality().hash([routineId, durationSeconds, exercises]);
}

ActualSessionStruct createActualSessionStruct({
  String? routineId,
  int? durationSeconds,
}) =>
    ActualSessionStruct(
      routineId: routineId,
      durationSeconds: durationSeconds,
    );
