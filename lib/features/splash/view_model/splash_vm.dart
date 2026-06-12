import 'dart:async';

import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:your_experience/core/theme/app_colors.dart';

part 'splash_vm.g.dart';

@immutable
class SplashState {
  final Color backgroundColor;
  final Color textColor;

  const SplashState({required this.backgroundColor, required this.textColor});
}

@riverpod
class SplashVm extends _$SplashVm {
  @override
  SplashState build() {
    _startTimer();
    return const SplashState(
      backgroundColor: AppColors.bgPrimary,
      textColor: AppColors.textPrimary,
    );
  }

  void _startTimer() {
    Timer(const Duration(seconds: 3), () {
      _navigate();
    });
  }

  void _navigate() {}
}
