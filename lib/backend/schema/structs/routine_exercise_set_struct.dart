// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RoutineExerciseSetStruct extends BaseStruct {
  RoutineExerciseSetStruct({
    int? id,
    int? setNumber,
    double? previousWeight,
    int? previousReps,
  })  : _id = id,
        _setNumber = setNumber,
        _previousWeight = previousWeight,
        _previousReps = previousReps;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "setNumber" field.
  int? _setNumber;
  int get setNumber => _setNumber ?? 0;
  set setNumber(int? val) => _setNumber = val;

  void incrementSetNumber(int amount) => setNumber = setNumber + amount;

  bool hasSetNumber() => _setNumber != null;

  // "previousWeight" field.
  double? _previousWeight;
  double get previousWeight => _previousWeight ?? 0.0;
  set previousWeight(double? val) => _previousWeight = val;

  void incrementPreviousWeight(double amount) =>
      previousWeight = previousWeight + amount;

  bool hasPreviousWeight() => _previousWeight != null;

  // "previousReps" field.
  int? _previousReps;
  int get previousReps => _previousReps ?? 0;
  set previousReps(int? val) => _previousReps = val;

  void incrementPreviousReps(int amount) =>
      previousReps = previousReps + amount;

  bool hasPreviousReps() => _previousReps != null;

  static RoutineExerciseSetStruct fromMap(Map<String, dynamic> data) =>
      RoutineExerciseSetStruct(
        id: castToType<int>(data['id']),
        setNumber: castToType<int>(data['setNumber']),
        previousWeight: castToType<double>(data['previousWeight']),
        previousReps: castToType<int>(data['previousReps']),
      );

  static RoutineExerciseSetStruct? maybeFromMap(dynamic data) => data is Map
      ? RoutineExerciseSetStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'setNumber': _setNumber,
        'previousWeight': _previousWeight,
        'previousReps': _previousReps,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'setNumber': serializeParam(
          _setNumber,
          ParamType.int,
        ),
        'previousWeight': serializeParam(
          _previousWeight,
          ParamType.double,
        ),
        'previousReps': serializeParam(
          _previousReps,
          ParamType.int,
        ),
      }.withoutNulls;

  static RoutineExerciseSetStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      RoutineExerciseSetStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        setNumber: deserializeParam(
          data['setNumber'],
          ParamType.int,
          false,
        ),
        previousWeight: deserializeParam(
          data['previousWeight'],
          ParamType.double,
          false,
        ),
        previousReps: deserializeParam(
          data['previousReps'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'RoutineExerciseSetStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is RoutineExerciseSetStruct &&
        id == other.id &&
        setNumber == other.setNumber &&
        previousWeight == other.previousWeight &&
        previousReps == other.previousReps;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([id, setNumber, previousWeight, previousReps]);
}

RoutineExerciseSetStruct createRoutineExerciseSetStruct({
  int? id,
  int? setNumber,
  double? previousWeight,
  int? previousReps,
}) =>
    RoutineExerciseSetStruct(
      id: id,
      setNumber: setNumber,
      previousWeight: previousWeight,
      previousReps: previousReps,
    );
