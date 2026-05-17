import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start ChangeUserData Group Code

class ChangeUserDataGroup {
  static String getBaseUrl({
    String? token = '',
  }) =>
      'https://impose-glamour-that.ngrok-free.dev/api/user';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer [Token]',
    'ngrok-skip-browser-warning': 'true',
  };
  static UpdateUserNameCall updateUserNameCall = UpdateUserNameCall();
  static UpdateUserEmailCall updateUserEmailCall = UpdateUserEmailCall();
  static ChangeUserPasswordCall changeUserPasswordCall =
      ChangeUserPasswordCall();
  static DeleteUserCall deleteUserCall = DeleteUserCall();
  static ChangeUserImgCall changeUserImgCall = ChangeUserImgCall();
}

class UpdateUserNameCall {
  Future<ApiCallResponse> call({
    String? name = '',
    String? token = '',
  }) async {
    final baseUrl = ChangeUserDataGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "name": "${escapeStringForJson(name)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'UpdateUserName',
      apiUrl: '${baseUrl}/change-name',
      callType: ApiCallType.PATCH,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${token}',
        'ngrok-skip-browser-warning': 'true',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateUserEmailCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? token = '',
  }) async {
    final baseUrl = ChangeUserDataGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "email": "${escapeStringForJson(email)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'UpdateUserEmail',
      apiUrl: '${baseUrl}/change-email',
      callType: ApiCallType.PATCH,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${token}',
        'ngrok-skip-browser-warning': 'true',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ChangeUserPasswordCall {
  Future<ApiCallResponse> call({
    String? oldPassword = '',
    String? newPassword = '',
    String? token = '',
  }) async {
    final baseUrl = ChangeUserDataGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "oldPassword": "${escapeStringForJson(oldPassword)}",
  "newPassword": "${escapeStringForJson(newPassword)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'ChangeUserPassword',
      apiUrl: '${baseUrl}/change-password',
      callType: ApiCallType.PATCH,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${token}',
        'ngrok-skip-browser-warning': 'true',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteUserCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = ChangeUserDataGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'deleteUser',
      apiUrl: '${baseUrl}/delete',
      callType: ApiCallType.PATCH,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${token}',
        'ngrok-skip-browser-warning': 'true',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ChangeUserImgCall {
  Future<ApiCallResponse> call({
    String? img = '',
    String? token = '',
  }) async {
    final baseUrl = ChangeUserDataGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
 "img": "${escapeStringForJson(img)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'ChangeUserImg',
      apiUrl: '${baseUrl}/change-img',
      callType: ApiCallType.PATCH,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${token}',
        'ngrok-skip-browser-warning': 'true',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End ChangeUserData Group Code

/// Start RoutinesApi Group Code

class RoutinesApiGroup {
  static String getBaseUrl({
    String? token = '',
  }) =>
      'https://impose-glamour-that.ngrok-free.dev/api/routines/';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer [Token]',
    'ngrok-skip-browser-warning': 'true',
  };
  static CreateRoutineCall createRoutineCall = CreateRoutineCall();
  static GetRoutinesOfUserCall getRoutinesOfUserCall = GetRoutinesOfUserCall();
}

class CreateRoutineCall {
  Future<ApiCallResponse> call({
    String? name = '',
    String? desc = '',
    dynamic exercisesJson,
    String? token = '',
  }) async {
    final baseUrl = RoutinesApiGroup.getBaseUrl(
      token: token,
    );

    final exercises = _serializeJson(exercisesJson, true);
    final ffApiRequestBody = '''
{

   "name":"${escapeStringForJson(name)}",
   "desc":"${escapeStringForJson(desc)}",
   "exercises":${exercises}

}''';
    return ApiManager.instance.makeApiCall(
      callName: 'CreateRoutine',
      apiUrl: '${baseUrl}/create',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${token}',
        'ngrok-skip-browser-warning': 'true',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetRoutinesOfUserCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = RoutinesApiGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'getRoutinesOfUser',
      apiUrl: '${baseUrl}/getRoutines',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${token}',
        'ngrok-skip-browser-warning': 'true',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End RoutinesApi Group Code

/// Start WorkOutGroup Group Code

class WorkOutGroupGroup {
  static String getBaseUrl({
    String? token = '',
  }) =>
      'https://impose-glamour-that.ngrok-free.dev/api/workout';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer [Token]',
    'ngrok-skip-browser-warning': 'true',
  };
  static GetRoutineByIdCall getRoutineByIdCall = GetRoutineByIdCall();
  static SaveSessionDataCall saveSessionDataCall = SaveSessionDataCall();
}

class GetRoutineByIdCall {
  Future<ApiCallResponse> call({
    String? routineId = '',
    String? token = '',
  }) async {
    final baseUrl = WorkOutGroupGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'GetRoutineById',
      apiUrl: '${baseUrl}/start/${routineId}',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${token}',
        'ngrok-skip-browser-warning': 'true',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SaveSessionDataCall {
  Future<ApiCallResponse> call({
    String? routineId = '',
    int? durationSeconds,
    dynamic exercisesJson,
    String? token = '',
  }) async {
    final baseUrl = WorkOutGroupGroup.getBaseUrl(
      token: token,
    );

    final exercises = _serializeJson(exercisesJson);
    final ffApiRequestBody = '''
{
  "routineId": "${escapeStringForJson(routineId)}",
  "durationSeconds": ${durationSeconds},
  "exercises": ${exercises}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'SaveSessionData',
      apiUrl: '${baseUrl}/finish',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${token}',
        'ngrok-skip-browser-warning': 'true',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End WorkOutGroup Group Code

class RegisterCall {
  static Future<ApiCallResponse> call({
    String? name = '',
    String? email = '',
    String? password = '',
    String? gender = '',
    double? weight,
    int? height,
    int? age,
    String? goal = '',
    String? activityLevel = '',
    String? level = '',
  }) async {
    final ffApiRequestBody = '''
{
  "name": "${escapeStringForJson(name)}",
  "email": "${escapeStringForJson(email)}",
  "password": "${escapeStringForJson(password)}",
  "age": ${age},
  "heightCM": ${height},
  "initialWeight": ${weight},
  "gender": "${escapeStringForJson(gender)}",
  "level": "${escapeStringForJson(level)}",
  "activityLevel": "${escapeStringForJson(activityLevel)}",
  "goal": "${escapeStringForJson(goal)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Register',
      apiUrl: 'https://impose-glamour-that.ngrok-free.dev/api/auth/register',
      callType: ApiCallType.POST,
      headers: {
        'Key': 'ngrok-skip-browser-warning',
        'Value': 'true',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class LoginCall {
  static Future<ApiCallResponse> call({
    String? email = '',
    String? pass = '',
  }) async {
    final ffApiRequestBody = '''
{
   "email" : "${escapeStringForJson(email)}",
   "pass" : "${escapeStringForJson(pass)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Login',
      apiUrl: 'https://impose-glamour-that.ngrok-free.dev/api/auth/login',
      callType: ApiCallType.POST,
      headers: {
        'Key': 'ngrok-skip-browser-warning',
        'Value': 'true',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetHomeDataCall {
  static Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getHomeData',
      apiUrl: 'https://impose-glamour-that.ngrok-free.dev/api/user/home',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
        'ngrok-skip-browser-warning': 'true',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetExerciseSummaryCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetExerciseSummary',
      apiUrl: 'https://impose-glamour-that.ngrok-free.dev/api/exercises',
      callType: ApiCallType.GET,
      headers: {
        'ngrok-skip-browser-warning': 'true',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetUserDataCall {
  static Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetUserData',
      apiUrl: 'https://impose-glamour-that.ngrok-free.dev/api/user/data',
      callType: ApiCallType.GET,
      headers: {
        'ngrok-skip-browser-warning': 'true',
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetExerciseDetailsCall {
  static Future<ApiCallResponse> call({
    String? exerciseID = '',
    String? token = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetExerciseDetails',
      apiUrl:
          'https://impose-glamour-that.ngrok-free.dev/api/exercises/${exerciseID}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
        'ngrok-skip-browser-warning': 'true',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetReportExerciseCall {
  static Future<ApiCallResponse> call({
    String? exercise = '',
    String? token = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getReportExercise',
      apiUrl:
          'https://impose-glamour-that.ngrok-free.dev/api/exercises/${exercise}/report',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
        'ngrok-skip-browser-warning': 'true',
        'Content-Type': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateBodyRecordCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    double? weight,
  }) async {
    final ffApiRequestBody = '''
{
  "weight": ${weight}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'CreateBodyRecord',
      apiUrl:
          'https://impose-glamour-that.ngrok-free.dev/api/record/body-record',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
        'ngrok-skip-browser-warning': 'true',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
