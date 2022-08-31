import 'package:flutter/material.dart';
import 'package:untitled/common/app_colors.dart';
import 'package:untitled/common/app_images.dart';
import 'package:untitled/common/app_text_styles.dart';
import 'package:untitled/screens/manage_location/card_location.dart';

class ManageLocation extends StatefulWidget {
  const ManageLocation({Key? key}) : super(key: key);

  @override
  State<ManageLocation> createState() => ManageLocationState();
}

class ManageLocationState extends State<ManageLocation> {
  List<Map> data = [
    {
      'name': 'Malang',
      'maxTemp': 20,
      'minTemp': 24,
      'weather': 'Heavy rain',
    },
    {
      'name': 'Banyuwangi',
      'maxTemp': 22,
      'minTemp': 26,
      'weather': 'Heavy rain',
    },
    {
      'name': 'Jakarta',
      'maxTemp': 27,
      'minTemp': 28,
      'weather': 'Cloudy',
    }
  ];
  int mainLocation = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    'Manage location',
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
                child: TextField(
                  onChanged: (value) => {},
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      fillColor: AppColor.whiteColor,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide.none,
                      ),
                      hintText: 'Search Your City',
                      hintStyle: AppTextStyle.regularText
                          .copyWith(color: AppColor.graySearchText),
                      prefixIcon: Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(left: 10),
                        child: const Icon(
                          Icons.search,
                          color: AppColor.graySearchIcon,
                        ),
                      )),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return CardLocation(
                        maxTemp: data[index]['maxTemp'],
                        minTemp: data[index]['minTemp'],
                        mainLocation: index == mainLocation ? true : false,
                        weather: data[index]['weather'],
                        nameLocation: data[index]['name'],
                        onTap: () {
                          setState(() {
                            mainLocation = index;
                          });
                        },
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
