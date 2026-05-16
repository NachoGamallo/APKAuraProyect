// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ExerciseReportInfoStruct extends BaseStruct {
  ExerciseReportInfoStruct({
    double? historicalMaxWeight,
    List<SessionMaxWeightStruct>? sessionRecords,
  })  : _historicalMaxWeight = historicalMaxWeight,
        _sessionRecords = sessionRecords;

  // "historicalMaxWeight" field.
  double? _historicalMaxWeight;
  double get historicalMaxWeight => _historicalMaxWeight ?? 0.0;
  set historicalMaxWeight(double? val) => _historicalMaxWeight = val;

  void incrementHistoricalMaxWeight(double amount) =>
      historicalMaxWeight = historicalMaxWeight + amount;

  bool hasHistoricalMaxWeight() => _historicalMaxWeight != null;

  // "sessionRecords" field.
  List<SessionMaxWeightStruct>? _sessionRecords;
  List<SessionMaxWeightStruct> get sessionRecords =>
      _sessionRecords ?? const [];
  set sessionRecords(List<SessionMaxWeightStruct>? val) =>
      _sessionRecords = val;

  void updateSessionRecords(Function(List<SessionMaxWeightStruct>) updateFn) {
    updateFn(_sessionRecords ??= []);
  }

  bool hasSessionRecords() => _sessionRecords != null;

  static ExerciseReportInfoStruct fromMap(Map<String, dynamic> data) =>
      ExerciseReportInfoStruct(
        historicalMaxWeight: castToType<double>(data['historicalMaxWeight']),
        sessionRecords: getStructList(
          data['sessionRecords'],
          SessionMaxWeightStruct.fromMap,
        ),
      );

  static ExerciseReportInfoStruct? maybeFromMap(dynamic data) => data is Map
      ? ExerciseReportInfoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'historicalMaxWeight': _historicalMaxWeight,
        'sessionRecords': _sessionRecords?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'historicalMaxWeight': serializeParam(
          _historicalMaxWeight,
          ParamType.double,
        ),
        'sessionRecords': serializeParam(
          _sessionRecords,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static ExerciseReportInfoStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ExerciseReportInfoStruct(
        historicalMaxWeight: deserializeParam(
          data['historicalMaxWeight'],
          ParamType.double,
          false,
        ),
        sessionRecords: deserializeStructParam<SessionMaxWeightStruct>(
          data['sessionRecords'],
          ParamType.DataStruct,
          true,
          structBuilder: SessionMaxWeightStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'ExerciseReportInfoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ExerciseReportInfoStruct &&
        historicalMaxWeight == other.historicalMaxWeight &&
        listEquality.equals(sessionRecords, other.sessionRecords);
  }

  @override
  int get hashCode =>
      const ListEquality().hash([historicalMaxWeight, sessionRecords]);
}

ExerciseReportInfoStruct createExerciseReportInfoStruct({
  double? historicalMaxWeight,
}) =>
    ExerciseReportInfoStruct(
      historicalMaxWeight: historicalMaxWeight,
    );
