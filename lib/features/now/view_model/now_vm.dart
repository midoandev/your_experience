import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:your_experience/data/portfolio_data.dart';
import 'package:your_experience/models/projects_data.dart';

part 'now_vm.g.dart';

/// The projects in progress: OpenCash (freelance) and Journey (day job).
@riverpod
List<ProjectsData> nowVm(Ref ref) => PortfolioData.getCurrentProjects();
