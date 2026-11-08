import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:your_experience/data/portfolio_data.dart';
import 'package:your_experience/models/projects_data.dart';

part 'portfolio_detail_vm.g.dart';

@immutable
class PortfolioDetailState {
  /// Null when the id in the URL does not match any project.
  final ProjectsData? project;
  final ProjectsData? next;
  final RichDescription overview;
  final RichDescription execution;

  const PortfolioDetailState({
    required this.project,
    required this.next,
    required this.overview,
    required this.execution,
  });
}

/// Looks the project up by its URL id so deep links and page refresh work.
/// (The old `state.extra` approach lost the data on reload → blank page.)
@riverpod
class PortfolioDetailVm extends _$PortfolioDetailVm {
  @override
  PortfolioDetailState build(String id) {
    final all = PortfolioData.getProjects();
    final index = all.indexWhere((p) => p.id == id);
    if (index < 0) {
      return const PortfolioDetailState(
        project: null,
        next: null,
        overview: RichDescription(intro: '', bullets: []),
        execution: RichDescription(intro: '', bullets: []),
      );
    }
    final project = all[index];
    return PortfolioDetailState(
      project: project,
      next: all[(index + 1) % all.length],
      overview: RichDescription.parse(project.overview),
      execution: RichDescription.parse(project.execution),
    );
  }
}
