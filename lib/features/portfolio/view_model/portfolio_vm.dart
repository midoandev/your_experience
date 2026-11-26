import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:your_experience/data/portfolio_data.dart';
import 'package:your_experience/models/projects_data.dart';

part 'portfolio_vm.g.dart';

/// Earlier work for the six-card grid.
@riverpod
List<ProjectsData> portfolioVm(Ref ref) => PortfolioData.getPastProjects();
