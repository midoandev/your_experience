import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'splash_vm.g.dart';

@riverpod
class SplashVm extends _$SplashVm {
  @override
  void build() {
    _startTimer();
  }

  void _startTimer() {
    Timer(const Duration(seconds: 3), () {
      _navigate();
    });
  }

  void _navigate() {}
}
