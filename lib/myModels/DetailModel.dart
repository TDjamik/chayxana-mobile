import 'dart:convert';

DetailModel detailModelFromJson(String str) =>
    DetailModel.fromJson(json.decode(str));

String detailModelToJson(DetailModel data) => json.encode(data.toJson());

class DetailModel {
  DetailModel({
    this.success,
    this.message,
    this.object,
    this.totalElements,
  });

  DetailModel.fromJson(dynamic json) {
    success = json['success'];
    message = json['message'];
    object = json['object'] != null ? Object.fromJson(json['object']) : null;
    totalElements = json['totalElements'];
  }

  bool? success;
  String? message;
  Object? object;
  int? totalElements;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['message'] = message;
    if (object != null) {
      map['object'] = object?.toJson();
    }
    map['totalElements'] = totalElements;
    return map;
  }
}

Object objectFromJson(String str) => Object.fromJson(json.decode(str));

String objectToJson(Object data) => json.encode(data.toJson());

class Object {
  Object({
    this.chayxanaId,
    this.addressDto,
    this.userId,
    this.chayxanaName,
    this.descriptionUz,
    this.descriptionRu,
    this.descriptionEn,
    this.startTime,
    this.endTime,
    this.phoneNumber,
    this.roomNumber,
    this.price,
    this.chayxanaDetailDtos,
    this.active,
  });

  Object.fromJson(dynamic json) {
    chayxanaId = json['chayxanaId'];
    addressDto = json['addressDto'] != null
        ? AddressDto.fromJson(json['addressDto'])
        : null;
    userId = json['userId'];
    chayxanaName = json['chayxanaName'];
    descriptionUz = json['descriptionUz'];
    descriptionRu = json['descriptionRu'];
    descriptionEn = json['descriptionEn'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    phoneNumber = json['phoneNumber'];
    roomNumber = json['roomNumber'];
    price = json['price'];
    chayxanaDetailDtos= List<dynamic>.from(json["chayxanaDetailDtos"].map((x) => x));
    active = json['active'];
  }

  String? chayxanaId;
  AddressDto? addressDto;
  String? userId;
  String? chayxanaName;
  String? descriptionUz;
  String? descriptionRu;
  String? descriptionEn;
  String? startTime;
  String? endTime;
  String? phoneNumber;
  int? roomNumber;
  double? price;
  List<dynamic>? chayxanaDetailDtos;
  bool? active;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['chayxanaId'] = chayxanaId;
    if (addressDto != null) {
      map['addressDto'] = addressDto?.toJson();
    }
    map['userId'] = userId;
    map['chayxanaName'] = chayxanaName;
    map['descriptionUz'] = descriptionUz;
    map['descriptionRu'] = descriptionRu;
    map['descriptionEn'] = descriptionEn;
    map['startTime'] = startTime;
    map['endTime'] = endTime;
    map['phoneNumber'] = phoneNumber;
    map['roomNumber'] = roomNumber;
    map['price'] = price;
    if (chayxanaDetailDtos != null) {
      map['chayxanaDetailDtos'] =
          chayxanaDetailDtos?.map((v) => v.toJson()).toList();
    }
    map['active'] = active;
    return map;
  }
}

AddressDto addressDtoFromJson(String str) =>
    AddressDto.fromJson(json.decode(str));

String addressDtoToJson(AddressDto data) => json.encode(data.toJson());

class AddressDto {
  AddressDto({
    this.id,
    this.districtDto,
    this.streetName,
    this.lan,
    this.lat,
  });

  AddressDto.fromJson(dynamic json) {
    id = json['id'];
    districtDto = json['districtDto'] != null
        ? DistrictDto.fromJson(json['districtDto'])
        : null;
    streetName = json['streetName'];
    lan = json['lan'];
    lat = json['lat'];
  }

  dynamic id;
  DistrictDto? districtDto;
  String? streetName;
  double? lan;
  double? lat;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    if (districtDto != null) {
      map['districtDto'] = districtDto?.toJson();
    }
    map['streetName'] = streetName;
    map['lan'] = lan;
    map['lat'] = lat;
    return map;
  }
}

DistrictDto districtDtoFromJson(String str) =>
    DistrictDto.fromJson(json.decode(str));

String districtDtoToJson(DistrictDto data) => json.encode(data.toJson());

class DistrictDto {
  DistrictDto({
    this.id,
    this.name,
    this.regionDto,
  });

  DistrictDto.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    regionDto = json['regionDto'] != null
        ? RegionDto.fromJson(json['regionDto'])
        : null;
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

RegionDto regionDtoFromJson(String str) => RegionDto.fromJson(json.decode(str));

String regionDtoToJson(RegionDto data) => json.encode(data.toJson());

class RegionDto {
  RegionDto({
    this.id,
    this.name,
  });

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
