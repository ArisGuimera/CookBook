class RestaurantModel{
  String _name;
  String _photo;
  List<String> _options;

  RestaurantModel({String name, String photo, List<String> options}) {
    this._name = name;
    this._photo = photo;
    this._options = options;
  }

  String get name => _name;
  set name(String name) => _name = name;
  String get photo => _photo;
  set photo(String photo) => _photo = photo;
  List<String> get options => _options;
  set options(List<String> options) => _options = options;

  RestaurantModel.fromJson(Map<String, dynamic> json) {
    _name = json['name'];
    _photo = json['photo'];
    _options = json['options'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this._name;
    data['photo'] = this._photo;
    data['options'] = this._options;
    return data;
  }
}