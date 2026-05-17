// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserDataStruct extends BaseStruct {
  UserDataStruct({
    String? id,
    String? name,
    String? email,
    String? imageURL,
    UserHomeDataStruct? homeData,
  })  : _id = id,
        _name = name,
        _email = email,
        _imageURL = imageURL,
        _homeData = homeData;

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

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;

  bool hasEmail() => _email != null;

  // "imageURL" field.
  String? _imageURL;
  String get imageURL => _imageURL ?? '';
  set imageURL(String? val) => _imageURL = val;

  bool hasImageURL() => _imageURL != null;

  // "homeData" field.
  UserHomeDataStruct? _homeData;
  UserHomeDataStruct get homeData => _homeData ?? UserHomeDataStruct();
  set homeData(UserHomeDataStruct? val) => _homeData = val;

  void updateHomeData(Function(UserHomeDataStruct) updateFn) {
    updateFn(_homeData ??= UserHomeDataStruct());
  }

  bool hasHomeData() => _homeData != null;

  static UserDataStruct fromMap(Map<String, dynamic> data) => UserDataStruct(
        id: data['id'] as String?,
        name: data['name'] as String?,
        email: data['email'] as String?,
        imageURL: data['imageURL'] as String?,
        homeData: data['homeData'] is UserHomeDataStruct
            ? data['homeData']
            : UserHomeDataStruct.maybeFromMap(data['homeData']),
      );

  static UserDataStruct? maybeFromMap(dynamic data) =>
      data is Map ? UserDataStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
        'email': _email,
        'imageURL': _imageURL,
        'homeData': _homeData?.toMap(),
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
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
        'imageURL': serializeParam(
          _imageURL,
          ParamType.String,
        ),
        'homeData': serializeParam(
          _homeData,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static UserDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserDataStruct(
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
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
        imageURL: deserializeParam(
          data['imageURL'],
          ParamType.String,
          false,
        ),
        homeData: deserializeStructParam(
          data['homeData'],
          ParamType.DataStruct,
          false,
          structBuilder: UserHomeDataStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'UserDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserDataStruct &&
        id == other.id &&
        name == other.name &&
        email == other.email &&
        imageURL == other.imageURL &&
        homeData == other.homeData;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([id, name, email, imageURL, homeData]);
}

UserDataStruct createUserDataStruct({
  String? id,
  String? name,
  String? email,
  String? imageURL,
  UserHomeDataStruct? homeData,
}) =>
    UserDataStruct(
      id: id,
      name: name,
      email: email,
      imageURL: imageURL,
      homeData: homeData ?? UserHomeDataStruct(),
    );
