// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ExerciseSumaryStruct extends BaseStruct {
  ExerciseSumaryStruct({
    String? id,
    String? name,
    String? imageURL,
    String? primaryMuscle,
  })  : _id = id,
        _name = name,
        _imageURL = imageURL,
        _primaryMuscle = primaryMuscle;

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

  // "imageURL" field.
  String? _imageURL;
  String get imageURL => _imageURL ?? '';
  set imageURL(String? val) => _imageURL = val;

  bool hasImageURL() => _imageURL != null;

  // "primaryMuscle" field.
  String? _primaryMuscle;
  String get primaryMuscle => _primaryMuscle ?? '';
  set primaryMuscle(String? val) => _primaryMuscle = val;

  bool hasPrimaryMuscle() => _primaryMuscle != null;

  static ExerciseSumaryStruct fromMap(Map<String, dynamic> data) =>
      ExerciseSumaryStruct(
        id: data['id'] as String?,
        name: data['name'] as String?,
        imageURL: data['imageURL'] as String?,
        primaryMuscle: data['primaryMuscle'] as String?,
      );

  static ExerciseSumaryStruct? maybeFromMap(dynamic data) => data is Map
      ? ExerciseSumaryStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
        'imageURL': _imageURL,
        'primaryMuscle': _primaryMuscle,
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
        'imageURL': serializeParam(
          _imageURL,
          ParamType.String,
        ),
        'primaryMuscle': serializeParam(
          _primaryMuscle,
          ParamType.String,
        ),
      }.withoutNulls;

  static ExerciseSumaryStruct fromSerializableMap(Map<String, dynamic> data) =>
      ExerciseSumaryStruct(
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
        imageURL: deserializeParam(
          data['imageURL'],
          ParamType.String,
          false,
        ),
        primaryMuscle: deserializeParam(
          data['primaryMuscle'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ExerciseSumaryStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ExerciseSumaryStruct &&
        id == other.id &&
        name == other.name &&
        imageURL == other.imageURL &&
        primaryMuscle == other.primaryMuscle;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([id, name, imageURL, primaryMuscle]);
}

ExerciseSumaryStruct createExerciseSumaryStruct({
  String? id,
  String? name,
  String? imageURL,
  String? primaryMuscle,
}) =>
    ExerciseSumaryStruct(
      id: id,
      name: name,
      imageURL: imageURL,
      primaryMuscle: primaryMuscle,
    );
