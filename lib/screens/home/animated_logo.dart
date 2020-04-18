import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttering_plants/common/warmup_flare.dart';

///
/// Loads the animated logo.
///
class AnimatedLogo extends StatelessWidget {

  double height;
  double width;
  Alignment align;

  AnimatedLogo({this.height = 45, this.width = double.infinity, this.align = Alignment.center});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: FlareActor.asset(
        flareAssets["logo"],
        alignment: align,
        animation: "go",
        fit: BoxFit.contain,
      ),
    );
  }

}