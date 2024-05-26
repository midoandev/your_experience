
import 'package:your_experience/features/domain/entities/projects_data.dart';

import '../entities/main_profile.dart';

abstract class MainRepositoryBase {

  MainProfile getMainInformation();
  List<ProjectsData> getProjects();

  // Future<Either<GenericException, ApplicationSettingResponse>>
  //     getApplicationSettingRemote();
  //
  // Future<Either<GenericException, ApplicationSettingResponse>>
  //     setApplicationSettingRemote(
  //         ApplicationSettingRequest applicationSettingRequest);
  //
  // Future<Either<GenericException, ApplicationSettingResponse>>
  //     setApplicationSettingProductTour(
  //         ApplicationSettingProductTourRequest
  //             applicationSettingProductTourRequest);
  //
  // ApplicationSetting getApplicationSettingLocal();
  //
  // Future<Either<GenericException, FaqListModel>> getFaqList();
  //
  // Future<Either<GenericException, FaqModel>> getFaqContent(
  //     {required String slug});
}
