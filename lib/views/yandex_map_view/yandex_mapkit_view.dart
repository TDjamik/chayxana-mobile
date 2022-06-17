import 'package:chayxana/views/yandex_map_view/yandex_map_contoller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class YandexMapView extends StatelessWidget {
  YandexMapView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyYandexMapController>(
      init: MyYandexMapController(),
      builder: (myYandexMapController) {
        return YandexMap(
          tiltGesturesEnabled: true,
          zoomGesturesEnabled: true,
          rotateGesturesEnabled: true,
          scrollGesturesEnabled: true,
          modelsEnabled: true,
          nightModeEnabled: false,
          indoorEnabled: false,

          mapObjects: myYandexMapController.mapObjects,
          // onMapTap: (Point point) {
          //   marker(
          //       latitude: point.latitude.toDouble(),
          //       longitude: point.longitude.toDouble());
          // },
          onMapCreated: (YandexMapController yandexMapController) async {
            myYandexMapController.yandexMapController = yandexMapController;
            final cameraPosition =
                await yandexMapController.getCameraPosition().then(
              (value) async {
                await yandexMapController.moveCamera(
                    CameraUpdate.newCameraPosition(CameraPosition(
                        target: Point(latitude: 41.2995, longitude: 69.2401),
                        zoom: 12.0)));
              },
            );

            await myYandexMapController.determinePosition();
          },
        );
      },
    );
  }
}


  // marker({latitude, longitude}) {
  //   if (mapObjects.isEmpty) {
  //     if (mapObjects.any((element) => element.mapId == placemarkId)) {
  //       return;
  //     }

  //     final PlacemarkMapObject endPlacemark = PlacemarkMapObject(
  //         mapId: MapObjectId('end_placemark'),
  //         point: Point(latitude: 41.3266298, longitude: 69.2283175),
  //         icon: PlacemarkIcon.single(PlacemarkIconStyle(
  //             image: BitmapDescriptor.fromAssetImage(
  //                 'assets/icons/ic_gift.png'))));

  //     mapObjects.add(endPlacemark);
  //   } else if (mapObjects.isNotEmpty) {
  //     if (!mapObjects.any((element) => element.mapId == placemarkId)) {
  //       return;
  //     }

  //     final placemarkUpdate = mapObjects
  //         .firstWhere((el) => el.mapId == placemarkId) as PlacemarkMapObject;
  //     mapObjects[mapObjects.indexOf(placemarkUpdate)] =
  //         placemarkUpdate.copyWith(
  //       point: Point(latitude: latitude, longitude: longitude),
  //     );
  //   }
  //   // }
  // }

