import '/backend/schema/structs/index.dart';
import '/components/row_serie/row_serie_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'exercise_card_routine_model.dart';
export 'exercise_card_routine_model.dart';

class ExerciseCardRoutineWidget extends StatefulWidget {
  const ExerciseCardRoutineWidget({
    super.key,
    required this.exercise,
    required this.callBack,
  });

  final RoutineExerciseStruct? exercise;
  final Future Function(RoutineExerciseStruct dataToModificate)? callBack;

  @override
  State<ExerciseCardRoutineWidget> createState() =>
      _ExerciseCardRoutineWidgetState();
}

class _ExerciseCardRoutineWidgetState extends State<ExerciseCardRoutineWidget> {
  late ExerciseCardRoutineModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ExerciseCardRoutineModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.dataToModificate = widget.exercise;
      safeSetState(() {});
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xFF1A1A2E),
          boxShadow: [
            BoxShadow(
              blurRadius: 8.0,
              color: Color(0x1A000000),
              offset: Offset(
                0.0,
                4.0,
              ),
            )
          ],
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(4.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 63.0,
                          height: 63.0,
                          decoration: BoxDecoration(
                            color: Color(0xCC6C63FF),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: Image.network(
                                widget.exercise!.exerciseImg,
                              ).image,
                            ),
                            shape: BoxShape.circle,
                          ),
                        ),
                        Text(
                          valueOrDefault<String>(
                            widget.exercise?.exerciseName,
                            'defaultName',
                          ),
                          style:
                              FlutterFlowTheme.of(context).titleMedium.override(
                                    font: GoogleFonts.interTight(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontStyle,
                                    ),
                                    color: Color(0xCC6C63FF),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontStyle,
                                  ),
                        ),
                      ].divide(SizedBox(width: 12.0)),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 30.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.timer,
                              color: Color(0xCC6C63FF),
                              size: 20.0,
                            ),
                            Text(
                              'Descanso: ${widget.exercise!.restTime <= 0 ? 'APAGADO' : widget.exercise?.restTime.toString()}',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: Color(0xCC6C63FF),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                          ].divide(SizedBox(width: 8.0)),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: Text(
                              'SERIE',
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .fontStyle,
                                    ),
                                    color: Color(0xCC6C63FF),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .fontStyle,
                                  ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'KG',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .fontStyle,
                                    ),
                                    color: Color(0xCC6C63FF),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .fontStyle,
                                  ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'REPS',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .fontStyle,
                                    ),
                                    color: Color(0xCC6C63FF),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .fontStyle,
                                  ),
                            ),
                          ),
                        ],
                      ),
                      Builder(
                        builder: (context) {
                          final listaDeSeries =
                              _model.dataToModificate?.sets.toList() ?? [];

                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: listaDeSeries.length,
                            itemBuilder: (context, listaDeSeriesIndex) {
                              final listaDeSeriesItem =
                                  listaDeSeries[listaDeSeriesIndex];
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 2.0),
                                child: wrapWithModel(
                                  model: _model.rowSerieModels.getModel(
                                    listaDeSeriesItem.id.toString(),
                                    listaDeSeriesIndex,
                                  ),
                                  updateCallback: () => safeSetState(() {}),
                                  updateOnChange: true,
                                  child: RowSerieWidget(
                                    key: Key(
                                      'Key1wv_${listaDeSeriesItem.id.toString()}',
                                    ),
                                    type: 1,
                                    itemForRoutine: listaDeSeriesItem,
                                    timmer: widget.exercise?.restTime,
                                    callBackID: () async {
                                      _model.updateDataToModificateStruct(
                                        (e) => e
                                          ..updateSets(
                                            (e) => e.remove(listaDeSeriesItem),
                                          ),
                                      );
                                      safeSetState(() {});
                                      _model.updateDataToModificateStruct(
                                        (e) => e
                                          ..sets = functions
                                              .reorderSetsList(_model
                                                  .dataToModificate!.sets
                                                  .toList())
                                              .toList(),
                                      );
                                      _model.updatePage(() {});
                                      await widget.callBack?.call(
                                        _model.dataToModificate!,
                                      );
                                    },
                                    onUpdateKg: (value) async {
                                      _model.updateDataToModificateStruct(
                                        (e) => e
                                          ..updateSets(
                                            (e) => e[listaDeSeriesIndex]
                                              ..previousWeight = value,
                                          ),
                                      );
                                      safeSetState(() {});
                                      await widget.callBack?.call(
                                        _model.dataToModificate!,
                                      );
                                    },
                                    onUpdateReps: (value) async {
                                      _model.updateDataToModificateStruct(
                                        (e) => e
                                          ..updateSets(
                                            (e) => e[listaDeSeriesIndex]
                                              ..previousReps = value,
                                          ),
                                      );
                                      safeSetState(() {});
                                      await widget.callBack?.call(
                                        _model.dataToModificate!,
                                      );
                                    },
                                    changeStatus: (status) async {},
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ].divide(SizedBox(height: 8.0)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
