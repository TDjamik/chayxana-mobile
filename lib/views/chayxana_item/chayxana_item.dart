import 'package:chayxana/services/constants/app_colors.dart';
import 'package:chayxana/services/constants/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marquee/marquee.dart';

import '../../models/near_chayxana.dart';
import '../../services/constants/app_assets.dart';

class ChayxanaItem extends StatelessWidget {
  NearChayxana nearChayxana;
  ChayxanaItem({Key? key, required this.nearChayxana}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                  child: nearChayxana.imageInbytes == null
                      ? Image.asset(
                          AppAssets.galleryPhoto1IM,
                          height: Get.height * 0.18,
                          fit: BoxFit.cover,
                        )
                      : Image.memory(
                          nearChayxana.imageInbytes!,
                          height: Get.height * 0.18,
                          fit: BoxFit.cover,
                        ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  padding: EdgeInsets.all(10),
                  height: Get.height * 0.18,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        nearChayxana.chayxanaName!.length > 15
                            ? Container(
                                width: 170,
                                height: 20,
                                child: Marquee(
                                  text: nearChayxana.chayxanaName!,
                                  style: AppFonts.chayxanaItemTitle(),
                                  blankSpace: 30,
                                  velocity: 40,
                                  accelerationCurve: Curves.bounceOut,
                                  decelerationCurve: Curves.bounceIn,
                                  showFadingOnlyWhenScrolling: false,
                                  pauseAfterRound: Duration(seconds: 3),
                                ),
                              )
                            : Container(
                                width: 170,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Text(
                                    nearChayxana.chayxanaName!,
                                    style: AppFonts.chayxanaItemTitle(),
                                  ),
                                ),
                              ),
                        Text(
                          "Локатся: ${nearChayxana.addressDto!.streetName.toString()}",
                          style: AppFonts.chayxanaItemTContent(),
                        ),
                        Text(
                          "Работает до: ${nearChayxana.endTime.toString()}",
                          style: AppFonts.chayxanaItemTContent(),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "15 км",
                              style: AppFonts.chayxanaItemDistance(),
                            ),
                            Row(
                                mainAxisSize: MainAxisSize.min,
                                children: List.generate(
                                    nearChayxana.iconsInbytes.length, (index) {
                                  return Image.memory(
                                    nearChayxana.iconsInbytes[index],
                                    fit: BoxFit.cover,
                                    width: 20,
                                    height: 20,
                                    color: AppColors.colorShayxanaItemDistance,
                                  );
                                })),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.all(15),
          alignment: Alignment.topRight,
          child: CircleAvatar(
            radius: 15,
            backgroundColor: AppColors.mainColor,
            child: Text(
              nearChayxana.rate.toString(),
              style: AppFonts.chayxanaItemHour(),
            ),
          ),
        ),
      ],
    );
  }
}
