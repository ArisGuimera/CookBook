class AppInformationDataModel {
  int _id;
  String _version;
  int _test;

  AppInformationDataModel({int id, String version, int test}) {
    this._id = id;
    this._version = version;
    this._test = test;
  }

  int get id => _id;
  set id(int id) => _id = id;
  String get version => _version;
  set version(String version) => _version = version;
  int get test => _test;
  set test(int test) => _test = test;

  AppInformationDataModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _version = json['version'];
    _test = json['test'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['version'] = this._version;
    data['test'] = this._test;
    return data;
  }
}