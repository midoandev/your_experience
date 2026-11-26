import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:your_experience/data/portfolio_data.dart';

part 'about_vm.g.dart';

@immutable
class AboutState {
  final String photo;
  final List<String> tools;
  const AboutState({required this.photo, required this.tools});
}

@riverpod
AboutState aboutVm(Ref ref) =>
    const AboutState(photo: PortfolioData.sitImage, tools: PortfolioData.aboutTools);
