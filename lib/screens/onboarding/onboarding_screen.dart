import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:fluttering_plants/common/color_util.dart';
import 'package:fluttering_plants/screens/home/home_screen.dart';
import 'package:fluttering_plants/screens/onboarding/step1.dart';
import 'package:fluttering_plants/screens/onboarding/step2.dart';
import 'package:fluttering_plants/screens/onboarding/step3.dart';
import 'package:fluttering_plants/stores/main_store.dart';
import 'package:provider/provider.dart';

///
/// Main onboarding screen, contains all steps and a swiper.
///
class OnboardingScreen extends StatelessWidget {
  static const route = "/onboarding";

  final List<Widget> steps = [
    Step1(),
    Step2(),
    Step3(),
  ];

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<MainStore>(context).onboardingStore;
    return Scaffold(
      backgroundColor: ColorUtil.backgroundColor,
      body: Swiper(
        loop: false,
        outer: false,
        itemBuilder: (c, i) {
          return steps[i];
        },
        pagination: SwiperPagination(
            margin: EdgeInsets.all(5.0),
            builder: DotSwiperPaginationBuilder(
                color: ColorUtil.solidGrey,
                activeColor: ColorUtil.primaryColor)),
        itemCount: 3,
      ),
    );
  }
}
