import 'package:flutter/cupertino.dart';
import 'package:simple_animations/simple_animations/controlled_animation.dart';
import 'package:simple_animations/simple_animations/multi_track_tween.dart';

///
/// Causes a fade animation on load.
///
class FadeInScale extends StatelessWidget {
  final double delay;
  final Widget child;

  FadeInScale({this.delay = 4, this.child});

  @override
  Widget build(BuildContext context) {
    final tween = MultiTrackTween([
      Track("opacity")
          .add(Duration(milliseconds: 400), Tween(begin: 0.0, end: 1.0)),
      Track("scale").add(
          Duration(milliseconds: 1000), Tween(begin: 0.0, end: 1.0),
          curve: Curves.elasticOut)
    ]);

    return ControlledAnimation(
      delay: Duration(milliseconds: (300 * delay).round()),
      duration: tween.duration,
      tween: tween,
      child: child,
      builderWithChild: (context, child, animation) => Opacity(
        opacity: animation["opacity"],
        child: Transform.scale(
            scale: animation['scale'], child: child),
      ),
    );
  }
}