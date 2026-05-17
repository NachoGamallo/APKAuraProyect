import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'exercice_component_model.dart';
export 'exercice_component_model.dart';

class ExerciceComponentWidget extends StatefulWidget {
  const ExerciceComponentWidget({
    super.key,
    required this.data,
    required this.callBack,
  });

  final ExerciseSumaryStruct? data;
  final Future Function(bool status)? callBack;

  @override
  State<ExerciceComponentWidget> createState() =>
      _ExerciceComponentWidgetState();
}

class _ExerciceComponentWidgetState extends State<ExerciceComponentWidget>
    with TickerProviderStateMixin {
  late ExerciceComponentModel _model;

  var hasContainerTriggered = false;
  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ExerciceComponentModel());

    animationsMap.addAll({
      'rowOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 200.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(20.0, 0.0),
          ),
        ],
      ),
      'containerOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: false,
        effectsBuilder: () => [
          TintEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            color: Color(0xFFD6BCFA),
            begin: 1.0,
            end: 0.0,
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      height: 100.0,
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              if (_model.isSelected == true)
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                  child: Container(
                    width: 9.2,
                    height: 75.0,
                    decoration: BoxDecoration(
                      color: Color(0xCC6C63FF),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25.0),
                        topRight: Radius.circular(25.0),
                        bottomLeft: Radius.circular(25.0),
                        bottomRight: Radius.circular(25.0),
                      ),
                    ),
                  ),
                ),
              Expanded(
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    _model.isSelected = !_model.isSelected;
                    safeSetState(() {});
                    await widget.callBack?.call(
                      _model.isSelected,
                    );
                    if (_model.isSelected == true) {
                      FFAppState().addToRoutineCreatorWithExerciseData(
                          RoutineCreatorWithExerciseDataStruct(
                        exercise: widget.data,
                      ));
                      safeSetState(() {});
                      if (animationsMap['rowOnActionTriggerAnimation'] !=
                          null) {
                        await animationsMap['rowOnActionTriggerAnimation']!
                            .controller
                            .forward(from: 0.0);
                      }
                      if (animationsMap['containerOnActionTriggerAnimation'] !=
                          null) {
                        safeSetState(() => hasContainerTriggered = true);
                        SchedulerBinding.instance.addPostFrameCallback(
                            (_) async => await animationsMap[
                                    'containerOnActionTriggerAnimation']!
                                .controller
                                .forward(from: 0.0));
                      }
                    } else {
                      FFAppState().removeFromRoutineCreatorWithExerciseData(
                          RoutineCreatorWithExerciseDataStruct(
                        exercise: widget.data,
                      ));
                      safeSetState(() {});
                      if (animationsMap['rowOnActionTriggerAnimation'] !=
                          null) {
                        await animationsMap['rowOnActionTriggerAnimation']!
                            .controller
                            .reverse();
                      }
                    }
                  },
                  child: Container(
                    width: double.infinity,
                    height: 75.0,
                    decoration: BoxDecoration(
                      color: Color(0xFF404067),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25.0),
                        topRight: Radius.circular(25.0),
                        bottomLeft: Radius.circular(25.0),
                        bottomRight: Radius.circular(25.0),
                      ),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(5.0, 10.0, 5.0, 10.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 48.0,
                            height: 48.0,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.network(
                              widget.data!.imageURL,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  valueOrDefault<String>(
                                    widget.data?.name,
                                    'defaultName',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight: FontWeight.bold,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: Color(0xCC6C63FF),
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                                Text(
                                  valueOrDefault<String>(
                                    widget.data?.primaryMuscle,
                                    'defaultPMuscle',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight: FontWeight.normal,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodySmall
                                                  .fontStyle,
                                        ),
                                        color: Colors.white,
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .fontStyle,
                                      ),
                                ),
                              ].divide(SizedBox(height: 4.0)),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(1.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 20.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  _model.apiExerciseDetails =
                                      await GetExerciseDetailsCall.call(
                                    exerciseID: widget.data?.id,
                                    token: currentAuthenticationToken,
                                  );

                                  FFAppState().actualExerciseDetails =
                                      ExerciseDetailsStruct.maybeFromMap(
                                          getJsonField(
                                    (_model.apiExerciseDetails?.jsonBody ?? ''),
                                    r'''$''',
                                  ))!;
                                  safeSetState(() {});
                                  _model.apiReport =
                                      await GetReportExerciseCall.call(
                                    exercise:
                                        FFAppState().actualExerciseDetails.id,
                                    token: currentAuthenticationToken,
                                  );

                                  FFAppState().ExerciseWeightReport =
                                      ExerciseReportInfoStruct.maybeFromMap(
                                          getJsonField(
                                    (_model.apiReport?.jsonBody ?? ''),
                                    r'''$''',
                                  ))!;
                                  safeSetState(() {});

                                  context.pushNamed(
                                      ExerciseSummaryWidget.routeName);

                                  safeSetState(() {});
                                },
                                child: Icon(
                                  Icons.show_chart,
                                  color: Color(0xCC6C63FF),
                                  size: 24.0,
                                ),
                              ),
                            ),
                          ),
                        ].divide(SizedBox(width: 16.0)),
                      ),
                    ),
                  ),
                ).animateOnActionTrigger(
                    animationsMap['containerOnActionTriggerAnimation']!,
                    hasBeenTriggered: hasContainerTriggered),
              ),
            ],
          ).animateOnActionTrigger(
            animationsMap['rowOnActionTriggerAnimation']!,
          ),
          Divider(
            thickness: 1.0,
            color: Color(0xCC6C63FF),
          ),
        ],
      ),
    );
  }
}
