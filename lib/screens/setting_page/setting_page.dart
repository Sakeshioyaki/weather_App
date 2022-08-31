import 'package:flutter/material.dart';
import 'package:untitled/common/app_colors.dart';
import 'package:untitled/common/app_images.dart';
import 'package:untitled/common/app_text_styles.dart';
import 'package:untitled/screens/setting_page/atmospheric.dart';
import 'package:untitled/screens/setting_page/temp_unit.dart';
import 'package:untitled/screens/setting_page/wind_speed.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Setting'),
      //   backgroundColor: Colors.transparent,
      // ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient: const LinearGradient(
              colors: [AppColor.startGradient, AppColor.endGradient],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      AppImage.icBack,
                      height: 32,
                    ),
                  ),
                  Text(
                    'Setting',
                    style: AppTextStyle.semiBold,
                  ),
                  const SizedBox(
                    width: 50,
                    height: 32,
                  )
                ],
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'UNIT',
                      style: AppTextStyle.mediumTextSmall,
                    ),
                    const SizedBox(height: 15),
                    const TempUnit(),
                    const SizedBox(height: 15),
                    const WindSpeed(),
                    const SizedBox(height: 15),
                    const Atmospheric(),
                    const SizedBox(height: 40),
                    Container(color: Colors.white, height: 1),
                    const SizedBox(height: 20),
                    Text(
                      'EXTRA',
                      style: AppTextStyle.mediumTextSmall,
                    ),
                    const SizedBox(height: 20),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        'About',
                        style: AppTextStyle.regularText16,
                      ),
                    ),
                    const SizedBox(height: 20),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        'Privacy police',
                        style: AppTextStyle.regularText16,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
