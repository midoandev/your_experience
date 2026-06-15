import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:your_experience/data/portfolio_data.dart';
import 'package:your_experience/models/projects_data.dart';

part 'portfolio_vm.g.dart';

@immutable
class PortfolioState {
  final List<ProjectsData> projects;

  const PortfolioState({required this.projects});
}

@riverpod
class PortfolioVm extends _$PortfolioVm {
  @override
  PortfolioState build() {
    final projects = PortfolioData.getProjects();
    return PortfolioState(projects: projects);
  }
}
