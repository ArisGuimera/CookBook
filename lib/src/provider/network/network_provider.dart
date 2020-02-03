import 'dart:convert';

import 'package:http/http.dart';
import 'package:tappeando/src/common/resources.dart';
import 'package:tappeando/src/model/appinformation_model.dart';

class NetworkProvider{
  Client client = Client();
  final _baseUrl = "https://api.myjson.com";
  final _appInformation = "/bins/cyx1x";
  final _SUCCESS_RESPONSE = 200;


  Future<Resource<AppInformationModel>> getAppInformation() async {
    final response = await client.get("$_baseUrl/$_appInformation");

    if(response.statusCode == _SUCCESS_RESPONSE){
      return Resource.success(AppInformationModel.fromJson(json.decode(response.body)));
    }else{
      return Resource.error('Error inesperado', AppInformationModel());
    }
  }

}

