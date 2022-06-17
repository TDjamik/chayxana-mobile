import 'package:chayxana/services/constants/app_colors.dart';
import 'package:chayxana/services/constants/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../services/constants/app_assets.dart';

class ShimmerChayxanaItem extends StatelessWidget {
  ShimmerChayxanaItem({Key? key}) : super(key: key);

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
                child: Shimmer.fromColors(
                  direction: ShimmerDirection.ltr,
                  baseColor: Colors.grey.shade200,
                  highlightColor: Colors.white,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                    child: Image.asset(
                      "assets/images/im_gallery_photo11.png",
                      height: Get.height * 0.18,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Shimmer.fromColors(
                  baseColor: Colors.grey.shade200,
                  highlightColor: Colors.white,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    height: Get.height * 0.18,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Shimmer.fromColors(
                          baseColor: Colors.grey.shade200,
                          highlightColor: Colors.white,
                          child: Container(
                            width: 100,
                            height: 15,
                            color: Colors.black,
                          ),
                        ),
                        Shimmer.fromColors(
                          baseColor: Colors.grey.shade200,
                          highlightColor: Colors.white,
                          child: Container(
                            width: 150,
                            height: 10,
                            color: Colors.black,
                          ),
                        ),
                        Shimmer.fromColors(
                          baseColor: Colors.grey.shade200,
                          highlightColor: Colors.white,
                          child: Container(
                            width: 130,
                            height: 10,
                            color: Colors.black,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Shimmer.fromColors(
                              baseColor: Colors.grey.shade200,
                              highlightColor: Colors.white,
                              child: Container(
                                width: 30,
                                height: 13,
                                color: Colors.black,
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Shimmer.fromColors(
                                  baseColor: Colors.grey.shade200,
                                  highlightColor: Colors.white,
                                  child: Container(
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius:
                                            BorderRadius.circular(2323)),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Shimmer.fromColors(
                                  baseColor: Colors.grey.shade200,
                                  highlightColor: Colors.white,
                                  child: Container(
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius:
                                            BorderRadius.circular(2323)),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Shimmer.fromColors(
                                  baseColor: Colors.grey.shade200,
                                  highlightColor: Colors.white,
                                  child: Container(
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius:
                                            BorderRadius.circular(2323)),
                                  ),
                                ),
                              ],
                            ),
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
          child: Shimmer.fromColors(
            baseColor: Colors.grey.shade200,
            highlightColor: Colors.white,
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(2323)),
            ),
          ),
        ),
      ],
    );
  }
}
