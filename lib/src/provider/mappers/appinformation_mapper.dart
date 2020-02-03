import 'package:tappeando/src/model/appinformation_model.dart';
import 'package:tappeando/src/provider/database/datamodel/appinformation_datamodel.dart';

class AppInformationMapper{

  AppInformationDataModel toDatabase(AppInformationModel response){
    return AppInformationDataModel(id: 0, version: response.version, test: response.test ? 1 : 0);
  }

  AppInformationModel toDomain(AppInformationDataModel response){
    return AppInformationModel(version: response.version, test: response.test == 1 ? true : false);
  }

}