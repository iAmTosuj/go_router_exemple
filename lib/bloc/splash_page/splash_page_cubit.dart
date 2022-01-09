import 'package:bloc/bloc.dart';
import 'package:get/get.dart';
import 'package:untitled4/bloc/auth_state/auth_state_cubit.dart';

part 'splash_page_state.dart';

class SplashPageCubit extends Cubit<SplashPageState> {
  SplashPageCubit() : super(SplashPageState());

  void init() async {
    Future.delayed(const Duration(milliseconds: 500));

    Get.find<AuthStateCubit>().setAppInit();
  }
}
