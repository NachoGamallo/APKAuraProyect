// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RoutineExerciseCreationStruct extends BaseStruct {
  RoutineExerciseCreationStruct({
    String? exerciseId,
    int? position,
    int? sets,
    int? reps,
    int? restSeconds,
    double? initialWeight,
  })  : _exerciseId = exerciseId,
        _position = position,
        _sets = sets,
        _reps = reps,
        _restSeconds = restSeconds,
        _initialWeight = initialWeight;

  // "exerciseId" field.
  String? _exerciseId;
  String get exerciseId => _exerciseId ?? '';
  set exerciseId(String? val) => _exerciseId = val;

  bool hasExerciseId() => _exerciseId != null;

  // "position" field.
  int? _position;
  int get position => _position ?? 0;
  set position(int? val) => _position = val;

  void incrementPosition(int amount) => position = position + amount;

  bool hasPosition() => _position != null;

  // "sets" field.
  int? _sets;
  int get sets => _sets ?? 0;
  set sets(int? val) => _sets = val;

  void incrementSets(int amount) => sets = sets + amount;

  bool hasSets() => _sets != null;

  // "reps" field.
  int? _reps;
  int get reps => _reps ?? 0;
  set reps(int? val) => _reps = val;

  void incrementReps(int amount) => reps = reps + amount;

  bool hasReps() => _reps != null;

  // "restSeconds" field.
  int? _restSeconds;
  int get restSeconds => _restSeconds ?? 0;
  set restSeconds(int? val) => _restSeconds = val;

  void incrementRestSeconds(int amount) => restSeconds = restSeconds + amount;

  bool hasRestSeconds() => _restSeconds != null;

  // "initialWeight" field.
  double? _initialWeight;
  double get initialWeight => _initialWeight ?? 0.0;
  set initialWeight(double? val) => _initialWeight = val;

  void incrementInitialWeight(double amount) =>
      initialWeight = initialWeight + amount;

  bool hasInitialWeight() => _initialWeight != null;

  static RoutineExerciseCreationStruct fromMap(Map<String, dynamic> data) =>
      RoutineExerciseCreationStruct(
        exerciseId: data['exerciseId'] as String?,
        position: castToType<int>(data['position']),
        sets: castToType<int>(data['sets']),
        reps: castToType<int>(data['reps']),
        restSeconds: castToType<int>(data['restSeconds']),
        initialWeight: castToType<double>(data['initialWeight']),
      );

  static RoutineExerciseCreationStruct? maybeFromMap(dynamic data) =>
      data is Map
          ? RoutineExerciseCreationStruct.fromMap(data.cast<String, dynamic>())
          : null;

  Map<String, dynamic> toMap() => {
        'exerciseId': _exerciseId,
        'position': _position,
        'sets': _sets,
        'reps': _reps,
        'restSeconds': _restSeconds,
        'initialWeight': _initialWeight,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'exerciseId': serializeParam(
          _exerciseId,
          ParamType.String,
        ),
        'position': serializeParam(
          _position,
          ParamType.int,
        ),
        'sets': serializeParam(
          _sets,
          ParamType.int,
        ),
        'reps': serializeParam(
          _reps,
          ParamType.int,
        ),
        'restSeconds': serializeParam(
          _restSeconds,
          ParamType.int,
        ),
        'initialWeight': serializeParam(
          _initialWeight,
          ParamType.double,
        ),
      }.withoutNulls;

  static RoutineExerciseCreationStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      RoutineExerciseCreationStruct(
        exerciseId: deserializeParam(
          data['exerciseId'],
          ParamType.String,
          false,
        ),
        position: deserializeParam(
          data['position'],
          ParamType.int,
          false,
        ),
        sets: deserializeParam(
          data['sets'],
          ParamType.int,
          false,
        ),
        reps: deserializeParam(
          data['reps'],
          ParamType.int,
          false,
        ),
        restSeconds: deserializeParam(
          data['restSeconds'],
          ParamType.int,
          false,
        ),
        initialWeight: deserializeParam(
          data['initialWeight'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'RoutineExerciseCreationStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is RoutineExerciseCreationStruct &&
        exerciseId == other.exerciseId &&
        position == other.position &&
        sets == other.sets &&
        reps == other.reps &&
        restSeconds == other.restSeconds &&
        initialWeight == other.initialWeight;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([exerciseId, position, sets, reps, restSeconds, initialWeight]);
}

RoutineExerciseCreationStruct createRoutineExerciseCreationStruct({
  String? exerciseId,
  int? position,
  int? sets,
  int? reps,
  int? restSeconds,
  double? initialWeight,
}) =>
    RoutineExerciseCreationStruct(
      exerciseId: exerciseId,
      position: position,
      sets: sets,
      reps: reps,
      restSeconds: restSeconds,
      initialWeight: initialWeight,
    );
