import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttering_plants/common/color_util.dart';
import 'package:fluttering_plants/common/dimen_util.dart';
import 'package:fluttering_plants/screens/animations/fade_in_up.dart';
import 'package:fluttering_plants/screens/home/animated_logo.dart';

class Step2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(DimenUtil.defaultMargin),
        child: Column(
          children: <Widget>[
            Align(
                alignment: Alignment.centerRight,
                child: Text("Skip",
                    style: TextStyle(
                      fontFamily: 'AlegreyaSans',
                      color: ColorUtil.black.withOpacity(.5),
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ))),
            Padding(
              padding: const EdgeInsets.only(top: 120.0),
              child: FadeInUp(
                delay: 1,
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontFamily: 'AlegreyaSans',
                      color: ColorUtil.black.withOpacity(.5),
                      fontSize: 36,
                      fontWeight: FontWeight.w500,
                    ),
                    children: <TextSpan>[
                      TextSpan(text: 'Wil je '),
                      TextSpan(
                          text: 'meldingen',
                          style: TextStyle(
                            color: ColorUtil.primaryColor,
                            fontWeight: FontWeight.w700,
                          )),
                      TextSpan(text: ' ontvangen als je planten '),
                      TextSpan(
                          text: 'water',
                          style: TextStyle(
                            color: ColorUtil.primaryColor,
                            fontWeight: FontWeight.w700,
                          )),
                      TextSpan(text: ' nodig hebben?'),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: FadeInUp(
                  delay: 2,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "We hebben daarvoor toestemming\nvan je nodig.",
                      style: TextStyle(
                        fontFamily: 'AlegreyaSans',
                        color: ColorUtil.black.withOpacity(.5),
                        fontSize: 16,
                          fontWeight: FontWeight.w500,
                          height: 1.3
                      ),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
