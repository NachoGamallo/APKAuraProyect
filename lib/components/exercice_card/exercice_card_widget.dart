import '/backend/schema/structs/index.dart';
import '/components/action2_sheet_simple/action2_sheet_simple_widget.dart';
import '/components/custom_send_data_message_integer/custom_send_data_message_integer_widget.dart';
import '/components/row_serie/row_serie_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'exercice_card_model.dart';
export 'exercice_card_model.dart';

class ExerciceCardWidget extends StatefulWidget {
  const ExerciceCardWidget({
    super.key,
    required this.data,
    required this.callBack,
  });

  final RoutineCreatorWithExerciseDataStruct? data;
  final Future Function(RoutineCreatorWithExerciseDataStruct dataModificated)?
      callBack;

  @override
  State<ExerciceCardWidget> createState() => _ExerciceCardWidgetState();
}

class _ExerciceCardWidgetState extends State<ExerciceCardWidget> {
  late ExerciceCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ExerciceCardModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.dataToModificate = widget.data;
      safeSetState(() {});
      if (_model.dataToModificate!.series.length <= 0) {
        _model.updateDataToModificateStruct(
          (e) => e
            ..updateSeries(
              (e) => e.add(ExerciseSeriesStruct(
                id: '1',
                numSerie: 1,
              )),
            ),
        );
        safeSetState(() {});
      }
      await widget.callBack?.call(
        _model.dataToModificate!,
      );
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
                          width: 62.99,
                          height: 62.99,
                          decoration: BoxDecoration(
                            color: Color(0xCC6C63FF),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: Image.network(
                                widget.data!.exercise.imageURL,
                              ).image,
                            ),
                            shape: BoxShape.circle,
                          ),
                        ),
                        Text(
                          valueOrDefault<String>(
                            widget.data?.exercise.name,
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
                    Builder(
                      builder: (context) => InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          await showDialog(
                            context: context,
                            builder: (dialogContext) {
                              return Dialog(
                                elevation: 0,
                                insetPadding: EdgeInsets.zero,
                                backgroundColor: Colors.transparent,
                                alignment: AlignmentDirectional(0.0, 1.0)
                                    .resolve(Directionality.of(context)),
                                child: Action2SheetSimpleWidget(
                                  dataOfExercise: widget.data!.exercise,
                                  dataToRemove: widget.data!,
                                ),
                              );
                            },
                          );

                          await widget.callBack?.call(
                            _model.dataToModificate!,
                          );
                        },
                        child: Icon(
                          Icons.more_vert,
                          color: Color(0xCC6C63FF),
                          size: 24.0,
                        ),
                      ),
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
                      Builder(
                        builder: (context) => Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 30.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              await showDialog(
                                context: context,
                                builder: (dialogContext) {
                                  return Dialog(
                                    elevation: 0,
                                    insetPadding: EdgeInsets.zero,
                                    backgroundColor: Colors.transparent,
                                    alignment: AlignmentDirectional(0.0, 0.0)
                                        .resolve(Directionality.of(context)),
                                    child: CustomSendDataMessageIntegerWidget(
                                      componentText: 'Descanso entre series:',
                                      textForTextField:
                                          'Ingresa en segundos...',
                                      callBack: (Number) async {
                                        _model.updateDataToModificateStruct(
                                          (e) => e..timer = Number,
                                        );
                                        safeSetState(() {});
                                        context.safePop();
                                      },
                                    ),
                                  );
                                },
                              );

                              await widget.callBack?.call(
                                _model.dataToModificate!,
                              );
                            },
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
                                  'Descanso: ${widget.data!.timer <= 0 ? 'APAGADO' : widget.data?.timer.toString()}',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
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
                              _model.dataToModificate?.series.toList() ?? [];

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
                                    _model.dataToModificate!.series.length
                                        .toString(),
                                    listaDeSeriesIndex,
                                  ),
                                  updateCallback: () => safeSetState(() {}),
                                  child: RowSerieWidget(
                                    key: Key(
                                      'Keybet_${_model.dataToModificate!.series.length.toString()}',
                                    ),
                                    item: listaDeSeriesItem,
                                    type: 0,
                                    callBackID: () async {
                                      _model.updateDataToModificateStruct(
                                        (e) => e
                                          ..updateSeries(
                                            (e) => e.remove(listaDeSeriesItem),
                                          ),
                                      );
                                      safeSetState(() {});
                                      _model.updateDataToModificateStruct(
                                        (e) => e
                                          ..series = functions
                                              .reorderList(_model
                                                  .dataToModificate!.series
                                                  .toList())
                                              .toList(),
                                      );
                                      safeSetState(() {});
                                      await widget.callBack?.call(
                                        _model.dataToModificate!,
                                      );
                                    },
                                    onUpdateKg: (value) async {
                                      _model.updateDataToModificateStruct(
                                        (e) => e
                                          ..updateSeries(
                                            (e) => e[listaDeSeriesIndex]
                                              ..weight = value,
                                          ),
                                      );
                                      _model.actualKG = value;
                                      safeSetState(() {});
                                      await widget.callBack?.call(
                                        _model.dataToModificate!,
                                      );
                                    },
                                    onUpdateReps: (value) async {
                                      _model.updateDataToModificateStruct(
                                        (e) => e
                                          ..updateSeries(
                                            (e) => e[listaDeSeriesIndex]
                                              ..reps = value,
                                          ),
                                      );
                                      _model.actualReps = value;
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
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            _model.updateDataToModificateStruct(
                              (e) => e
                                ..updateSeries(
                                  (e) => e.add(ExerciseSeriesStruct(
                                    numSerie: functions.getLastSerie(_model
                                        .dataToModificate!.series
                                        .toList()),
                                    weight: _model.actualKG,
                                    reps: _model.actualReps,
                                    id: functions.generateSimpleID(),
                                  )),
                                ),
                            );
                            safeSetState(() {});
                            await widget.callBack?.call(
                              _model.dataToModificate!,
                            );
                          },
                          text: '+ Agregar Serie',
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 36.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 8.0, 16.0, 8.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: Color(0xCC6C63FF),
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                            elevation: 0.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
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
