import 'package:chayxana/myModels/DetailModel.dart';
import 'package:chayxana/services/dio_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/*
User? user;

  @override
  onInit() {
    super.onInit();
    _apiGetUser();
  }

  void _apiGetUser() async {
      var response = await NetworkService.GET(NetworkService.API_MY_DATA, NetworkService.paramsUser("c73ebcd8-09b3-4820-b9ef-e670b7cb858f"));

      if(response == null) {
        Utils.fireSnackGetX("Something error!");
        return;
      }

      Map<String, dynamic> json = jsonDecode(response);
      user = User.fromJson(json["object"]);
      update();
  }
 */
class DetailController extends GetxController {
  //#otabek
  DetailModel? detailModel;
  double hight = Get.height / 3.toDouble();
  double widthofContainer = Get.width;
  double border = 0;
  bool needStack = true;
  double marginOfContainer1 = 0;
  double marginOfContainer2 = 0;
  final ScrollController scrollController = ScrollController();

  @override
  void onInit() async {
    super.onInit();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.minScrollExtent) {
        animationOfContainer2();
      }
      if (scrollController.position.pixels > 50) {
        animationOfContainer();
      }
    });
    String? str = await NetworkService.GET(NetworkService.API_GET_DETAIL,
        {'id': "093d7ff1-7a68-40ae-982c-14544b501a5c"});
    print('str: $str');
  }

  void animationOfContainer2() {
    hight = Get.height / 3.toDouble();
    widthofContainer = Get.width;
    border = 0;
    needStack = true;
    marginOfContainer1 = 0;
    marginOfContainer2 = 0;
    update();
    print("animation2");
  }

  void animationOfContainer() {
    hight = 60;
    widthofContainer = 60;
    border = 80;
    needStack = false;
    marginOfContainer1 = 30;
    marginOfContainer2 = 30;
    update();
    print("animation");
  }
}
