import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/custom_confirm_message/custom_confirm_message_widget.dart';
import '/components/exercice_card/exercice_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'create_routine_screen_model.dart';
export 'create_routine_screen_model.dart';

/// Build a Flutter screen for 'Crear Rutina' with an active exercise list.
///
/// Theme: Futuristic. Palette: Background #D6BCFA (Light Lavender),
/// Containers #2D0B5A (Deep Purple), Accents #6200EA (Neon Purple). Header:
/// Row with 'Cancelar' (#6200EA), title 'Crear Rutina' (#2D0B5A), and
/// 'Guardar' button. Below, a text field 'Título de la Rutina' in #2D0B5A.
/// Main content: A list of exercise blocks. Each block has a header with a
/// small circular image, exercise name in #6200EA, and a three-dot icon.
/// Inside a #2D0B5A rounded container: 'Agregar notas' text, 'Descanso:
/// APAGADO' with timer icon, and a row with 'SERIE, KG, REPS' labels in
/// white. Below, a row with '1, -, -' and a '+ Agregar Serie' button, all
/// text in white. At the bottom, a prominent #6200EA floating-style button
/// with '+ Agregar ejercicio' in white. Use 16px border radius, white icons,
/// and modern typography for a clean, pro look. Navigation bar at bottom with
/// 3 icons, middle one active in #2D0B5A.
class CreateRoutineScreenWidget extends StatefulWidget {
  const CreateRoutineScreenWidget({super.key});

  static String routeName = 'CreateRoutineScreen';
  static String routePath = '/createRoutineScreen';

  @override
  State<CreateRoutineScreenWidget> createState() =>
      _CreateRoutineScreenWidgetState();
}

class _CreateRoutineScreenWidgetState extends State<CreateRoutineScreenWidget> {
  late CreateRoutineScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateRoutineScreenModel());

    _model.textController1 ??= TextEditingController(
        text: FFAppState().creationOfARoutine.name != ''
            ? FFAppState().creationOfARoutine.name
            : '');
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController(
        text: FFAppState().creationOfARoutine.desc != ''
            ? FFAppState().creationOfARoutine.desc
            : '');
    _model.textFieldFocusNode2 ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFF1E1E31),
        appBar: AppBar(
          backgroundColor: Color(0xFF1A1A2E),
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: AlignmentDirectional(-1.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      if ((FFAppState().RoutineCreatorWithExerciseData.length >
                              0) ||
                          (_model.textController1.text != '')) {
                        var confirmDialogResponse = await showDialog<bool>(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  content: Text(
                                      '¿Estas seguro que quieres descartar la rutina?'),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(
                                          alertDialogContext, false),
                                      child: Text('Cancelar'),
                                    ),
                                    TextButton(
                                      onPressed: () => Navigator.pop(
                                          alertDialogContext, true),
                                      child: Text('Descartar rutina'),
                                    ),
                                  ],
                                );
                              },
                            ) ??
                            false;
                        if (confirmDialogResponse) {
                          FFAppState().creationOfARoutine =
                              CreateRoutineStruct();
                          FFAppState().RoutineCreatorWithExerciseData = [];
                          safeSetState(() {});

                          context.pushNamed(RoutinesScreenWidget.routeName);
                        }
                      } else {
                        context.pushNamed(RoutinesScreenWidget.routeName);
                      }
                    },
                    child: Text(
                      'Cancelar',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                  ),
                ),
              ),
              Text(
                'Crear Rutina',
                style: FlutterFlowTheme.of(context).titleLarge.override(
                      font: GoogleFonts.interTight(
                        fontWeight: FontWeight.w600,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleLarge.fontStyle,
                      ),
                      color: Color(0xCCA18CFF),
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
                      fontStyle:
                          FlutterFlowTheme.of(context).titleLarge.fontStyle,
                    ),
              ),
              Builder(
                builder: (context) => FFButtonWidget(
                  onPressed: () async {
                    _model.apiCreateRoutine =
                        await RoutinesApiGroup.createRoutineCall.call(
                      token: currentAuthenticationToken,
                      name: _model.textController1.text,
                      desc: _model.textController2.text,
                      exercisesJson: functions
                          .functionForConverTheRoutinesExercices(FFAppState()
                              .RoutineCreatorWithExerciseData
                              .toList()),
                    );

                    if ((_model.apiCreateRoutine?.succeeded ?? true)) {
                      FFAppState().creationOfARoutine = CreateRoutineStruct();
                      FFAppState().RoutineCreatorWithExerciseData = [];
                      safeSetState(() {});
                      await showDialog(
                        context: context,
                        builder: (dialogContext) {
                          return Dialog(
                            elevation: 0,
                            insetPadding: EdgeInsets.zero,
                            backgroundColor: Colors.transparent,
                            alignment: AlignmentDirectional(0.0, 0.0)
                                .resolve(Directionality.of(context)),
                            child: GestureDetector(
                              onTap: () {
                                FocusScope.of(dialogContext).unfocus();
                                FocusManager.instance.primaryFocus?.unfocus();
                              },
                              child: CustomConfirmMessageWidget(
                                textForTheComp:
                                    'La rutina se ha creado con exito!',
                                callback: () async {
                                  context.pushNamed(
                                      RoutinesScreenWidget.routeName);
                                },
                              ),
                            ),
                          );
                        },
                      );
                    } else {
                      await showDialog(
                        context: context,
                        builder: (dialogContext) {
                          return Dialog(
                            elevation: 0,
                            insetPadding: EdgeInsets.zero,
                            backgroundColor: Colors.transparent,
                            alignment: AlignmentDirectional(0.0, 0.0)
                                .resolve(Directionality.of(context)),
                            child: GestureDetector(
                              onTap: () {
                                FocusScope.of(dialogContext).unfocus();
                                FocusManager.instance.primaryFocus?.unfocus();
                              },
                              child: CustomConfirmMessageWidget(
                                textForTheComp:
                                    'Ha habido un problema a la hora de generar la rutina...',
                                callback: () async {
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                          );
                        },
                      );
                    }

                    safeSetState(() {});
                  },
                  text: 'Guardar',
                  options: FFButtonOptions(
                    height: 30.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color:
                        FFAppState().RoutineCreatorWithExerciseData.length > 0
                            ? Color(0xCC6C63FF)
                            : Color(0xFF9D9DAB),
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          font: GoogleFonts.interTight(
                            fontWeight: FontWeight.normal,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .fontStyle,
                          ),
                          color: Colors.white,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.normal,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleSmall.fontStyle,
                        ),
                    elevation: 0.0,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ],
          ),
          actions: [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(15.0, 10.0, 15.0, 30.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          controller: _model.textController1,
                          focusNode: _model.textFieldFocusNode1,
                          onFieldSubmitted: (_) async {
                            FFAppState().updateCreationOfARoutineStruct(
                              (e) => e..name = _model.textController1.text,
                            );
                            safeSetState(() {});
                          },
                          autofocus: false,
                          obscureText: false,
                          decoration: InputDecoration(
                            hintText: 'Título de la Rutina',
                            hintStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xCC6C63FF),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(0.0),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(0.0),
                            ),
                            errorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(0.0),
                            ),
                            focusedErrorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(0.0),
                            ),
                            contentPadding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 16.0, 16.0, 16.0),
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                font: GoogleFonts.inter(
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 16.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w500,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                          cursorColor: Color(0xFF6200EA),
                          validator: _model.textController1Validator
                              .asValidator(context),
                        ),
                        TextFormField(
                          controller: _model.textController2,
                          focusNode: _model.textFieldFocusNode2,
                          onFieldSubmitted: (_) async {
                            FFAppState().updateCreationOfARoutineStruct(
                              (e) => e..desc = _model.textController2.text,
                            );
                            safeSetState(() {});
                          },
                          autofocus: false,
                          obscureText: false,
                          decoration: InputDecoration(
                            hintText: 'Descripción',
                            hintStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xCC6C63FF),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(0.0),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(0.0),
                            ),
                            errorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(0.0),
                            ),
                            focusedErrorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(0.0),
                            ),
                            contentPadding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 16.0, 16.0, 16.0),
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                font: GoogleFonts.inter(
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 16.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w500,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                          cursorColor: Color(0xFF6200EA),
                          validator: _model.textController2Validator
                              .asValidator(context),
                        ),
                      ],
                    ),
                  ),
                  Builder(
                    builder: (context) {
                      if (FFAppState().RoutineCreatorWithExerciseData.length >
                          0) {
                        return Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 20.0, 20.0, 0.0),
                              child: Builder(
                                builder: (context) {
                                  final listExercices = FFAppState()
                                      .RoutineCreatorWithExerciseData
                                      .toList();

                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: listExercices.length,
                                    itemBuilder: (context, listExercicesIndex) {
                                      final listExercicesItem =
                                          listExercices[listExercicesIndex];
                                      return wrapWithModel(
                                        model:
                                            _model.exerciceCardModels.getModel(
                                          listExercicesItem.exercise.id,
                                          listExercicesIndex,
                                        ),
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        updateOnChange: true,
                                        child: ExerciceCardWidget(
                                          key: Key(
                                            'Key77p_${listExercicesItem.exercise.id}',
                                          ),
                                          data: listExercicesItem,
                                          callBack: (dataModificated) async {
                                            FFAppState()
                                                .updateRoutineCreatorWithExerciseDataAtIndex(
                                              listExercicesIndex,
                                              (_) => dataModificated,
                                            );
                                            safeSetState(() {});
                                          },
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 15.0, 0.0, 0.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  context.pushNamed(
                                      ExercicesScreenWidget.routeName);
                                },
                                text: '+ Agregar Ejercicio',
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
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
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
                          ],
                        );
                      } else {
                        return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Icon(
                                Icons.sports_gymnastics,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 60.0,
                              ),
                              Text(
                                'Empieza agregando un ejercicio a tu rutina',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 15.0, 0.0, 0.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    _model.countExercices =
                                        _model.countExercices! + 1;
                                    safeSetState(() {});

                                    context.pushNamed(
                                        ExercicesScreenWidget.routeName);
                                  },
                                  text: '+ Agregar Ejercicio',
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
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          color: Colors.white,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
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
                            ].divide(SizedBox(height: 5.0)),
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
