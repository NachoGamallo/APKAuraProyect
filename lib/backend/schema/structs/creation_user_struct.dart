// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CreationUserStruct extends BaseStruct {
  CreationUserStruct({
    String? name,
    String? email,
    String? password,
    int? age,
    int? height,
    double? weight,
    String? gender,
    String? goal,
    String? activityLevel,
    String? userLevel,
  })  : _name = name,
        _email = email,
        _password = password,
        _age = age,
        _height = height,
        _weight = weight,
        _gender = gender,
        _goal = goal,
        _activityLevel = activityLevel,
        _userLevel = userLevel;

  // "Name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "Email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;

  bool hasEmail() => _email != null;

  // "Password" field.
  String? _password;
  String get password => _password ?? '';
  set password(String? val) => _password = val;

  bool hasPassword() => _password != null;

  // "Age" field.
  int? _age;
  int get age => _age ?? 0;
  set age(int? val) => _age = val;

  void incrementAge(int amount) => age = age + amount;

  bool hasAge() => _age != null;

  // "Height" field.
  int? _height;
  int get height => _height ?? 0;
  set height(int? val) => _height = val;

  void incrementHeight(int amount) => height = height + amount;

  bool hasHeight() => _height != null;

  // "Weight" field.
  double? _weight;
  double get weight => _weight ?? 0.0;
  set weight(double? val) => _weight = val;

  void incrementWeight(double amount) => weight = weight + amount;

  bool hasWeight() => _weight != null;

  // "Gender" field.
  String? _gender;
  String get gender => _gender ?? '';
  set gender(String? val) => _gender = val;

  bool hasGender() => _gender != null;

  // "Goal" field.
  String? _goal;
  String get goal => _goal ?? '';
  set goal(String? val) => _goal = val;

  bool hasGoal() => _goal != null;

  // "ActivityLevel" field.
  String? _activityLevel;
  String get activityLevel => _activityLevel ?? '';
  set activityLevel(String? val) => _activityLevel = val;

  bool hasActivityLevel() => _activityLevel != null;

  // "UserLevel" field.
  String? _userLevel;
  String get userLevel => _userLevel ?? '';
  set userLevel(String? val) => _userLevel = val;

  bool hasUserLevel() => _userLevel != null;

  static CreationUserStruct fromMap(Map<String, dynamic> data) =>
      CreationUserStruct(
        name: data['Name'] as String?,
        email: data['Email'] as String?,
        password: data['Password'] as String?,
        age: castToType<int>(data['Age']),
        height: castToType<int>(data['Height']),
        weight: castToType<double>(data['Weight']),
        gender: data['Gender'] as String?,
        goal: data['Goal'] as String?,
        activityLevel: data['ActivityLevel'] as String?,
        userLevel: data['UserLevel'] as String?,
      );

  static CreationUserStruct? maybeFromMap(dynamic data) => data is Map
      ? CreationUserStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'Name': _name,
        'Email': _email,
        'Password': _password,
        'Age': _age,
        'Height': _height,
        'Weight': _weight,
        'Gender': _gender,
        'Goal': _goal,
        'ActivityLevel': _activityLevel,
        'UserLevel': _userLevel,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Name': serializeParam(
          _name,
          ParamType.String,
        ),
        'Email': serializeParam(
          _email,
          ParamType.String,
        ),
        'Password': serializeParam(
          _password,
          ParamType.String,
        ),
        'Age': serializeParam(
          _age,
          ParamType.int,
        ),
        'Height': serializeParam(
          _height,
          ParamType.int,
        ),
        'Weight': serializeParam(
          _weight,
          ParamType.double,
        ),
        'Gender': serializeParam(
          _gender,
          ParamType.String,
        ),
        'Goal': serializeParam(
          _goal,
          ParamType.String,
        ),
        'ActivityLevel': serializeParam(
          _activityLevel,
          ParamType.String,
        ),
        'UserLevel': serializeParam(
          _userLevel,
          ParamType.String,
        ),
      }.withoutNulls;

  static CreationUserStruct fromSerializableMap(Map<String, dynamic> data) =>
      CreationUserStruct(
        name: deserializeParam(
          data['Name'],
          ParamType.String,
          false,
        ),
        email: deserializeParam(
          data['Email'],
          ParamType.String,
          false,
        ),
        password: deserializeParam(
          data['Password'],
          ParamType.String,
          false,
        ),
        age: deserializeParam(
          data['Age'],
          ParamType.int,
          false,
        ),
        height: deserializeParam(
          data['Height'],
          ParamType.int,
          false,
        ),
        weight: deserializeParam(
          data['Weight'],
          ParamType.double,
          false,
        ),
        gender: deserializeParam(
          data['Gender'],
          ParamType.String,
          false,
        ),
        goal: deserializeParam(
          data['Goal'],
          ParamType.String,
          false,
        ),
        activityLevel: deserializeParam(
          data['ActivityLevel'],
          ParamType.String,
          false,
        ),
        userLevel: deserializeParam(
          data['UserLevel'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CreationUserStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CreationUserStruct &&
        name == other.name &&
        email == other.email &&
        password == other.password &&
        age == other.age &&
        height == other.height &&
        weight == other.weight &&
        gender == other.gender &&
        goal == other.goal &&
        activityLevel == other.activityLevel &&
        userLevel == other.userLevel;
  }

  @override
  int get hashCode => const ListEquality().hash([
        name,
        email,
        password,
        age,
        height,
        weight,
        gender,
        goal,
        activityLevel,
        userLevel
      ]);
}

CreationUserStruct createCreationUserStruct({
  String? name,
  String? email,
  String? password,
  int? age,
  int? height,
  double? weight,
  String? gender,
  String? goal,
  String? activityLevel,
  String? userLevel,
}) =>
    CreationUserStruct(
      name: name,
      email: email,
      password: password,
      age: age,
      height: height,
      weight: weight,
      gender: gender,
      goal: goal,
      activityLevel: activityLevel,
      userLevel: userLevel,
    );
