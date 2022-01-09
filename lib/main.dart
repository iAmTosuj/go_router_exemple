import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled4/bloc/auth_state/auth_state_cubit.dart';
import 'package:untitled4/bloc/saved_link/saved_link_cubit.dart';
import 'package:untitled4/router/router_settings.dart';

void main() {
  Get.put(AuthStateCubit());
  Get.put(SavedLinkCubit());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _router = RouterSettings.settings;

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
      title: 'Go Router example',
    );
  }
}
