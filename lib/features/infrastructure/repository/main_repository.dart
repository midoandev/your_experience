
import 'package:get/get.dart';
import 'package:your_experience/features/domain/entities/main_menu.dart';
import 'package:your_experience/features/domain/entities/main_profile.dart';
import 'package:your_experience/features/domain/entities/projects_data.dart';
import 'package:your_experience/features/domain/entities/services_data.dart';
import 'package:your_experience/features/domain/interfaces/main_repository_base.dart';
import 'package:your_experience/features/infrastructure/data_source/main_local_data_source.dart';

import '../data_source/main_remote_data_source.dart';

class MainRepository implements MainRepositoryBase {
  final remote = Get.find<MainRemoteDataSource>();
  final local = Get.find<MainLocalDataSource>();

  // @override
  // Future<MainProfile> getMainInformation() async {
  //   var res = await remote.getMainInformation();
  //
  //   if (res.exists) {
  //     try {
  //       Map<String, dynamic> data = jsonDecode(jsonEncode(res.value));
  //       return MainProfile.fromJson(data);
  //     } on Exception catch (e) {
  //       Get.log('catch convert $e');
  //     }
  //     // Map<String, dynamic> val = res.value! as Map<String, dynamic>;
  //   }
  //   return MainProfile.empty();
  // }

  @override
  List<MainMenu> getMainMenu() {
    return local.getMainMenu();
  }

  @override
  List<ProjectsData> getProjects() {
    return local.getProject();
  }

  @override
  MainProfile getMainInformation() {
    return local.getMainProfile();
  }

  @override
  List<ServicesData> getServices() {
    return local.getServices();
  }
}
