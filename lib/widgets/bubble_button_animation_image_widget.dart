import 'package:flutter/material.dart';
import 'package:spring/spring.dart';

class BubbleButtonAnimationImageWidget extends StatelessWidget {
  BubbleButtonAnimationImageWidget({Key? key, required this.imagePath})
      : super(key: key);

  final String imagePath;
  final _controller = SpringController();

  @override
  Widget build(BuildContext context) {
    return Spring.bubbleButton(
      springController: _controller,
      onTap: () {
        _controller.play();
      },
      child: Image.asset(imagePath, height: 200.0, width: 200.0),
    );
  }
}
