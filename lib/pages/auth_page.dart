import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:untitled4/bloc/auth_state/auth_state_cubit.dart';
import 'package:untitled4/bloc/saved_link/saved_link_cubit.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              final AuthStateCubit _authStateCubit = Get.find<AuthStateCubit>();
              final SavedLinkState _savedLinkState =
                  Get.find<SavedLinkCubit>().state;

              _authStateCubit.setAuth();

              if (_savedLinkState.link.isNotEmpty) {
                context.go(_savedLinkState.link);

                return;
              }

              context.go('/main');
            },
            child: const Text('Press to Auth'),
          ),
        ),
      ),
    );
  }
}
