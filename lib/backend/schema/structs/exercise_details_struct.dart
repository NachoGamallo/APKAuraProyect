// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ExerciseDetailsStruct extends BaseStruct {
  ExerciseDetailsStruct({
    String? id,
    String? name,
    String? desc,
    String? exerciseType,
    String? equipment,
    String? imgURL,
    List<String>? primaryMuscles,
    List<String>? secondaryMuscles,
    List<String>? instructions,
  })  : _id = id,
        _name = name,
        _desc = desc,
        _exerciseType = exerciseType,
        _equipment = equipment,
        _imgURL = imgURL,
        _primaryMuscles = primaryMuscles,
        _secondaryMuscles = secondaryMuscles,
        _instructions = instructions;

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

  // "exerciseType" field.
  String? _exerciseType;
  String get exerciseType => _exerciseType ?? '';
  set exerciseType(String? val) => _exerciseType = val;

  bool hasExerciseType() => _exerciseType != null;

  // "equipment" field.
  String? _equipment;
  String get equipment => _equipment ?? '';
  set equipment(String? val) => _equipment = val;

  bool hasEquipment() => _equipment != null;

  // "imgURL" field.
  String? _imgURL;
  String get imgURL => _imgURL ?? '';
  set imgURL(String? val) => _imgURL = val;

  bool hasImgURL() => _imgURL != null;

  // "primaryMuscles" field.
  List<String>? _primaryMuscles;
  List<String> get primaryMuscles => _primaryMuscles ?? const [];
  set primaryMuscles(List<String>? val) => _primaryMuscles = val;

  void updatePrimaryMuscles(Function(List<String>) updateFn) {
    updateFn(_primaryMuscles ??= []);
  }

  bool hasPrimaryMuscles() => _primaryMuscles != null;

  // "secondaryMuscles" field.
  List<String>? _secondaryMuscles;
  List<String> get secondaryMuscles => _secondaryMuscles ?? const [];
  set secondaryMuscles(List<String>? val) => _secondaryMuscles = val;

  void updateSecondaryMuscles(Function(List<String>) updateFn) {
    updateFn(_secondaryMuscles ??= []);
  }

  bool hasSecondaryMuscles() => _secondaryMuscles != null;

  // "instructions" field.
  List<String>? _instructions;
  List<String> get instructions => _instructions ?? const [];
  set instructions(List<String>? val) => _instructions = val;

  void updateInstructions(Function(List<String>) updateFn) {
    updateFn(_instructions ??= []);
  }

  bool hasInstructions() => _instructions != null;

  static ExerciseDetailsStruct fromMap(Map<String, dynamic> data) =>
      ExerciseDetailsStruct(
        id: data['id'] as String?,
        name: data['name'] as String?,
        desc: data['desc'] as String?,
        exerciseType: data['exerciseType'] as String?,
        equipment: data['equipment'] as String?,
        imgURL: data['imgURL'] as String?,
        primaryMuscles: getDataList(data['primaryMuscles']),
        secondaryMuscles: getDataList(data['secondaryMuscles']),
        instructions: getDataList(data['instructions']),
      );

  static ExerciseDetailsStruct? maybeFromMap(dynamic data) => data is Map
      ? ExerciseDetailsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
        'desc': _desc,
        'exerciseType': _exerciseType,
        'equipment': _equipment,
        'imgURL': _imgURL,
        'primaryMuscles': _primaryMuscles,
        'secondaryMuscles': _secondaryMuscles,
        'instructions': _instructions,
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
        'exerciseType': serializeParam(
          _exerciseType,
          ParamType.String,
        ),
        'equipment': serializeParam(
          _equipment,
          ParamType.String,
        ),
        'imgURL': serializeParam(
          _imgURL,
          ParamType.String,
        ),
        'primaryMuscles': serializeParam(
          _primaryMuscles,
          ParamType.String,
          isList: true,
        ),
        'secondaryMuscles': serializeParam(
          _secondaryMuscles,
          ParamType.String,
          isList: true,
        ),
        'instructions': serializeParam(
          _instructions,
          ParamType.String,
          isList: true,
        ),
      }.withoutNulls;

  static ExerciseDetailsStruct fromSerializableMap(Map<String, dynamic> data) =>
      ExerciseDetailsStruct(
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
        exerciseType: deserializeParam(
          data['exerciseType'],
          ParamType.String,
          false,
        ),
        equipment: deserializeParam(
          data['equipment'],
          ParamType.String,
          false,
        ),
        imgURL: deserializeParam(
          data['imgURL'],
          ParamType.String,
          false,
        ),
        primaryMuscles: deserializeParam<String>(
          data['primaryMuscles'],
          ParamType.String,
          true,
        ),
        secondaryMuscles: deserializeParam<String>(
          data['secondaryMuscles'],
          ParamType.String,
          true,
        ),
        instructions: deserializeParam<String>(
          data['instructions'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'ExerciseDetailsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ExerciseDetailsStruct &&
        id == other.id &&
        name == other.name &&
        desc == other.desc &&
        exerciseType == other.exerciseType &&
        equipment == other.equipment &&
        imgURL == other.imgURL &&
        listEquality.equals(primaryMuscles, other.primaryMuscles) &&
        listEquality.equals(secondaryMuscles, other.secondaryMuscles) &&
        listEquality.equals(instructions, other.instructions);
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        name,
        desc,
        exerciseType,
        equipment,
        imgURL,
        primaryMuscles,
        secondaryMuscles,
        instructions
      ]);
}

ExerciseDetailsStruct createExerciseDetailsStruct({
  String? id,
  String? name,
  String? desc,
  String? exerciseType,
  String? equipment,
  String? imgURL,
}) =>
    ExerciseDetailsStruct(
      id: id,
      name: name,
      desc: desc,
      exerciseType: exerciseType,
      equipment: equipment,
      imgURL: imgURL,
    );
