import 'dart:convert';

RegionDto regionDtoFromJson(String str) => RegionDto.fromJson(json.decode(str));
String regionDtoToJson(RegionDto data) => json.encode(data.toJson());
class RegionDto {
  RegionDto({
      this.id, 
      this.name,});

  RegionDto.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }
  int? id;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }

}