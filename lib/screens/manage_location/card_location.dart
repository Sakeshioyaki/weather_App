import 'package:flutter/material.dart';
import 'package:untitled/common/app_colors.dart';
import 'package:untitled/common/app_images.dart';
import 'package:untitled/common/app_text_styles.dart';

class CardLocation extends StatelessWidget {
  final String nameLocation;
  final int maxTemp;
  final int minTemp;
  final bool mainLocation;
  final String weather;
  final VoidCallback onTap;

  const CardLocation(
      {Key? key,
      required this.maxTemp,
      required this.minTemp,
      required this.mainLocation,
      required this.weather,
      required this.onTap,
      required this.nameLocation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: AppColor.whiteColor),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        nameLocation,
                        style: AppTextStyle.regularText16
                            .copyWith(color: AppColor.blueDarkText),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      mainLocation
                          ? Image.asset(
                              AppImage.icLocation,
                              height: 16,
                            )
                          : const SizedBox(),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        minTemp.toString(),
                        style: AppTextStyle.grayBlueText12,
                      ),
                      Image.asset(
                        AppImage.degreeBlack,
                        height: 5,
                      ),
                      Text(
                        '/',
                        style: AppTextStyle.grayBlueText12,
                      ),
                      Text(
                        maxTemp.toString(),
                        style: AppTextStyle.grayBlueText12,
                      ),
                      Image.asset(
                        AppImage.degreeBlack,
                        height: 5,
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  Image.asset(
                    AppImage.icSunRainDayDarkOutLine,
                    height: 32,
                  ),
                  Text(weather, style: AppTextStyle.grayBlueText12)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
