import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

import '../../../utility/network/api_provider.dart';

class MainRemoteDataSource {
  final  _apiProvider = Get.find<ApiProvider>();

  MainRemoteDataSource();

  Future<DataSnapshot> getMainInformation() async {
    return await _apiProvider.getData('main');
  }

}
