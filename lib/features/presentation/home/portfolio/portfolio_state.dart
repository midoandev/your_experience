import 'package:get/get.dart';
import 'package:your_experience/features/domain/entities/projects_data.dart';

class PortfolioState {
  PortfolioState() {
    ///Initialize variables
  }

  var projects = <ProjectsData>[].obs;
  var offsetScroll = 0.0.obs;
}
