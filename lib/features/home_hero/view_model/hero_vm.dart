import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:your_experience/models/main_profile.dart';
import 'package:your_experience/data/portfolio_data.dart';

part 'hero_vm.g.dart';

@immutable
class HeroState {
  final MainProfile profile;
  final bool isLightMode;

  const HeroState({required this.profile, required this.isLightMode});
}

@riverpod
class HeroVm extends _$HeroVm {
  @override
  HeroState build() {
    final profile = PortfolioData.getMainProfile();
    return HeroState(profile: profile, isLightMode: false);
  }
}
