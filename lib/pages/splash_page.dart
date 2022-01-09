import 'package:flutter/material.dart';
import 'package:untitled4/bloc/splash_page/splash_page_cubit.dart';

class SplashPage extends StatelessWidget {
  final splashCubit = SplashPageCubit();

  SplashPage({Key? key}) : super(key: key) {
    splashCubit.init();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Text('Loading...'),
        ),
      ),
    );
  }
}
