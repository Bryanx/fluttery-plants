import 'package:flutter/cupertino.dart';
import 'package:simple_animations/simple_animations/controlled_animation.dart';
import 'package:simple_animations/simple_animations/multi_track_tween.dart';

///
/// Causes a fade- and moveY animation on load.
///
class FadeInUp extends StatelessWidget {
  final double delay;
  final Widget child;
  final double opacityStart;
  final double opacityEnd;

  FadeInUp({
    this.delay = 0,
    this.opacityStart = 0.0,
    this.opacityEnd = 1.0,
    this.child
  });

  @override
  Widget build(BuildContext context) {
    final tween = MultiTrackTween([
      Track("opacity")
          .add(Duration(milliseconds: 300), Tween(begin: opacityStart, end: opacityEnd)),
      Track("translateY").add(
          Duration(milliseconds: 300), Tween(begin: 90.0, end: 0.0),
          curve: Curves.easeOut)
    ]);

    return ControlledAnimation(
      delay: Duration(milliseconds: (delay * 300).round()),
      duration: tween.duration,
      tween: tween,
      child: child,
      builderWithChild: (context, child, animation) => Opacity(
        opacity: animation["opacity"],
        child: Transform.translate(
            offset: Offset(0, animation["translateY"]), child: child),
      ),
    );
  }
}