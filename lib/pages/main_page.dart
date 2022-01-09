import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:untitled4/bloc/main/main_cubit.dart';

class MainPage extends StatelessWidget {
  // page initialization is called every time, even when it has already been in the history. is this a bug or a feature?
  // in my application, the bloc is in di and fetch is called every time because of this, new data is requested, although this is not necessary because the user has returned to this page
  final MainCubit _mainCubit = MainCubit()..fetch();

  MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => _mainCubit,
          child: BlocBuilder<MainCubit, MainState>(
            builder: (context, state) {
              if (state.status == pageState.loading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                        'The bloc will stop working after opening the child page or bottom sheet'),
                    const SizedBox(
                      width: 16,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _mainCubit.increase();
                      },
                      // bloc also stops working after hot restart, because _mainCubit is recreated, and its old instance remains in the blocProvider
                      child: Text('Test bloc ${state.counter}'),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context.go('/main/child');
                      },
                      child: const Text('Go to child'),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    ElevatedButton(
                      onPressed: () => _openBottomSheet(context),
                      child: const Text('Open bottom sheet'),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

void _openBottomSheet(
  BuildContext context,
) {
  showModalBottomSheet(
      context: context,
      builder: (builder) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: const [
              Text(
                'Close the bottom sheet by pressing the back button on your phone or emulator.',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                'Then the parent page will be recreated and the bloc will stop working',
                style: TextStyle(fontSize: 20),
              )
            ],
          ),
        );
      });
}
