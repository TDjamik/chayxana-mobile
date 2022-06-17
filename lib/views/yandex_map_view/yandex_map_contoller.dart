import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';
import '../../models/near_chayxana.dart';
import '../../services/dio_service.dart';

class MyYandexMapController extends GetxController {
  late YandexMapController yandexMapController;
  Position? position;
  List<NearChayxana> listOfNearChayxana = [];
  bool isLoading = true;
  late final List<MapObject> mapObjects = [];

  Future<void> determinePosition() async {
    position = await _getCurrentPosition();

    await yandexMapController.getCameraPosition().then(
      (value) async {
        await yandexMapController.moveCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: Point(
                  latitude: position!.latitude, longitude: position!.longitude),
              zoom: 13.0,
            ),
          ),
        );
      },
    );
    await _addPlacemarkUser(position!);

    update();

    // await _loadChayxana(position!);

    update();
  }

  // position_loadChayxana(Position position) async {
  //  // async String? response = await NetworkService.GET(
  //  //      NetworkService.getUri(NetworkService.API_CHAYXANALAR +
  //  //          "?lon=${position.longitude}&lat=${position.latitude}"),
  //  //      {});
  //
  //   // if (response != null) {
  //   //   List objects = jsonDecode(response)["object"];
  //   //   // print(objects[0]["chayxanaDetailDtos"][0]);
  //   //
  //   //   listOfNearChayxana = List.generate(objects.length, (index) {
  //   //     return NearChayxana.fromJson(objects[index]);
  //   //   });
  //
  //     for (int i = 0; i < listOfNearChayxana.length; i++) {
  //       await _addPlacemarkChayxana(listOfNearChayxana[i], position);
  //
  //       Uint8List? imageInBates = await NetworkService.GETONBATES(
  //           NetworkService.getUri(NetworkService.API_PROFILE_IMAGE_FROM_ID +
  //               listOfNearChayxana[i].chayxanaId!),
  //           {});
  //
  //       if (imageInBates != null) {
  //         listOfNearChayxana[i].imageInbytes = imageInBates;
  //       }
  //
  //       String? responseRate = await NetworkService.GET(
  //           NetworkService.getUri(NetworkService.API_PROFILE_RATE_FROM_ID +
  //               listOfNearChayxana[i].chayxanaId!),
  //           {});
  //
  //       if (responseRate != null) {
  //         listOfNearChayxana[i].rate =
  //             jsonDecode(responseRate)["object"].toString();
  //       }
  //
  //       for (int j = 0;
  //           j < listOfNearChayxana[i].chayxanaDetailDtos!.length;
  //           j++) {
  //         Uint8List? iconInBates = await NetworkService.GETONBATES(
  //             NetworkService.getUri(NetworkService.API_PROFILE_ICON_FROM_ID +
  //                 listOfNearChayxana[i]
  //                     .chayxanaDetailDtos![j]
  //                     .iconMultiSendDto!
  //                     .id!),
  //             {});
  //
  //         if (imageInBates != null) {
  //           listOfNearChayxana[i].iconsInbytes.add(iconInBates!);
  //         }
  //       }
  //     }
  //   }

  //   isLoading = false;
  //   update();
  // }

  _addPlacemarkChayxana(NearChayxana nearChayxana, Position position) async {
    mapObjects.add(PlacemarkMapObject(
      onDrag: (obj, point) {},
      opacity: 1,
      mapId: MapObjectId(nearChayxana.chayxanaId!),
      onTap: (icon, point) {
        yandexMapController.moveCamera(CameraUpdate.newCameraPosition(
            CameraPosition(
                target:
                    Point(latitude: point.latitude, longitude: point.longitude),
                zoom: 15.0)));
      },
      point: Point(
          latitude: position.latitude + Random().nextDouble() / 100,
          longitude: position.longitude - Random().nextDouble() / 100),
      icon: PlacemarkIcon.single(PlacemarkIconStyle(
          image: BitmapDescriptor.fromAssetImage(
        'assets/icons/ic_location_chayxana.png',
      ))),
    ));
  }

  _addPlacemarkUser(Position position) async {
    mapObjects.add(PlacemarkMapObject(
      onDrag: (obj, point) {},
      opacity: 1,
      mapId: MapObjectId('user_location'),
      onTap: (icon, point) {
        yandexMapController.moveCamera(CameraUpdate.newCameraPosition(
            CameraPosition(
                target:
                    Point(latitude: point.latitude, longitude: point.longitude),
                zoom: 15.0)));
      },
      point: Point(latitude: position.latitude, longitude: position.longitude),
      icon: PlacemarkIcon.single(PlacemarkIconStyle(
          image: BitmapDescriptor.fromAssetImage(
        'assets/icons/user.png',
      ))),
    ));
  }

  _getCurrentPosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    print("-----------------------------------");
    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      // return Future.error('Location services are disabled.');

      Location location = Location();

      bool _serviceEnabled;
      PermissionStatus _permissionGranted;
      LocationData _locationData;

      _serviceEnabled = await location.serviceEnabled();
      if (!_serviceEnabled) {
        _serviceEnabled = await location.requestService();
        if (!_serviceEnabled) {
          return Future.error('Location services are disabled.');
        }
      }

      _permissionGranted = await location.hasPermission();
      if (_permissionGranted == PermissionStatus.denied) {
        _permissionGranted = await location.requestPermission();
        if (_permissionGranted != PermissionStatus.granted) {
          return Future.error('Location services are disabled.');
        }
      }

      _locationData = await location.getLocation();
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    Position _currentPosition = await Geolocator.getCurrentPosition();
    return _currentPosition;
  }
}
