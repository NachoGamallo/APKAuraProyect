// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SerieStruct extends BaseStruct {
  SerieStruct({
    int? id,
    double? kg,
    int? reps,
  })  : _id = id,
        _kg = kg,
        _reps = reps;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "kg" field.
  double? _kg;
  double get kg => _kg ?? 0.0;
  set kg(double? val) => _kg = val;

  void incrementKg(double amount) => kg = kg + amount;

  bool hasKg() => _kg != null;

  // "reps" field.
  int? _reps;
  int get reps => _reps ?? 0;
  set reps(int? val) => _reps = val;

  void incrementReps(int amount) => reps = reps + amount;

  bool hasReps() => _reps != null;

  static SerieStruct fromMap(Map<String, dynamic> data) => SerieStruct(
        id: castToType<int>(data['id']),
        kg: castToType<double>(data['kg']),
        reps: castToType<int>(data['reps']),
      );

  static SerieStruct? maybeFromMap(dynamic data) =>
      data is Map ? SerieStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'kg': _kg,
        'reps': _reps,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'kg': serializeParam(
          _kg,
          ParamType.double,
        ),
        'reps': serializeParam(
          _reps,
          ParamType.int,
        ),
      }.withoutNulls;

  static SerieStruct fromSerializableMap(Map<String, dynamic> data) =>
      SerieStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        kg: deserializeParam(
          data['kg'],
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
  String toString() => 'SerieStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SerieStruct &&
        id == other.id &&
        kg == other.kg &&
        reps == other.reps;
  }

  @override
  int get hashCode => const ListEquality().hash([id, kg, reps]);
}

SerieStruct createSerieStruct({
  int? id,
  double? kg,
  int? reps,
}) =>
    SerieStruct(
      id: id,
      kg: kg,
      reps: reps,
    );
