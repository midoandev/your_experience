import 'package:get/get.dart';
import 'package:your_experience/utility/shared/services/services.dart';

import '../features/application/main_app_service.dart';
import '../features/infrastructure/data_source/main_local_data_source.dart';
import '../features/infrastructure/data_source/main_remote_data_source.dart';
import '../features/infrastructure/repository/main_repository.dart';
import '../utility/network/api_provider.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() async {
    Get.put(ApiProvider());
    Get.put(StorageService.init());

    //Module main
    Get.lazyPut(() => MainRemoteDataSource(), fenix: true);
    Get.lazyPut(() => MainLocalDataSource(), fenix: true);
    Get.lazyPut(() => MainRepository(), fenix: true);
    Get.lazyPut(() => MainAppService(), fenix: true);
  }
}
