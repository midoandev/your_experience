import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:your_experience/data/portfolio_data.dart';
import 'package:your_experience/models/experience_item.dart';

part 'experience_vm.g.dart';

@immutable
class ExperienceState {
  final List<ExperienceItem> jobs;
  final String photo;
  const ExperienceState({required this.jobs, required this.photo});
}

@riverpod
ExperienceState experienceVm(Ref ref) => ExperienceState(
  jobs: PortfolioData.getExperience(),
  photo: PortfolioData.portraitImage,
);
