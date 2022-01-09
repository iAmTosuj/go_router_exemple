import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ChildPage extends StatelessWidget {
  const ChildPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  context.pop();
                },
                child: const Text('Press to back'),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text('After returning, the block will stop working'),
            ],
          ),
        ),
      ),
    );
  }
}
