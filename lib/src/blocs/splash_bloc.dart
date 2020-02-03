import 'package:rxdart/rxdart.dart';
import 'package:tappeando/src/common/resources.dart';
import 'package:tappeando/src/model/appinformation_model.dart';
import 'package:tappeando/src/provider/database/database_provider.dart';
import 'package:tappeando/src/provider/mappers/appinformation_mapper.dart';
import 'package:tappeando/src/repository/repository.dart';

class SplashBloc {
  final _repository = Repository();
  final _observable = PublishSubject<Resource<AppInformationModel>>();

  Observable<Resource<AppInformationModel>> get appInformation =>
      _observable.stream;

  getAppInformation() async {
    Resource<AppInformationModel> response =
        await _repository.getAppInformation();
    if (response.isSuccess) {
      saveAppInformation(response.data);
    }
    _observable.sink.add(response);
  }

  getAppInformationFromDatabase() async {
    AppInformationModel response = await DBProvider.db.getAppInfo();
    _observable.sink.add(Resource.success(response));
  }

  dispose() {
    _observable.close();
  }

  void saveAppInformation(AppInformationModel response) {
    DBProvider.db.insertAppInfo(AppInformationMapper().toDatabase(response));
  }
}
