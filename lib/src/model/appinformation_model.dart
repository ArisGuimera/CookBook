class AppInformationModel {
  String _version;
  bool _test;

  AppInformationModel({String version, bool test}) {
    this._version = version;
    this._test = test;
  }

  String get version => _version;
  set version(String version) => _version = version;
  bool get test => _test;
  set test(bool test) => _test = test;

  AppInformationModel.fromJson(Map<String, dynamic> json) {
    _version = json['version'];
    _test = json['test'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['version'] = this._version;
    data['test'] = this._test;
    return data;
  }
}