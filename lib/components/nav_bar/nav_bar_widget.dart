import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'nav_bar_model.dart';
export 'nav_bar_model.dart';

class NavBarWidget extends StatefulWidget {
  const NavBarWidget({
    super.key,
    int? actualScreen,
  }) : this.actualScreen = actualScreen ?? 0;

  final int actualScreen;

  @override
  State<NavBarWidget> createState() => _NavBarWidgetState();
}

class _NavBarWidgetState extends State<NavBarWidget> {
  late NavBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 1.0),
      child: Container(
        width: double.infinity,
        height: 60.0,
        decoration: BoxDecoration(
          color: Color(0xFF1A1A2E),
          boxShadow: [
            BoxShadow(
              blurRadius: 8.0,
              color: Color(0x1A000000),
              offset: Offset(
                0.0,
                2.0,
              ),
            )
          ],
          borderRadius: BorderRadius.circular(24.0),
          border: Border.all(
            color: Color(0xFF1A1A2E),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FlutterFlowIconButton(
              borderRadius: 24.0,
              buttonSize: 48.0,
              fillColor: Colors.transparent,
              icon: Icon(
                Icons.home,
                color: widget.actualScreen == 1
                    ? Color(0xCCA18CFF)
                    : Color(0xCC6C63FF),
                size: 24.0,
              ),
              onPressed: () async {
                context.pushNamed(HomeScreenWidget.routeName);
              },
            ),
            FlutterFlowIconButton(
              borderRadius: 24.0,
              buttonSize: 48.0,
              fillColor: Colors.transparent,
              icon: Icon(
                Icons.fitness_center,
                color: widget.actualScreen == 2
                    ? Color(0xCCA18CFF)
                    : Color(0xCC6C63FF),
                size: 24.0,
              ),
              onPressed: () async {
                context.pushNamed(RoutinesScreenWidget.routeName);
              },
            ),
            FlutterFlowIconButton(
              borderRadius: 24.0,
              buttonSize: 48.0,
              fillColor: Colors.transparent,
              icon: Icon(
                Icons.person,
                color: widget.actualScreen == 3
                    ? Color(0xCCA18CFF)
                    : Color(0xCC6C63FF),
                size: 24.0,
              ),
              onPressed: () async {
                context.pushNamed(UserProfileWidget.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
