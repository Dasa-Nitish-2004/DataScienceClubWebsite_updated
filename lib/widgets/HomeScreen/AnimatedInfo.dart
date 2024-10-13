import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class CkSlideTransition extends StatefulWidget {
  int index;
  Map<String, String> data;
  CkSlideTransition({super.key, required this.index, required this.data});

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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 250,
                width: 400,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  // border: Border.all(width: 2),
                ),
                clipBehavior: Clip.antiAlias,
                child: Image.asset(
                  widget.data["img"]!,
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                width: 1,
                height: 200,
                color: Colors.black,
              ),
              Column(
                children: [
                  Container(
                    width: 600,
                    child: Text(
                      widget.data['title']!,
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(color: Colors.grey[700], letterSpacing: 2),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 600,
                    child: Text(
                      widget.data['subTitle']!,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Colors.grey[700]),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
