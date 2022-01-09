import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:untitled4/bloc/auth_state/auth_state_cubit.dart';
import 'package:untitled4/bloc/saved_link/saved_link_cubit.dart';
import 'package:untitled4/pages/auth_page.dart';
import 'package:untitled4/pages/child_page.dart';
import 'package:untitled4/pages/main_page.dart';
import 'package:untitled4/pages/splash_page.dart';
import 'package:untitled4/router/router_notifier.dart';

class RouterSettings {
  static final notifier = RouterNotifier()..init();

  static GoRouter settings = GoRouter(
    routes: [
      GoRoute(
        path: '/splash',
        builder: (context, state) => SplashPage(),
      ),
      GoRoute(
        path: '/auth',
        builder: (context, state) => const AuthPage(),
      ),
      GoRoute(path: '/main', builder: (context, state) => MainPage(), routes: [
        GoRoute(
          path: 'child',
          builder: (context, state) => const ChildPage(),
        ),
      ]),
    ],
    initialLocation: '/splash',
    refreshListenable: notifier,
    redirect: (state) {
      final AuthStateState _authState = Get.find<AuthStateCubit>().state;
      final SavedLinkCubit _savedLinkCubit = Get.find<SavedLinkCubit>();

      // save deeplink for open current page after auth
      // I save only nested routes, it would be convenient to get the state of the root route here
      // if you remove the link check, there will be an error
      if (state.location.startsWith('/main/')) {
        _savedLinkCubit.saveLink(state.location);
      }

      if (!_authState.isAppInit) {
        return state.location != '/splash' ? '/splash' : null;
      }

      if (!_authState.isUserAuth) {
        return state.location != '/auth' ? '/auth' : null;
      }

      // clear saved link if user logged
      _savedLinkCubit.clearLink();

      return state.location == '/' ? '/main' : null;
    },
    debugLogDiagnostics: true,
  );
}
