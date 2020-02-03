import 'package:tappeando/src/common/resources.dart';
import 'package:tappeando/src/model/appinformation_model.dart';
import 'package:tappeando/src/provider/network/network_provider.dart';

class Repository{
  final NetworkProvider networkProvider = NetworkProvider();

  Future<Resource<AppInformationModel>> getAppInformation() => networkProvider.getAppInformation();
}