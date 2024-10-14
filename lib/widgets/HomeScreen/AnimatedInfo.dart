import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class CkSlideTransition extends StatefulWidget {
  int index;
  Widget child;
  CkSlideTransition({super.key, required this.index, required this.child});

  @override
  State<CkSlideTransition> createState() => _CkSlideTransitionState();
}

class _CkSlideTransitionState extends State<CkSlideTransition>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  );

  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: Offset(1, 0),
    end: const Offset(0.0, 0.0),
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.ease,
  ));

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    // _controller.reset();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key(widget.index.toString()),
      onVisibilityChanged: (VisibilityInfo info) {
        if (info.visibleFraction > 0) {
          _controller.forward();
        } else {}
      },
      child: SlideTransition(
        position: _offsetAnimation,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: widget.child,
        ),
      ),
    );
  }
}
