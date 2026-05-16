// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SessionMaxWeightStruct extends BaseStruct {
  SessionMaxWeightStruct({
    String? sessionDate,
    double? maxWeight,
  })  : _sessionDate = sessionDate,
        _maxWeight = maxWeight;

  // "sessionDate" field.
  String? _sessionDate;
  String get sessionDate => _sessionDate ?? '';
  set sessionDate(String? val) => _sessionDate = val;

  bool hasSessionDate() => _sessionDate != null;

  // "maxWeight" field.
  double? _maxWeight;
  double get maxWeight => _maxWeight ?? 0.0;
  set maxWeight(double? val) => _maxWeight = val;

  void incrementMaxWeight(double amount) => maxWeight = maxWeight + amount;

  bool hasMaxWeight() => _maxWeight != null;

  static SessionMaxWeightStruct fromMap(Map<String, dynamic> data) =>
      SessionMaxWeightStruct(
        sessionDate: data['sessionDate'] as String?,
        maxWeight: castToType<double>(data['maxWeight']),
      );

  static SessionMaxWeightStruct? maybeFromMap(dynamic data) => data is Map
      ? SessionMaxWeightStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'sessionDate': _sessionDate,
        'maxWeight': _maxWeight,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'sessionDate': serializeParam(
          _sessionDate,
          ParamType.String,
        ),
        'maxWeight': serializeParam(
          _maxWeight,
          ParamType.double,
        ),
      }.withoutNulls;

  static SessionMaxWeightStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      SessionMaxWeightStruct(
        sessionDate: deserializeParam(
          data['sessionDate'],
          ParamType.String,
          false,
        ),
        maxWeight: deserializeParam(
          data['maxWeight'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'SessionMaxWeightStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SessionMaxWeightStruct &&
        sessionDate == other.sessionDate &&
        maxWeight == other.maxWeight;
  }

  @override
  int get hashCode => const ListEquality().hash([sessionDate, maxWeight]);
}

SessionMaxWeightStruct createSessionMaxWeightStruct({
  String? sessionDate,
  double? maxWeight,
}) =>
    SessionMaxWeightStruct(
      sessionDate: sessionDate,
      maxWeight: maxWeight,
    );
