import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:your_experience/data/portfolio_data.dart';
import 'package:your_experience/models/projects_data.dart';

part 'portfolio_vm.g.dart';

@immutable
class PortfolioState {
  final List<ProjectsData> projects;
  final List<String> domains;

  const PortfolioState({required this.projects, required this.domains});
}

@riverpod
class PortfolioVm extends _$PortfolioVm {
  @override
  PortfolioState build() => PortfolioState(
    projects: PortfolioData.getProjects(),
    domains: PortfolioData.getDomains(),
  );
}
