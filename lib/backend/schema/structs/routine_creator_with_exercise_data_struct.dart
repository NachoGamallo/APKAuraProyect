// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RoutineCreatorWithExerciseDataStruct extends BaseStruct {
  RoutineCreatorWithExerciseDataStruct({
    ExerciseSumaryStruct? exercise,
    int? timer,
    double? defaultKG,
    int? defaultSeries,
    List<ExerciseSeriesStruct>? series,
  })  : _exercise = exercise,
        _timer = timer,
        _defaultKG = defaultKG,
        _defaultSeries = defaultSeries,
        _series = series;

  // "Exercise" field.
  ExerciseSumaryStruct? _exercise;
  ExerciseSumaryStruct get exercise => _exercise ?? ExerciseSumaryStruct();
  set exercise(ExerciseSumaryStruct? val) => _exercise = val;

  void updateExercise(Function(ExerciseSumaryStruct) updateFn) {
    updateFn(_exercise ??= ExerciseSumaryStruct());
  }

  bool hasExercise() => _exercise != null;

  // "timer" field.
  int? _timer;
  int get timer => _timer ?? 0;
  set timer(int? val) => _timer = val;

  void incrementTimer(int amount) => timer = timer + amount;

  bool hasTimer() => _timer != null;

  // "defaultKG" field.
  double? _defaultKG;
  double get defaultKG => _defaultKG ?? 0.0;
  set defaultKG(double? val) => _defaultKG = val;

  void incrementDefaultKG(double amount) => defaultKG = defaultKG + amount;

  bool hasDefaultKG() => _defaultKG != null;

  // "defaultSeries" field.
  int? _defaultSeries;
  int get defaultSeries => _defaultSeries ?? 0;
  set defaultSeries(int? val) => _defaultSeries = val;

  void incrementDefaultSeries(int amount) =>
      defaultSeries = defaultSeries + amount;

  bool hasDefaultSeries() => _defaultSeries != null;

  // "series" field.
  List<ExerciseSeriesStruct>? _series;
  List<ExerciseSeriesStruct> get series => _series ?? const [];
  set series(List<ExerciseSeriesStruct>? val) => _series = val;

  void updateSeries(Function(List<ExerciseSeriesStruct>) updateFn) {
    updateFn(_series ??= []);
  }

  bool hasSeries() => _series != null;

  static RoutineCreatorWithExerciseDataStruct fromMap(
          Map<String, dynamic> data) =>
      RoutineCreatorWithExerciseDataStruct(
        exercise: data['Exercise'] is ExerciseSumaryStruct
            ? data['Exercise']
            : ExerciseSumaryStruct.maybeFromMap(data['Exercise']),
        timer: castToType<int>(data['timer']),
        defaultKG: castToType<double>(data['defaultKG']),
        defaultSeries: castToType<int>(data['defaultSeries']),
        series: getStructList(
          data['series'],
          ExerciseSeriesStruct.fromMap,
        ),
      );

  static RoutineCreatorWithExerciseDataStruct? maybeFromMap(dynamic data) =>
      data is Map
          ? RoutineCreatorWithExerciseDataStruct.fromMap(
              data.cast<String, dynamic>())
          : null;

  Map<String, dynamic> toMap() => {
        'Exercise': _exercise?.toMap(),
        'timer': _timer,
        'defaultKG': _defaultKG,
        'defaultSeries': _defaultSeries,
        'series': _series?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Exercise': serializeParam(
          _exercise,
          ParamType.DataStruct,
        ),
        'timer': serializeParam(
          _timer,
          ParamType.int,
        ),
        'defaultKG': serializeParam(
          _defaultKG,
          ParamType.double,
        ),
        'defaultSeries': serializeParam(
          _defaultSeries,
          ParamType.int,
        ),
        'series': serializeParam(
          _series,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static RoutineCreatorWithExerciseDataStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      RoutineCreatorWithExerciseDataStruct(
        exercise: deserializeStructParam(
          data['Exercise'],
          ParamType.DataStruct,
          false,
          structBuilder: ExerciseSumaryStruct.fromSerializableMap,
        ),
        timer: deserializeParam(
          data['timer'],
          ParamType.int,
          false,
        ),
        defaultKG: deserializeParam(
          data['defaultKG'],
          ParamType.double,
          false,
        ),
        defaultSeries: deserializeParam(
          data['defaultSeries'],
          ParamType.int,
          false,
        ),
        series: deserializeStructParam<ExerciseSeriesStruct>(
          data['series'],
          ParamType.DataStruct,
          true,
          structBuilder: ExerciseSeriesStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'RoutineCreatorWithExerciseDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is RoutineCreatorWithExerciseDataStruct &&
        exercise == other.exercise &&
        timer == other.timer &&
        defaultKG == other.defaultKG &&
        defaultSeries == other.defaultSeries &&
        listEquality.equals(series, other.series);
  }

  @override
  int get hashCode => const ListEquality()
      .hash([exercise, timer, defaultKG, defaultSeries, series]);
}

RoutineCreatorWithExerciseDataStruct
    createRoutineCreatorWithExerciseDataStruct({
  ExerciseSumaryStruct? exercise,
  int? timer,
  double? defaultKG,
  int? defaultSeries,
}) =>
        RoutineCreatorWithExerciseDataStruct(
          exercise: exercise ?? ExerciseSumaryStruct(),
          timer: timer,
          defaultKG: defaultKG,
          defaultSeries: defaultSeries,
        );
