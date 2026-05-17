import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/custom_confirm_message/custom_confirm_message_widget.dart';
import '/components/custom_send_data_message/custom_send_data_message_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'user_change_settings_model.dart';
export 'user_change_settings_model.dart';

class UserChangeSettingsWidget extends StatefulWidget {
  const UserChangeSettingsWidget({super.key});

  static String routeName = 'UserChangeSettings';
  static String routePath = '/userChangeSettings';

  @override
  State<UserChangeSettingsWidget> createState() =>
      _UserChangeSettingsWidgetState();
}

class _UserChangeSettingsWidgetState extends State<UserChangeSettingsWidget> {
  late UserChangeSettingsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserChangeSettingsModel());
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
          backgroundColor: Color(0xFF1E1E31),
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 22.0,
            borderWidth: 0.0,
            buttonSize: 44.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Color(0xCCA18CFF),
              size: 24.0,
            ),
            onPressed: () async {
              context.safePop();
            },
          ),
          title: Text(
            'Ajustes de usuario',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  font: GoogleFonts.interTight(
                    fontWeight: FontWeight.bold,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                  ),
                  color: Color(0xCCA18CFF),
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.bold,
                  fontStyle:
                      FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 30.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 16.0, 20.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Container(
                          width: 100.0,
                          height: 110.0,
                          child: Stack(
                            children: [
                              Container(
                                width: 100.0,
                                height: 100.0,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: Image.network(
                                      FFAppState().actualUser.imageURL,
                                    ).image,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 12.0,
                                      color: Color(0x334A235A),
                                      offset: Offset(
                                        0.0,
                                        4.0,
                                      ),
                                    )
                                  ],
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 3.0,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(1.0, 1.0),
                                child: Container(
                                  width: 32.0,
                                  height: 32.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xCC6C63FF),
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 2.0,
                                    ),
                                  ),
                                  child: Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Icon(
                                      Icons.photo_camera_rounded,
                                      color: Colors.white,
                                      size: 16.0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Builder(
                        builder: (context) => Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 8.0, 0.0, 0.0),
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
                                    child: GestureDetector(
                                      onTap: () {
                                        FocusScope.of(dialogContext).unfocus();
                                        FocusManager.instance.primaryFocus
                                            ?.unfocus();
                                      },
                                      child: CustomSendDataMessageWidget(
                                        componentText:
                                            'Ingresa la url de tú nueva imagen de perfil',
                                        textForTextField: 'url...',
                                        callBack: (newUrl) async {
                                          _model.resultImgChange =
                                              await ChangeUserDataGroup
                                                  .changeUserImgCall
                                                  .call(
                                            token: currentAuthenticationToken,
                                            img: newUrl,
                                          );

                                          if ((_model
                                                  .resultImgChange?.succeeded ??
                                              true)) {
                                            _model.userDataOutput =
                                                await GetUserDataCall.call(
                                              token: currentAuthenticationToken,
                                            );

                                            if ((_model.userDataOutput
                                                    ?.succeeded ??
                                                true)) {
                                              FFAppState().actualUser =
                                                  UserDataStruct.maybeFromMap(
                                                      getJsonField(
                                                (_model.userDataOutput
                                                        ?.jsonBody ??
                                                    ''),
                                                r'''$''',
                                              ))!;
                                              safeSetState(() {});

                                              context.pushNamed(
                                                  UserProfileWidget.routeName);
                                            }
                                          } else {
                                            await showDialog(
                                              context: context,
                                              builder: (dialogContext) {
                                                return Dialog(
                                                  elevation: 0,
                                                  insetPadding: EdgeInsets.zero,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  alignment:
                                                      AlignmentDirectional(
                                                              0.0, 0.0)
                                                          .resolve(
                                                              Directionality.of(
                                                                  context)),
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      FocusScope.of(
                                                              dialogContext)
                                                          .unfocus();
                                                      FocusManager
                                                          .instance.primaryFocus
                                                          ?.unfocus();
                                                    },
                                                    child:
                                                        CustomConfirmMessageWidget(
                                                      textForTheComp:
                                                          'Algo ha salido mal cambiando la imagen... Vuelve a intentarlo',
                                                      callback: () async {
                                                        Navigator.pop(context);
                                                      },
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          }
                                        },
                                      ),
                                    ),
                                  );
                                },
                              );

                              safeSetState(() {});
                            },
                            child: Text(
                              'Cambiar foto de perfil',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: Color(0xCCA18CFF),
                                    fontSize: 13.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 0.0, 8.0),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Color(0xFF1E1E31),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 20.0,
                                    color: Color(0x264A235A),
                                    offset: Offset(
                                      0.0,
                                      6.0,
                                    ),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Color(0xFF1A1A2E),
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 18.0, 16.0, 18.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed(
                                                ChangeUserNameWidget.routeName);
                                          },
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Container(
                                                    width: 44.0,
                                                    height: 44.0,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xCC6C63FF),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Icon(
                                                        Icons
                                                            .person_outline_rounded,
                                                        color: Colors.white,
                                                        size: 22.0,
                                                      ),
                                                    ),
                                                  ),
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Cambiar nombre de usuario',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      13.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                      Text(
                                                        'Cambiar tu nombre visible',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      11.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                ].divide(SizedBox(width: 16.0)),
                                              ),
                                              Icon(
                                                Icons.chevron_right_rounded,
                                                color: Color(0xCC6C63FF),
                                                size: 20.0,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Divider(
                                      height: 1.0,
                                      thickness: 1.0,
                                      indent: 76.0,
                                      endIndent: 16.0,
                                      color: Color(0xCCA18CFF),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Color(0xFF1A1A2E),
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 18.0, 16.0, 18.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed(
                                                ChangeUserMailWidget.routeName);
                                          },
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Container(
                                                    width: 44.0,
                                                    height: 44.0,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xCC6C63FF),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Icon(
                                                        Icons
                                                            .mail_outline_rounded,
                                                        color: Colors.white,
                                                        size: 22.0,
                                                      ),
                                                    ),
                                                  ),
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Cambiar Mail',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      13.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                      Text(
                                                        'Modificar tu direccion de correo',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      11.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                ].divide(SizedBox(width: 16.0)),
                                              ),
                                              Icon(
                                                Icons.chevron_right_rounded,
                                                color: Color(0xCC6C63FF),
                                                size: 20.0,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Divider(
                                      height: 1.0,
                                      thickness: 1.0,
                                      indent: 76.0,
                                      endIndent: 16.0,
                                      color: Color(0xCCA18CFF),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Color(0xFF1A1A2E),
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 18.0, 16.0, 18.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed(
                                                ChangeUserPasswordWidget
                                                    .routeName);
                                          },
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Container(
                                                    width: 44.0,
                                                    height: 44.0,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xCC6C63FF),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Icon(
                                                        Icons
                                                            .lock_outline_rounded,
                                                        color: Colors.white,
                                                        size: 22.0,
                                                      ),
                                                    ),
                                                  ),
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Cambiar contraseña',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      13.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                      Text(
                                                        'Cambiar tu contraseña de acceso',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      11.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                ].divide(SizedBox(width: 16.0)),
                                              ),
                                              Icon(
                                                Icons.chevron_right_rounded,
                                                color: Color(0xCC6C63FF),
                                                size: 20.0,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 20.0, 8.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                var confirmDialogResponse = await showDialog<
                                        bool>(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title:
                                              Text('Confirmar cerrar sesion'),
                                          content: Text(
                                              '¿Está seguro de que desea cerrar sesion?'),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext, false),
                                              child: Text('Cancel'),
                                            ),
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext, true),
                                              child: Text('Confirm'),
                                            ),
                                          ],
                                        );
                                      },
                                    ) ??
                                    false;
                                if (confirmDialogResponse) {
                                  FFAppState().actualUser = UserDataStruct();
                                  safeSetState(() {});

                                  context
                                      .pushNamed(LogginScreenWidget.routeName);
                                }
                              },
                              text: 'Cerrar Sesion',
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: Color(0xCCF2ACAD),
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: Color(0xCCFFFFFF),
                                      fontSize: 20.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                elevation: 0.0,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 20.0, 8.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                var confirmDialogResponse = await showDialog<
                                        bool>(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title:
                                              Text('Confirmar eliminar cuenta'),
                                          content: Text(
                                              '¿Está seguro de que desea eliminar su cuenta? Esta acción es irreversible.'),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext, false),
                                              child: Text('Cancel'),
                                            ),
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext, true),
                                              child: Text('Confirm'),
                                            ),
                                          ],
                                        );
                                      },
                                    ) ??
                                    false;
                                if (confirmDialogResponse) {
                                  await ChangeUserDataGroup.deleteUserCall.call(
                                    token: currentAuthenticationToken,
                                  );

                                  context
                                      .pushNamed(LogginScreenWidget.routeName);
                                }
                              },
                              text: 'Borrar cuenta',
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: Color(0xCCFF3F42),
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: Color(0xCCFFFFFF),
                                      fontSize: 20.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                elevation: 0.0,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ]
                            .addToStart(SizedBox(height: 24.0))
                            .addToEnd(SizedBox(height: 32.0)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
