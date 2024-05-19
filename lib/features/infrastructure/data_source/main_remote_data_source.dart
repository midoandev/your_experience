import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

import '../../../utility/network/api_provider.dart';
import '../../domain/entities/main_profile.dart';

class MainRemoteDataSource {
  final  _apiProvider = Get.find<ApiProvider>();

  MainRemoteDataSource();

  Future<DataSnapshot> getMainInformation() async {
    return await _apiProvider.getData('main');
  }

}
