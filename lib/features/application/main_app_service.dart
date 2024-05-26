import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:your_experience/features/domain/entities/main_profile.dart';
import 'package:your_experience/features/domain/entities/projects_data.dart';
import 'package:your_experience/utility/shared/services/services.dart';

import '../domain/interfaces/main_repository_base.dart';
import '../infrastructure/repository/main_repository.dart';
class MainAppService {
  final MainRepositoryBase _repository =
      Get.find<MainRepository>();

  MainProfile getMainInformation() {
    return _repository.getMainInformation();
  }
  List<ProjectsData> getProject() {
    return _repository.getProjects();
  }

  Future<void> changeTheme(bool value) async {
    // final themeDefault = isDark ? ThemeMode.dark : ThemeMode.light;

    Get.changeThemeMode(value ? ThemeMode.light : ThemeMode.dark );
    StorageService.setPrefBool(key: StorageEnum.themeIsLight, value: value);
    await Get.forceAppUpdate();
  }
}
