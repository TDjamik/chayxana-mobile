import 'RegionDto.dart';
import 'dart:convert';

DistrictDto districtDtoFromJson(String str) => DistrictDto.fromJson(json.decode(str));
String districtDtoToJson(DistrictDto data) => json.encode(data.toJson());
class DistrictDto {
  DistrictDto({
      this.id, 
      this.name, 
      this.regionDto,});

  DistrictDto.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    regionDto = json['regionDto'] != null ? RegionDto.fromJson(json['regionDto']) : null;
  }
  int? id;
  String? name;
  RegionDto? regionDto;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    if (regionDto != null) {
      map['regionDto'] = regionDto?.toJson();
    }
    return map;
  }

}