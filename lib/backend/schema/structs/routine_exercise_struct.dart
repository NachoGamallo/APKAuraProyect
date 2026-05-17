// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RoutineExerciseStruct extends BaseStruct {
  RoutineExerciseStruct({
    String? exerciseId,
    String? exerciseName,
    int? position,
    int? restTime,
    String? exerciseImg,
    List<RoutineExerciseSetStruct>? sets,
  })  : _exerciseId = exerciseId,
        _exerciseName = exerciseName,
        _position = position,
        _restTime = restTime,
        _exerciseImg = exerciseImg,
        _sets = sets;

  // "exerciseId" field.
  String? _exerciseId;
  String get exerciseId => _exerciseId ?? '';
  set exerciseId(String? val) => _exerciseId = val;

  bool hasExerciseId() => _exerciseId != null;

  // "exerciseName" field.
  String? _exerciseName;
  String get exerciseName => _exerciseName ?? '';
  set exerciseName(String? val) => _exerciseName = val;

  bool hasExerciseName() => _exerciseName != null;

  // "position" field.
  int? _position;
  int get position => _position ?? 0;
  set position(int? val) => _position = val;

  void incrementPosition(int amount) => position = position + amount;

  bool hasPosition() => _position != null;

  // "restTime" field.
  int? _restTime;
  int get restTime => _restTime ?? 0;
  set restTime(int? val) => _restTime = val;

  void incrementRestTime(int amount) => restTime = restTime + amount;

  bool hasRestTime() => _restTime != null;

  // "exerciseImg" field.
  String? _exerciseImg;
  String get exerciseImg => _exerciseImg ?? '';
  set exerciseImg(String? val) => _exerciseImg = val;

  bool hasExerciseImg() => _exerciseImg != null;

  // "sets" field.
  List<RoutineExerciseSetStruct>? _sets;
  List<RoutineExerciseSetStruct> get sets => _sets ?? const [];
  set sets(List<RoutineExerciseSetStruct>? val) => _sets = val;

  void updateSets(Function(List<RoutineExerciseSetStruct>) updateFn) {
    updateFn(_sets ??= []);
  }

  bool hasSets() => _sets != null;

  static RoutineExerciseStruct fromMap(Map<String, dynamic> data) =>
      RoutineExerciseStruct(
        exerciseId: data['exerciseId'] as String?,
        exerciseName: data['exerciseName'] as String?,
        position: castToType<int>(data['position']),
        restTime: castToType<int>(data['restTime']),
        exerciseImg: data['exerciseImg'] as String?,
        sets: getStructList(
          data['sets'],
          RoutineExerciseSetStruct.fromMap,
        ),
      );

  static RoutineExerciseStruct? maybeFromMap(dynamic data) => data is Map
      ? RoutineExerciseStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'exerciseId': _exerciseId,
        'exerciseName': _exerciseName,
        'position': _position,
        'restTime': _restTime,
        'exerciseImg': _exerciseImg,
        'sets': _sets?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'exerciseId': serializeParam(
          _exerciseId,
          ParamType.String,
        ),
        'exerciseName': serializeParam(
          _exerciseName,
          ParamType.String,
        ),
        'position': serializeParam(
          _position,
          ParamType.int,
        ),
        'restTime': serializeParam(
          _restTime,
          ParamType.int,
        ),
        'exerciseImg': serializeParam(
          _exerciseImg,
          ParamType.String,
        ),
        'sets': serializeParam(
          _sets,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static RoutineExerciseStruct fromSerializableMap(Map<String, dynamic> data) =>
      RoutineExerciseStruct(
        exerciseId: deserializeParam(
          data['exerciseId'],
          ParamType.String,
          false,
        ),
        exerciseName: deserializeParam(
          data['exerciseName'],
          ParamType.String,
          false,
        ),
        position: deserializeParam(
          data['position'],
          ParamType.int,
          false,
        ),
        restTime: deserializeParam(
          data['restTime'],
          ParamType.int,
          false,
        ),
        exerciseImg: deserializeParam(
          data['exerciseImg'],
          ParamType.String,
          false,
        ),
        sets: deserializeStructParam<RoutineExerciseSetStruct>(
          data['sets'],
          ParamType.DataStruct,
          true,
          structBuilder: RoutineExerciseSetStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'RoutineExerciseStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is RoutineExerciseStruct &&
        exerciseId == other.exerciseId &&
        exerciseName == other.exerciseName &&
        position == other.position &&
        restTime == other.restTime &&
        exerciseImg == other.exerciseImg &&
        listEquality.equals(sets, other.sets);
  }

  @override
  int get hashCode => const ListEquality()
      .hash([exerciseId, exerciseName, position, restTime, exerciseImg, sets]);
}

RoutineExerciseStruct createRoutineExerciseStruct({
  String? exerciseId,
  String? exerciseName,
  int? position,
  int? restTime,
  String? exerciseImg,
}) =>
    RoutineExerciseStruct(
      exerciseId: exerciseId,
      exerciseName: exerciseName,
      position: position,
      restTime: restTime,
      exerciseImg: exerciseImg,
    );
