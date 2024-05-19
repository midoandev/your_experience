import 'package:get/get.dart';
import 'package:your_experience/features/domain/entities/main_profile.dart';
import 'package:your_experience/features/domain/entities/projects_data.dart';

import '../domain/interfaces/main_repository_base.dart';
import '../infrastructure/repository/main_repository.dart';
class MainAppService {
  final MainRepositoryBase _repository =
      Get.find<MainRepository>();

  Future<MainProfile> getMainInformation() async {
    return await _repository.getMainInformation();
  }
  List<ProjectsData> getProject() {
    return _repository.getProjects();
  }
}
