// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LogWeightAndDateStruct extends BaseStruct {
  LogWeightAndDateStruct({
    String? recordDate,
    double? weight,
  })  : _recordDate = recordDate,
        _weight = weight;

  // "recordDate" field.
  String? _recordDate;
  String get recordDate => _recordDate ?? '';
  set recordDate(String? val) => _recordDate = val;

  bool hasRecordDate() => _recordDate != null;

  // "weight" field.
  double? _weight;
  double get weight => _weight ?? 0.0;
  set weight(double? val) => _weight = val;

  void incrementWeight(double amount) => weight = weight + amount;

  bool hasWeight() => _weight != null;

  static LogWeightAndDateStruct fromMap(Map<String, dynamic> data) =>
      LogWeightAndDateStruct(
        recordDate: data['recordDate'] as String?,
        weight: castToType<double>(data['weight']),
      );

  static LogWeightAndDateStruct? maybeFromMap(dynamic data) => data is Map
      ? LogWeightAndDateStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'recordDate': _recordDate,
        'weight': _weight,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'recordDate': serializeParam(
          _recordDate,
          ParamType.String,
        ),
        'weight': serializeParam(
          _weight,
          ParamType.double,
        ),
      }.withoutNulls;

  static LogWeightAndDateStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      LogWeightAndDateStruct(
        recordDate: deserializeParam(
          data['recordDate'],
          ParamType.String,
          false,
        ),
        weight: deserializeParam(
          data['weight'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'LogWeightAndDateStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LogWeightAndDateStruct &&
        recordDate == other.recordDate &&
        weight == other.weight;
  }

  @override
  int get hashCode => const ListEquality().hash([recordDate, weight]);
}

LogWeightAndDateStruct createLogWeightAndDateStruct({
  String? recordDate,
  double? weight,
}) =>
    LogWeightAndDateStruct(
      recordDate: recordDate,
      weight: weight,
    );
