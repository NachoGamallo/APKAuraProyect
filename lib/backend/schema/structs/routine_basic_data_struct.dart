// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RoutineBasicDataStruct extends BaseStruct {
  RoutineBasicDataStruct({
    String? id,
    String? name,
    String? desc,
  })  : _id = id,
        _name = name,
        _desc = desc;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

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

  static RoutineBasicDataStruct fromMap(Map<String, dynamic> data) =>
      RoutineBasicDataStruct(
        id: data['id'] as String?,
        name: data['name'] as String?,
        desc: data['desc'] as String?,
      );

  static RoutineBasicDataStruct? maybeFromMap(dynamic data) => data is Map
      ? RoutineBasicDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
        'desc': _desc,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'desc': serializeParam(
          _desc,
          ParamType.String,
        ),
      }.withoutNulls;

  static RoutineBasicDataStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      RoutineBasicDataStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
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
  String toString() => 'RoutineBasicDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is RoutineBasicDataStruct &&
        id == other.id &&
        name == other.name &&
        desc == other.desc;
  }

  @override
  int get hashCode => const ListEquality().hash([id, name, desc]);
}

RoutineBasicDataStruct createRoutineBasicDataStruct({
  String? id,
  String? name,
  String? desc,
}) =>
    RoutineBasicDataStruct(
      id: id,
      name: name,
      desc: desc,
    );
