import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  /// #Nasibali
  TextEditingController searchTextController = TextEditingController();
  late DraggableScrollableController scrollController =
      DraggableScrollableController();
  double hight = 0;
  double splashRadius = 3;
  double borderRadius = 20;
  bool isRisen = false;
  double minScroll = 0.4;
  double maxScroll = 0.9;
  double initScrol = 0.4;

  @override
  void onInit() {
    super.onInit();
    // scrollController = DraggableScrollableController();
    scrollController.addListener(_listening);
  }

  _listening() {
    hight = (scrollController.size <= 0.40 ? 0 : scrollController.size) * 100;
    splashRadius = 150 / (scrollController.size * 100);

    borderRadius = 700 / (scrollController.size * 100);

    if (scrollController.size >= 0.88) {
      isRisen = true;
    } else {
      isRisen = false;
    }

    update();
  }

  goLocation() async {
    if (!isRisen) {
      minScroll = 0.9;
      initScrol = 0.9;
      update();
      Future.delayed(Duration(seconds: 1), () {
        minScroll = 0.4;
        update();
      });
    } else {
      maxScroll = 0.4;
      initScrol = 0.4;
      update();
      Future.delayed(Duration(seconds: 1), () {
        minScroll = 0.9;
        initScrol = 0.9;
        update();
      });
    }

    //your code goes here
    // scrollController.animateTo(0.9, duration: duration, curve: curve)
    // }
  }
}
