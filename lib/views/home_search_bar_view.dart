import 'package:chayxana/pages/main/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/constants/app_colors.dart';

class HomeSearchBarView extends StatefulWidget {
  HomeSearchBarView({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeSearchBarView> createState() => _HomeSearchBarViewState();
}

class _HomeSearchBarViewState extends State<HomeSearchBarView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return Stack(
            children: [
              Container(
                width: Get.width,
                color: AppColors.colorHomeBottomViewBack,
                height: controller.hight,
              ),
              Container(
                alignment: Alignment.topCenter,
                margin: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: Get.width * 0.7,
                      height: 50,
                      padding: const EdgeInsets.only(left: 15),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: controller.isRisen
                                    ? AppColors.colorHomeBottomViewBack
                                    : Colors.grey,
                                blurRadius: controller.splashRadius),
                          ],
                          color: AppColors.activeColor,
                          borderRadius: BorderRadius.circular(200)),
                      child: TextField(
                        controller: controller.searchTextController,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Search",
                            icon: Icon(
                              Icons.search,
                              size: 30,
                              color: AppColors.unSelectedTextColor,
                            )),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        controller.goLocation();
                      },
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: controller.isRisen
                                      ? AppColors.colorHomeBottomViewBack
                                      : Colors.grey,
                                  blurRadius: controller.splashRadius),
                            ],
                            color: AppColors.activeColor,
                            borderRadius: BorderRadius.circular(4324)),
                        child: Icon(
                          controller.isRisen
                              ? Icons.location_on
                              : Icons.list_alt_outlined,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        });
  }
}
