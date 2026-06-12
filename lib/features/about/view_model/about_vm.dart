import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'about_vm.g.dart';

@immutable
class AboutState {
  const AboutState();
}

@riverpod
class AboutVm extends _$AboutVm {
  @override
  AboutState build() {
    return const AboutState();
  }
}
