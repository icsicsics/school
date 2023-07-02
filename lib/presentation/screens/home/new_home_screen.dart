import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/core/utils/resorces/image_path.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class NewHomeScreen extends StatefulWidget {
  const NewHomeScreen({super.key});

  @override
  State<NewHomeScreen> createState() => _NewHomeScreenState();
}

class _NewHomeScreenState extends State<NewHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorsManager.whiteColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      top: 48,
                      left: 16,
                      child: SvgPicture.asset(
                        ImagesPath.menuIcon,
                        width: 24,
                        height: 24,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 16,
                          ),
                          Image.asset(
                            ImagesPath.logo,
                            width: 65,
                            height: 65,
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Text(
                            "Name of School",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 14,
                                color: ColorsManager.primaryColor,
                                fontWeight: FontWeight.w600,
                                letterSpacing: -0.13),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      ColorsManager.primaryColor,
                      ColorsManager.secondaryColor,
                    ],
                    stops: [0.5, 0.8],
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          "Tuesday",
                          style: TextStyle(
                              fontSize: 14,
                              color: ColorsManager.whiteColor,
                              fontWeight: FontWeight.w600,
                              letterSpacing: -0.13),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "6 th of june 2023",
                          style: TextStyle(
                              fontSize: 14,
                              color: ColorsManager.whiteColor,
                              fontWeight: FontWeight.w400,
                              letterSpacing: -0.13),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          "Weather",
                          style: TextStyle(
                              fontSize: 14,
                              color: ColorsManager.whiteColor,
                              fontWeight: FontWeight.w600,
                              letterSpacing: -0.13),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              ImagesPath.weatherIcon,
                              width: 22,
                              height: 22,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "25 C clear sky",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: ColorsManager.whiteColor,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: -0.13),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 16,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                width: double.infinity,
                child: Text(
                  "Teachers Performance",
                  style: TextStyle(
                      fontSize: 17,
                      color: ColorsManager.blackColor,
                      fontWeight: FontWeight.w600,
                      letterSpacing: -0.13),
                  textAlign: TextAlign.start,
                ),
              ),
              SizedBox(
                height: 64,
              ),
              Container(
                height: 150,
                width: 150,
                child: SfRadialGauge(
                  axes: <RadialAxis>[
                    RadialAxis(
                        showLabels: false,
                        showAxisLine: false,
                        showTicks: false,
                        startAngle: 180,
                        endAngle: 0,
                        minimum: 0,
                        radiusFactor: 1.6,
                        maximum: 99,
                        ranges: <GaugeRange>[
                          GaugeRange(
                            startValue: 0,
                            endValue: 33,
                            color: Color.fromRGBO(59, 187, 172, 1),
                            label: '',
                            labelStyle: GaugeTextStyle(
                                fontFamily: 'Times', fontSize: 20),
                            startWidth: 50,
                            endWidth: 50,
                            sizeUnit: GaugeSizeUnit.logicalPixel,
                          ),
                          GaugeRange(
                            startValue: 33,
                            endValue: 66,
                            color: Color.fromRGBO(243, 154, 74, 1),
                            label: '',
                            labelStyle: GaugeTextStyle(
                                fontFamily: 'Times', fontSize: 20),
                            startWidth: 50,
                            endWidth: 50,
                            sizeUnit: GaugeSizeUnit.logicalPixel,
                          ),
                          GaugeRange(
                            startValue: 66,
                            endValue: 99,
                            color: Color.fromRGBO(249, 65, 68, 1),
                            label: '',
                            labelStyle: GaugeTextStyle(
                                fontFamily: 'Times', fontSize: 20),
                            startWidth: 50,
                            endWidth: 50,
                            sizeUnit: GaugeSizeUnit.logicalPixel,
                          ),
                        ],
                        pointers: <GaugePointer>[
                          NeedlePointer(value: 60)
                        ])
                  ],
                ),
              ),
              Row(
                children: [
                  _buildHomeCard(
                      image: ImagesPath.classesIcon, title: "My Classes"),
                  SizedBox(
                    width: 16,
                  ),
                  _buildHomeCard(
                      image: ImagesPath.housesIcon, title: "My Houses"),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  _buildHomeCard(
                      image: ImagesPath.mediaIcon, title: "My Media"),
                  SizedBox(
                    width: 16,
                  ),
                  _buildHomeCard(
                      image: ImagesPath.ejabiChannelIcon,
                      title: "Ejabi Channel"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Expanded _buildHomeCard({
    required String image,
    required String title,
  }) {
    return Expanded(
      child: Container(
        height: 150,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
                colors: [
                  ColorsManager.whiteColor,
                  Color.fromRGBO(224, 224, 224, 0.31),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.3, 0.9]),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.12),
                spreadRadius: 0,
                blurRadius: 24,
                offset: Offset(0, 4), // changes position of shadow
              )
            ]),
        child: Column(
          children: [
            SizedBox(
              height: 16,
            ),
            Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromRGBO(59, 187, 172, 1),
              ),
              child: SvgPicture.asset(
                image,
                width: 28,
                height: 28,
                fit: BoxFit.scaleDown,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              title,
              style: TextStyle(
                  fontSize: 14,
                  color: ColorsManager.blackColor,
                  fontWeight: FontWeight.w500,
                  letterSpacing: -0.13),
            ),
          ],
        ),
      ),
    );
  }
}
