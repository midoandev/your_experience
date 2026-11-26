import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:your_experience/data/portfolio_data.dart';
import 'package:your_experience/models/contacts.dart';
import 'package:your_experience/models/projects_data.dart';

part 'portfolio_detail_vm.g.dart';

@immutable
class PortfolioDetailState {
  /// Null when the id in the URL does not match any project.
  final ProjectsData? project;
  final ProjectsData? next;
  final List<Contacts> contacts;
  final String mailto;

  const PortfolioDetailState({
    required this.project,
    required this.next,
    required this.contacts,
    required this.mailto,
  });
}

/// Looks the project up by its URL id so deep links and refresh work.
@riverpod
PortfolioDetailState portfolioDetailVm(Ref ref, String id) {
  final all = PortfolioData.getProjects();
  final index = all.indexWhere((p) => p.id == id);
  return PortfolioDetailState(
    project: index < 0 ? null : all[index],
    next: index < 0 ? null : all[(index + 1) % all.length],
    contacts: PortfolioData.getContacts(),
    mailto: PortfolioData.mailto,
  );
}
