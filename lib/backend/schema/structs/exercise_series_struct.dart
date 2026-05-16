// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ExerciseSeriesStruct extends BaseStruct {
  ExerciseSeriesStruct({
    String? id,
    int? numSerie,
    double? weight,
    int? reps,
  })  : _id = id,
        _numSerie = numSerie,
        _weight = weight,
        _reps = reps;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "numSerie" field.
  int? _numSerie;
  int get numSerie => _numSerie ?? 0;
  set numSerie(int? val) => _numSerie = val;

  void incrementNumSerie(int amount) => numSerie = numSerie + amount;

  bool hasNumSerie() => _numSerie != null;

  // "weight" field.
  double? _weight;
  double get weight => _weight ?? 0.0;
  set weight(double? val) => _weight = val;

  void incrementWeight(double amount) => weight = weight + amount;

  bool hasWeight() => _weight != null;

  // "reps" field.
  int? _reps;
  int get reps => _reps ?? 0;
  set reps(int? val) => _reps = val;

  void incrementReps(int amount) => reps = reps + amount;

  bool hasReps() => _reps != null;

  static ExerciseSeriesStruct fromMap(Map<String, dynamic> data) =>
      ExerciseSeriesStruct(
        id: data['id'] as String?,
        numSerie: castToType<int>(data['numSerie']),
        weight: castToType<double>(data['weight']),
        reps: castToType<int>(data['reps']),
      );

  static ExerciseSeriesStruct? maybeFromMap(dynamic data) => data is Map
      ? ExerciseSeriesStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'numSerie': _numSerie,
        'weight': _weight,
        'reps': _reps,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'numSerie': serializeParam(
          _numSerie,
          ParamType.int,
        ),
        'weight': serializeParam(
          _weight,
          ParamType.double,
        ),
        'reps': serializeParam(
          _reps,
          ParamType.int,
        ),
      }.withoutNulls;

  static ExerciseSeriesStruct fromSerializableMap(Map<String, dynamic> data) =>
      ExerciseSeriesStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        numSerie: deserializeParam(
          data['numSerie'],
          ParamType.int,
          false,
        ),
        weight: deserializeParam(
          data['weight'],
          ParamType.double,
          false,
        ),
        reps: deserializeParam(
          data['reps'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'ExerciseSeriesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ExerciseSeriesStruct &&
        id == other.id &&
        numSerie == other.numSerie &&
        weight == other.weight &&
        reps == other.reps;
  }

  @override
  int get hashCode => const ListEquality().hash([id, numSerie, weight, reps]);
}

ExerciseSeriesStruct createExerciseSeriesStruct({
  String? id,
  int? numSerie,
  double? weight,
  int? reps,
}) =>
    ExerciseSeriesStruct(
      id: id,
      numSerie: numSerie,
      weight: weight,
      reps: reps,
    );
