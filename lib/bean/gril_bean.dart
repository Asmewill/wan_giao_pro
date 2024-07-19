/// code : 1
/// msg : "数据返回成功！"
/// data : [{"imageUrl":"http://power-api.cretinzp.com:8000/girls/1/poplkrnggekxnqls.jpg","imageSize":"1728x1080","imageFileLength":139089},{"imageUrl":"http://power-api.cretinzp.com:8000/girls/1/poplkrnggekxnqls.jpg","imageSize":"1728x1080","imageFileLength":139089},{"imageUrl":"http://power-api.cretinzp.com:8000/girls/2/ixrn0sknhdepvmmv.jpg","imageSize":"1920x1080","imageFileLength":190725},{"imageUrl":"http://power-api.cretinzp.com:8000/girls/2/ixrn0sknhdepvmmv.jpg","imageSize":"1920x1080","imageFileLength":190725},{"imageUrl":"http://power-api.cretinzp.com:8000/girls/3/tp9ovqrozjnqkuni.jpg","imageSize":"1728x1080","imageFileLength":147454},{"imageUrl":"http://power-api.cretinzp.com:8000/girls/3/tp9ovqrozjnqkuni.jpg","imageSize":"1728x1080","imageFileLength":147454},{"imageUrl":"http://power-api.cretinzp.com:8000/girls/4/n10wvhfvrolgverh.jpg","imageSize":"1920x1080","imageFileLength":156398},{"imageUrl":"http://power-api.cretinzp.com:8000/girls/4/n10wvhfvrolgverh.jpg","imageSize":"1920x1080","imageFileLength":156398},{"imageUrl":"http://power-api.cretinzp.com:8000/girls/5/typposesnoqwo6bs.jpg","imageSize":"1728x1080","imageFileLength":161296},{"imageUrl":"http://power-api.cretinzp.com:8000/girls/5/typposesnoqwo6bs.jpg","imageSize":"1728x1080","imageFileLength":161296},{"imageUrl":"http://power-api.cretinzp.com:8000/girls/6/rhcfprkgofnqmgdt.jpg","imageSize":"1728x1080","imageFileLength":204595},{"imageUrl":"http://power-api.cretinzp.com:8000/girls/6/rhcfprkgofnqmgdt.jpg","imageSize":"1728x1080","imageFileLength":204595},{"imageUrl":"http://power-api.cretinzp.com:8000/girls/7/nismsotnrhmgtepf.jpg","imageSize":"1728x1080","imageFileLength":221243},{"imageUrl":"http://power-api.cretinzp.com:8000/girls/7/nismsotnrhmgtepf.jpg","imageSize":"1728x1080","imageFileLength":221243},{"imageUrl":"http://power-api.cretinzp.com:8000/girls/8/elrfmlpgxjmjwpoa.jpg","imageSize":"1920x1080","imageFileLength":215447},{"imageUrl":"http://power-api.cretinzp.com:8000/girls/8/elrfmlpgxjmjwpoa.jpg","imageSize":"1920x1080","imageFileLength":215447},{"imageUrl":"http://power-api.cretinzp.com:8000/girls/9/alo2tfohlionhgak.jpg","imageSize":"1728x1080","imageFileLength":168798},{"imageUrl":"http://power-api.cretinzp.com:8000/girls/9/alo2tfohlionhgak.jpg","imageSize":"1728x1080","imageFileLength":168798},{"imageUrl":"http://power-api.cretinzp.com:8000/girls/10/oqnfccerrklfrfdt.jpg","imageSize":"1920x1080","imageFileLength":180146},{"imageUrl":"http://power-api.cretinzp.com:8000/girls/10/oqnfccerrklfrfdt.jpg","imageSize":"1920x1080","imageFileLength":180146}]

class GrilBean {
  GrilBean({
      num? code, 
      String? msg, 
      List<GrilItem>? data,}){
    _code = code;
    _msg = msg;
    _data = data;
}

  GrilBean.fromJson(dynamic json) {
    _code = json['code'];
    _msg = json['msg'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(GrilItem.fromJson(v));
      });
    }
  }
  num? _code;
  String? _msg;
  List<GrilItem>? _data;

  num? get code => _code;
  String? get msg => _msg;
  List<GrilItem>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = _code;
    map['msg'] = _msg;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// imageUrl : "http://power-api.cretinzp.com:8000/girls/1/poplkrnggekxnqls.jpg"
/// imageSize : "1728x1080"
/// imageFileLength : 139089

class GrilItem {
  GrilItem({
      String? imageUrl,
      String? imageSize,
      num? imageFileLength,}){
    _imageUrl = imageUrl;
    _imageSize = imageSize;
    _imageFileLength = imageFileLength;
}
  GrilItem.fromJson(dynamic json) {
    _imageUrl = json['imageUrl'];
    _imageSize = json['imageSize'];
    _imageFileLength = json['imageFileLength'];
  }
  String? _imageUrl;
  String? _imageSize;
  num? _imageFileLength;

  String? get imageUrl => _imageUrl;
  String? get imageSize => _imageSize;
  num? get imageFileLength => _imageFileLength;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['imageUrl'] = _imageUrl;
    map['imageSize'] = _imageSize;
    map['imageFileLength'] = _imageFileLength;
    return map;
  }

}