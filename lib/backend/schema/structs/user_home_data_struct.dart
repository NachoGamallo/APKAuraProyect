// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserHomeDataStruct extends BaseStruct {
  UserHomeDataStruct({
    int? targetCalories,
    int? consumedCaloriesToday,
    int? trainingMinutesToday,
    int? completedWorkOuts,
    int? burnedCalories,
    double? currentWeight,
    int? unlockedAchievements,
    List<LogWeightAndDateStruct>? bodyRecordInfoResponseDTOS,
  })  : _targetCalories = targetCalories,
        _consumedCaloriesToday = consumedCaloriesToday,
        _trainingMinutesToday = trainingMinutesToday,
        _completedWorkOuts = completedWorkOuts,
        _burnedCalories = burnedCalories,
        _currentWeight = currentWeight,
        _unlockedAchievements = unlockedAchievements,
        _bodyRecordInfoResponseDTOS = bodyRecordInfoResponseDTOS;

  // "targetCalories" field.
  int? _targetCalories;
  int get targetCalories => _targetCalories ?? 0;
  set targetCalories(int? val) => _targetCalories = val;

  void incrementTargetCalories(int amount) =>
      targetCalories = targetCalories + amount;

  bool hasTargetCalories() => _targetCalories != null;

  // "consumedCaloriesToday" field.
  int? _consumedCaloriesToday;
  int get consumedCaloriesToday => _consumedCaloriesToday ?? 0;
  set consumedCaloriesToday(int? val) => _consumedCaloriesToday = val;

  void incrementConsumedCaloriesToday(int amount) =>
      consumedCaloriesToday = consumedCaloriesToday + amount;

  bool hasConsumedCaloriesToday() => _consumedCaloriesToday != null;

  // "trainingMinutesToday" field.
  int? _trainingMinutesToday;
  int get trainingMinutesToday => _trainingMinutesToday ?? 0;
  set trainingMinutesToday(int? val) => _trainingMinutesToday = val;

  void incrementTrainingMinutesToday(int amount) =>
      trainingMinutesToday = trainingMinutesToday + amount;

  bool hasTrainingMinutesToday() => _trainingMinutesToday != null;

  // "completedWorkOuts" field.
  int? _completedWorkOuts;
  int get completedWorkOuts => _completedWorkOuts ?? 0;
  set completedWorkOuts(int? val) => _completedWorkOuts = val;

  void incrementCompletedWorkOuts(int amount) =>
      completedWorkOuts = completedWorkOuts + amount;

  bool hasCompletedWorkOuts() => _completedWorkOuts != null;

  // "burnedCalories" field.
  int? _burnedCalories;
  int get burnedCalories => _burnedCalories ?? 0;
  set burnedCalories(int? val) => _burnedCalories = val;

  void incrementBurnedCalories(int amount) =>
      burnedCalories = burnedCalories + amount;

  bool hasBurnedCalories() => _burnedCalories != null;

  // "currentWeight" field.
  double? _currentWeight;
  double get currentWeight => _currentWeight ?? 0.0;
  set currentWeight(double? val) => _currentWeight = val;

  void incrementCurrentWeight(double amount) =>
      currentWeight = currentWeight + amount;

  bool hasCurrentWeight() => _currentWeight != null;

  // "unlockedAchievements" field.
  int? _unlockedAchievements;
  int get unlockedAchievements => _unlockedAchievements ?? 0;
  set unlockedAchievements(int? val) => _unlockedAchievements = val;

  void incrementUnlockedAchievements(int amount) =>
      unlockedAchievements = unlockedAchievements + amount;

  bool hasUnlockedAchievements() => _unlockedAchievements != null;

  // "bodyRecordInfoResponseDTOS" field.
  List<LogWeightAndDateStruct>? _bodyRecordInfoResponseDTOS;
  List<LogWeightAndDateStruct> get bodyRecordInfoResponseDTOS =>
      _bodyRecordInfoResponseDTOS ?? const [];
  set bodyRecordInfoResponseDTOS(List<LogWeightAndDateStruct>? val) =>
      _bodyRecordInfoResponseDTOS = val;

  void updateBodyRecordInfoResponseDTOS(
      Function(List<LogWeightAndDateStruct>) updateFn) {
    updateFn(_bodyRecordInfoResponseDTOS ??= []);
  }

  bool hasBodyRecordInfoResponseDTOS() => _bodyRecordInfoResponseDTOS != null;

  static UserHomeDataStruct fromMap(Map<String, dynamic> data) =>
      UserHomeDataStruct(
        targetCalories: castToType<int>(data['targetCalories']),
        consumedCaloriesToday: castToType<int>(data['consumedCaloriesToday']),
        trainingMinutesToday: castToType<int>(data['trainingMinutesToday']),
        completedWorkOuts: castToType<int>(data['completedWorkOuts']),
        burnedCalories: castToType<int>(data['burnedCalories']),
        currentWeight: castToType<double>(data['currentWeight']),
        unlockedAchievements: castToType<int>(data['unlockedAchievements']),
        bodyRecordInfoResponseDTOS: getStructList(
          data['bodyRecordInfoResponseDTOS'],
          LogWeightAndDateStruct.fromMap,
        ),
      );

  static UserHomeDataStruct? maybeFromMap(dynamic data) => data is Map
      ? UserHomeDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'targetCalories': _targetCalories,
        'consumedCaloriesToday': _consumedCaloriesToday,
        'trainingMinutesToday': _trainingMinutesToday,
        'completedWorkOuts': _completedWorkOuts,
        'burnedCalories': _burnedCalories,
        'currentWeight': _currentWeight,
        'unlockedAchievements': _unlockedAchievements,
        'bodyRecordInfoResponseDTOS':
            _bodyRecordInfoResponseDTOS?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'targetCalories': serializeParam(
          _targetCalories,
          ParamType.int,
        ),
        'consumedCaloriesToday': serializeParam(
          _consumedCaloriesToday,
          ParamType.int,
        ),
        'trainingMinutesToday': serializeParam(
          _trainingMinutesToday,
          ParamType.int,
        ),
        'completedWorkOuts': serializeParam(
          _completedWorkOuts,
          ParamType.int,
        ),
        'burnedCalories': serializeParam(
          _burnedCalories,
          ParamType.int,
        ),
        'currentWeight': serializeParam(
          _currentWeight,
          ParamType.double,
        ),
        'unlockedAchievements': serializeParam(
          _unlockedAchievements,
          ParamType.int,
        ),
        'bodyRecordInfoResponseDTOS': serializeParam(
          _bodyRecordInfoResponseDTOS,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static UserHomeDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserHomeDataStruct(
        targetCalories: deserializeParam(
          data['targetCalories'],
          ParamType.int,
          false,
        ),
        consumedCaloriesToday: deserializeParam(
          data['consumedCaloriesToday'],
          ParamType.int,
          false,
        ),
        trainingMinutesToday: deserializeParam(
          data['trainingMinutesToday'],
          ParamType.int,
          false,
        ),
        completedWorkOuts: deserializeParam(
          data['completedWorkOuts'],
          ParamType.int,
          false,
        ),
        burnedCalories: deserializeParam(
          data['burnedCalories'],
          ParamType.int,
          false,
        ),
        currentWeight: deserializeParam(
          data['currentWeight'],
          ParamType.double,
          false,
        ),
        unlockedAchievements: deserializeParam(
          data['unlockedAchievements'],
          ParamType.int,
          false,
        ),
        bodyRecordInfoResponseDTOS:
            deserializeStructParam<LogWeightAndDateStruct>(
          data['bodyRecordInfoResponseDTOS'],
          ParamType.DataStruct,
          true,
          structBuilder: LogWeightAndDateStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'UserHomeDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is UserHomeDataStruct &&
        targetCalories == other.targetCalories &&
        consumedCaloriesToday == other.consumedCaloriesToday &&
        trainingMinutesToday == other.trainingMinutesToday &&
        completedWorkOuts == other.completedWorkOuts &&
        burnedCalories == other.burnedCalories &&
        currentWeight == other.currentWeight &&
        unlockedAchievements == other.unlockedAchievements &&
        listEquality.equals(
            bodyRecordInfoResponseDTOS, other.bodyRecordInfoResponseDTOS);
  }

  @override
  int get hashCode => const ListEquality().hash([
        targetCalories,
        consumedCaloriesToday,
        trainingMinutesToday,
        completedWorkOuts,
        burnedCalories,
        currentWeight,
        unlockedAchievements,
        bodyRecordInfoResponseDTOS
      ]);
}

UserHomeDataStruct createUserHomeDataStruct({
  int? targetCalories,
  int? consumedCaloriesToday,
  int? trainingMinutesToday,
  int? completedWorkOuts,
  int? burnedCalories,
  double? currentWeight,
  int? unlockedAchievements,
}) =>
    UserHomeDataStruct(
      targetCalories: targetCalories,
      consumedCaloriesToday: consumedCaloriesToday,
      trainingMinutesToday: trainingMinutesToday,
      completedWorkOuts: completedWorkOuts,
      burnedCalories: burnedCalories,
      currentWeight: currentWeight,
      unlockedAchievements: unlockedAchievements,
    );
