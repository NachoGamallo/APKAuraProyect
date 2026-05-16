import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/auth/custom_auth/auth_util.dart';

int getLastSerie(List<ExerciseSeriesStruct> listSeries) {
  return listSeries.length + 1;
}

List<ExerciseSeriesStruct> reorderList(List<ExerciseSeriesStruct> list) {
  for (int i = 0; i < list.length; i++) {
    list[i].numSerie = i + 1;
  }

  return list;
}

String generateSimpleID() {
  return DateTime.now().millisecondsSinceEpoch.toString();
}

int incrementBy1(int number) {
  return number + 1;
}

List<dynamic> functionForConverTheRoutinesExercices(
    List<RoutineCreatorWithExerciseDataStruct> listExercicesUI) {
// Verificamos que la lista no sea nula para evitar errores
  if (listExercicesUI.isEmpty) {
    return [];
  }

  return listExercicesUI.asMap().entries.map((entry) {
    int index = entry.key;
    var ex = entry.value;

    // Accedemos a la primera serie de forma segura
    var series = ex.series as List<dynamic>? ?? [];
    var firstSerie = series.isNotEmpty ? series.first : null;

    return {
      "exerciseId": ex.exercise.id, // Debe coincidir con el campo UUID en tu DB
      "position": index + 1,
      "sets": ex.series.length,
      "reps": firstSerie?.reps ?? 0,
      "restSeconds": ex.timer,
      "initialWeight": firstSerie?.weight ?? 0.0
    };
  }).toList();
}

List<ExerciseSumaryStruct> remove1ExerciseFromList(
  ExerciseSumaryStruct exerciseToRemove,
  List<ExerciseSumaryStruct> listExercices,
) {
  return listExercices.where((e) => e != exerciseToRemove).toList();
}

int convertSecondsToMiliSeconds(int seconds) {
  return seconds * 1000;
}

dynamic jsonFormatToSessionExercises(List<RoutineExerciseStruct> data) {
  // 1. Verificamos que la lista general no esté vacía
  if (data.isEmpty) {
    return [];
  }

  List<dynamic> targetExercises = [];

  for (var ex in data) {
    var seriesList = ex.sets;

    // Si el ejercicio no tiene ninguna serie anotada, lo saltamos
    if (seriesList.isEmpty) {
      continue;
    }

    // 2. Mapeamos TODAS las series que estén en la lista
    List<dynamic> mappedSets = [];
    for (int i = 0; i < seriesList.length; i++) {
      var serie = seriesList[i];
      mappedSets.add({
        "setNumber": i + 1, // Genera automáticamente: 1, 2, 3...
        "weight": serie.previousWeight,
        "reps": serie.previousReps
      });
    }

    // 3. Añadimos el ejercicio con sus series al array principal
    targetExercises.add({
      "exerciseId": ex.exerciseId, // El UUID del ejercicio
      "sets": mappedSets // El sub-array de series
    });
  }

  return targetExercises;
}

List<RoutineExerciseSetStruct> reorderSetsList(
    List<RoutineExerciseSetStruct> list) {
  for (int i = 0; i < list.length; i++) {
    list[i].setNumber = i + 1;
  }

  return list;
}
