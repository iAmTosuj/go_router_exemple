import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:untitled4/bloc/auth_state/auth_state_cubit.dart';

class RouterNotifier extends ChangeNotifier {
  void init() {
    Get.find<AuthStateCubit>().stream.listen((state) {
      notifyListeners();
    });
  }
}
