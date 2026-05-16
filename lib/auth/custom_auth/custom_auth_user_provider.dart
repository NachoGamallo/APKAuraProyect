import 'package:rxdart/rxdart.dart';

import 'custom_auth_manager.dart';

class AURAProyectAuthUser {
  AURAProyectAuthUser({required this.loggedIn, this.uid});

  bool loggedIn;
  String? uid;
}

/// Generates a stream of the authenticated user.
BehaviorSubject<AURAProyectAuthUser> aURAProyectAuthUserSubject =
    BehaviorSubject.seeded(AURAProyectAuthUser(loggedIn: false));
Stream<AURAProyectAuthUser> aURAProyectAuthUserStream() =>
    aURAProyectAuthUserSubject
        .asBroadcastStream()
        .map((user) => currentUser = user);
