import 'dart:convert';
/// photo : "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/937.jpg"
/// beach_name : "Abbott Inc"
/// price : "736.00"
/// location : "Nigeria"
/// description : "payment transaction at Hackett Inc using card ending with ***(...4565) for UAH 201.25 in account ***78889773"
/// id : "1"

Beachmodel beachmodelFromJson(String str) => Beachmodel.fromJson(json.decode(str));
String beachmodelToJson(Beachmodel data) => json.encode(data.toJson());
class Beachmodel {
  Beachmodel({
      String? photo, 
      String? beachName, 
      String? price, 
      String? location, 
      String? description, 
      String? id,}){
    _photo = photo;
    _beachName = beachName;
    _price = price;
    _location = location;
    _description = description;
    _id = id;
}

  Beachmodel.fromJson(dynamic json) {
    _photo = json['photo'];
    _beachName = json['beach_name'];
    _price = json['price'];
    _location = json['location'];
    _description = json['description'];
    _id = json['id'];
  }
  String? _photo;
  String? _beachName;
  String? _price;
  String? _location;
  String? _description;
  String? _id;
Beachmodel copyWith({  String? photo,
  String? beachName,
  String? price,
  String? location,
  String? description,
  String? id,
}) => Beachmodel(  photo: photo ?? _photo,
  beachName: beachName ?? _beachName,
  price: price ?? _price,
  location: location ?? _location,
  description: description ?? _description,
  id: id ?? _id,
);
  String? get photo => _photo;
  String? get beachName => _beachName;
  String? get price => _price;
  String? get location => _location;
  String? get description => _description;
  String? get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['photo'] = _photo;
    map['beach_name'] = _beachName;
    map['price'] = _price;
    map['location'] = _location;
    map['description'] = _description;
    map['id'] = _id;
    return map;
  }

}