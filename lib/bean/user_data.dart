/// data : {"admin":false,"chapterTops":[],"coinCount":21,"collectIds":[],"email":"","icon":"","id":161270,"nickname":"sj02","password":"","publicName":"sj02","token":"","type":0,"username":"sj02"}
/// errorCode : 0
/// errorMsg : ""

class UserData {

  User? _data;
  num? _errorCode;
  String? _errorMsg;

  UserData.fromJson(dynamic json) {
    _data = json['data'] != null ? User.fromJson(json['data']) : null;
    _errorCode = json['errorCode'];
    _errorMsg = json['errorMsg'];
  }

  User? get data => _data;
  num? get errorCode => _errorCode;
  String? get errorMsg => _errorMsg;

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_data != null) {
      map["data"] = _data!.toJson();
    }
    map["errorCode"] = _errorCode;
    map["errorMsg"] = _errorMsg;
    return map;
  }

}

/// admin : false
/// chapterTops : []
/// coinCount : 21
/// collectIds : []
/// email : ""
/// icon : ""
/// id : 161270
/// nickname : "sj02"
/// password : ""
/// publicName : "sj02"
/// token : ""
/// type : 0
/// username : "sj02"

class User {
  bool? _admin;
  List<dynamic>? _chapterTops;
  num? _coinCount;
  List<dynamic>? _collectIds;
  String? _email;
  String? _icon;
  num? _id;
  String? _nickname;
  String? _password;
  String? _publicName;
  String? _token;
  num? _type;
  String? _username;
  bool? get admin => _admin;
  List<dynamic>? get chapterTops => _chapterTops;
  num? get coinCount => _coinCount;
  List<dynamic>? get collectIds => _collectIds;
  String? get email => _email;
  String? get icon => _icon;
  num? get id => _id;
  String? get nickname => _nickname;
  String? get password => _password;
  String? get publicName => _publicName;
  String? get token => _token;
  num? get type => _type;
  String? get username => _username;

  //可以通过User()得到User对象
  User({
    bool? admin,
    List<dynamic>?  chapterTops,
    int?  coinCount,
    List<int>?  collectIds,
    String?  email,
    String?  icon,
    int?  id,
    String?  nickname,
    String?  password,
    String?  publicName,
    String?  token,
    int?  type,
    String?  username}){
    _admin = admin;
    _coinCount = coinCount;
    _collectIds = collectIds;
    _email = email;
    _icon = icon;
    _id = id;
    _nickname = nickname;
    _password = password;
    _publicName = publicName;
    _token = token;
    _type = type;
    _username = username;
  }


  User.fromJson(dynamic json) {
    _admin = json['admin'];
    if (json['chapterTops'] != null) {
      _chapterTops = [];
      json['chapterTops'].forEach((v) {
        _chapterTops?.add(v);
      });
    }
    _coinCount = json['coinCount'];
    if (json['collectIds'] != null) {
      _collectIds = [];
      json['collectIds'].forEach((v) {
        _collectIds?.add(v);
      });
    }
    _email = json['email'];
    _icon = json['icon'];
    _id = json['id'];
    _nickname = json['nickname'];
    _password = json['password'];
    _publicName = json['publicName'];
    _token = json['token'];
    _type = json['type'];
    _username = json['username'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["admin"] = _admin;
    map["coinCount"] = _coinCount;
    map["collectIds"] = _collectIds;
    map["email"] = _email;
    map["icon"] = _icon;
    map["id"] = _id;
    map["nickname"] = _nickname;
    map["password"] = _password;
    map["publicName"] = _publicName;
    map["token"] = _token;
    map["type"] = _type;
    map["username"] = _username;
    return map;
  }


}