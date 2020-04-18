import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:fluttering_plants/common/color_util.dart';
import 'package:fluttering_plants/screens/home/home_screen.dart';
import 'package:fluttering_plants/screens/onboarding/step1.dart';
import 'package:fluttering_plants/stores/main_store.dart';
import 'package:provider/provider.dart';

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
      body: Padding(
        padding: const EdgeInsets.only(bottom: 32.0),
        child: Swiper(
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
      ),
    );
  }
}

class Step2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(child: Center(child: Text("step2")));
  }
}

class Step3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<MainStore>(context).onboardingStore;
    return Container(
        child: Center(
            child: FloatingActionButton.extended(
              onPressed: () {
                store.onBoardingIsFinished();
                Navigator.of(context).pushNamedAndRemoveUntil(HomeScreen.route, (_) => false);
              },
              elevation: 0.0,
              backgroundColor: ColorUtil.primaryColor,
              foregroundColor: ColorUtil.white,
              label: Text(
                "Prima",
                style: TextStyle(
                  fontFamily: 'AlegreyaSans',
                  fontSize: 17,
                  color: ColorUtil.white,
                  letterSpacing: 0.5,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )));
  }
}
