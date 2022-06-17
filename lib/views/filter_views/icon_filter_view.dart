import 'package:chayxana/services/constants/app_colors.dart';
import 'package:chayxana/services/constants/app_fonts.dart';
import 'package:flutter/material.dart';

class IconFilter extends StatelessWidget {
  String childIcon;
  String label;
  bool isChacked;
  Color? iconColor;
  Color? backgrounColor;
  double sizeWidth;
  Function onTab;
  IconFilter(
      {Key? key,
      required this.onTab,
      this.backgrounColor,
      required this.sizeWidth,
      this.iconColor,
      required this.childIcon,
      required this.label,
      this.isChacked = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
        tween: Tween(begin: 50, end: isChacked ? sizeWidth : 50),
        curve: Curves.easeIn,
        duration: const Duration(milliseconds: 700),
        builder: (context, width, _) {
          return Padding(
            padding: const EdgeInsets.all(5),
            child: Material(
              borderRadius: BorderRadius.circular(234234),
              color: isChacked ? iconColor : backgrounColor,
              child: InkWell(
                borderRadius: BorderRadius.circular(234234),
                onTap: () {
                  onTab();
                },
                child: Container(
                  width: width,
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12313),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        childIcon,
                        width: 25,
                        height: 25,
                        color: isChacked ? AppColors.activeColor : iconColor,
                        fit: BoxFit.fill,
                      ),
                      isChacked
                          ? TweenAnimationBuilder<double>(
                              duration: Duration(milliseconds: 800),
                              tween: Tween(begin: 0, end: 16),
                              curve: Curves.easeIn,
                              builder: (context, size, _) {
                                return Padding(
                                  padding: const EdgeInsets.only(left: 8),
                                  child: Text(
                                    label,
                                    style: AppFonts.poppinsBlackItalic(
                                        color: AppColors.activeColor,
                                        fontSize: size),
                                  ),
                                );
                              })
                          : Container()
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
