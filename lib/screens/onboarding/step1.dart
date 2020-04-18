import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttering_plants/common/color_util.dart';
import 'package:fluttering_plants/common/dimen_util.dart';
import 'package:fluttering_plants/screens/animations/fade_in_up.dart';
import 'package:fluttering_plants/screens/home/animated_logo.dart';

class Step1 extends StatelessWidget {
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
              padding: const EdgeInsets.only(top: 80.0),
              child: FadeInUp(
                delay: 1,
                child: AnimatedLogo(
                  width: MediaQuery.of(context).size.width,
                  height: 130,
                  align: Alignment.centerLeft,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: FadeInUp(
                delay: 2,
                child: Text("Beheer je planten samen.",
                    style: TextStyle(
                      fontFamily: 'AlegreyaSans',
                      color: ColorUtil.black.withOpacity(.5),
                      fontSize: 38,
                      fontWeight: FontWeight.w500,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
