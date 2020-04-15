import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';

///
/// Loads the animated logo.
///
class AnimatedLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: FlareActor(
        "assets/anim/orchid_logo_animation.flr",
        alignment: Alignment.center,
        animation: "go",
      ),
    );
  }
}