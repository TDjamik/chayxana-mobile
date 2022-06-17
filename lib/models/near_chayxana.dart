// ignore_for_file: unused_element

import 'dart:typed_data';

class NearChayxana {
  String? chayxanaId;
  String? userId;
  _AddressDto? addressDto;
  String? chayxanaName;
  String? descriptionUz;
  String? descriptionRu;
  String? descriptionEn;
  String? startTime;
  String? endTime;
  String? phoneNumber;
  int? roomNumber;
  Uint8List? imageInbytes;
  List<Uint8List> iconsInbytes = [];
  String? rate;

  double? price;
  List<_ChayxanaDetailDtos>? chayxanaDetailDtos;
  bool? active;

  NearChayxana(
      {this.active,
      this.addressDto,
      this.chayxanaDetailDtos,
      this.chayxanaId,
      this.chayxanaName,
      this.descriptionEn,
      this.descriptionRu,
      this.descriptionUz,
      this.endTime,
      this.phoneNumber,
      this.price,
      this.roomNumber,
      this.startTime,
      this.userId});

  NearChayxana.fromJson(Map<String, dynamic> json) {
    print(
        json["chayxanaDetailDtos"].length.toString() + "////////////////////");
    chayxanaId = json["chayxanaId"];
    userId = json["userId"];
    addressDto = _AddressDto.fromJson(json["addressDto"]);
    chayxanaName = json["chayxanaName"];
    descriptionUz = json["descriptionUz"];
    descriptionEn = json["descriptionEn"];
    descriptionRu = json["descriptionRu"];
    startTime = json["startTime"];
    endTime = json["endTime"];
    phoneNumber = json["phoneNumber"];
    roomNumber = json["roomNumber"];
    price = json["price"];
    chayxanaDetailDtos = List.generate(
        json["chayxanaDetailDtos"].length,
        (index) =>
            _ChayxanaDetailDtos.fromJson(json["chayxanaDetailDtos"][index]));
    json["chayxanaDetailDtos"];
    active = json["active"];
  }
}

class _AddressDto {
  String? id;
  String? streetName;
  double? lan;
  double? lat;
  _DistrictDto? districtDto;

  _AddressDto({this.id, this.streetName, this.lan, this.districtDto, this.lat});

  _AddressDto.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    streetName = json["streetName"];
    lan = json["lan"];
    lat = json["lat"];
    districtDto = _DistrictDto.fromJson(json["districtDto"]);
  }

  toJson() {
    return {
      "id": id,
      "streetName": streetName,
      "lan": lan,
      "lat": lat,
      "districtDto": districtDto!.toJson(),
    };
  }
}

class _DistrictDto {
  String? id;
  String? name;
  double? regionDto;

  _DistrictDto({this.id, this.name, this.regionDto});

  _DistrictDto.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    regionDto = json["regionDto"];
  }

  toJson() {
    return {"id": id, "name": name, "regionDto": regionDto};
  }
}

class _ChayxanaDetailDtos {
  int? id;
  String? name;
  bool? active;

  _Icon? iconMultiSendDto;

  _ChayxanaDetailDtos({this.active, this.iconMultiSendDto, this.id, this.name});

  toJson() {
    return {
      "id": id,
      "name": name,
      "active": active,
      "iconMultiSendDto": iconMultiSendDto!.toJson(),
    };
  }

  _ChayxanaDetailDtos.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    active = json["active"];
    iconMultiSendDto = _Icon.fromJson(json["iconMultiSendDto"]);
  }

  @override
  String toString() {
    // TODO: implement toString
    return this.toJson().toString();
  }
}

class _Icon {
  String? id;
  String? fileOriginalName;
  int? size;
  String? contentType;
  String? name;
  String? bytes;
  _Icon({
    this.id,
    this.fileOriginalName,
    this.size,
    this.contentType,
    this.bytes,
    this.name,
  });

  toJson() {
    return {
      "id": id,
      "fileOriginalName": fileOriginalName,
      "size": size,
      "contentType": contentType,
      "name": name,
      "bytes": bytes,
    };
  }

  _Icon.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    fileOriginalName = json["fileOriginalName"];
    contentType = json["contentType"];
    bytes = json["bytes"];
    size = json["size"];
  }
}
