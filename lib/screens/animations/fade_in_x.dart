import 'package:flutter/cupertino.dart';
import 'package:fluttering_plants/screens/navigation/drag_direction.dart';
import 'package:simple_animations/simple_animations/controlled_animation.dart';
import 'package:simple_animations/simple_animations/multi_track_tween.dart';

class FadeInX extends StatelessWidget {
  final double delay;
  final Widget child;
  final Direction direction;

  FadeInX({this.delay = 0, this.child, this.direction});

  Animatable getXTween() {
    if (direction == Direction.LEFT)
      return Tween(begin: -130.0, end: 0.0);
    else
      return Tween(begin: 130.0, end: 0.0);
  }

  @override
  Widget build(BuildContext context) {
    final tween = MultiTrackTween([
      Track("opacity")
          .add(Duration(milliseconds: 500), Tween(begin: 0.0, end: 1.0)),
      Track("translateX").add(
          Duration(milliseconds: 500), getXTween(),
          curve: Curves.easeOut)
    ]);

    return ControlledAnimation(
      delay: Duration(milliseconds: (300 * delay).round()),
      duration: tween.duration,
      tween: tween,
      child: child,
      builderWithChild: (context, child, animation) => Opacity(
        opacity: animation["opacity"],
        child: Transform.translate(
            offset: Offset(animation["translateX"], 0), child: child),
      ),
    );
  }
}