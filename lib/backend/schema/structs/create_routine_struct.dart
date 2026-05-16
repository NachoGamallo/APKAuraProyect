// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CreateRoutineStruct extends BaseStruct {
  CreateRoutineStruct({
    String? name,
    String? desc,
  })  : _name = name,
        _desc = desc;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "desc" field.
  String? _desc;
  String get desc => _desc ?? '';
  set desc(String? val) => _desc = val;

  bool hasDesc() => _desc != null;

  static CreateRoutineStruct fromMap(Map<String, dynamic> data) =>
      CreateRoutineStruct(
        name: data['name'] as String?,
        desc: data['desc'] as String?,
      );

  static CreateRoutineStruct? maybeFromMap(dynamic data) => data is Map
      ? CreateRoutineStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'desc': _desc,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'desc': serializeParam(
          _desc,
          ParamType.String,
        ),
      }.withoutNulls;

  static CreateRoutineStruct fromSerializableMap(Map<String, dynamic> data) =>
      CreateRoutineStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        desc: deserializeParam(
          data['desc'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CreateRoutineStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CreateRoutineStruct &&
        name == other.name &&
        desc == other.desc;
  }

  @override
  int get hashCode => const ListEquality().hash([name, desc]);
}

CreateRoutineStruct createCreateRoutineStruct({
  String? name,
  String? desc,
}) =>
    CreateRoutineStruct(
      name: name,
      desc: desc,
    );
