import 'package:weather_guru/utilities/wg_widgets.dart';
import 'package:flutter/material.dart';
import 'package:spring/spring.dart';

import 'bubble_button_animation_image_widget.dart';

class SelectCityErrorWidget extends StatelessWidget {
  const SelectCityErrorWidget({Key? key, required this.buttonAction})
      : super(key: key);

  final Function(BuildContext context) buttonAction;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Spring.fadeIn(
      animDuration: WGWidget.fadeInDuration,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BubbleButtonAnimationImageWidget(
                imagePath: 'assets/images/cartoonSadCloud.png'),
            const SizedBox(height: 10.0),
            Text('The city was not found.',
                style: WGWidget.createWhiteTextStyle(30.0),
                textAlign: TextAlign.center),
            const SizedBox(height: 20.0),
            ElevatedButton(
                onPressed: () => buttonAction(context),
                style: WGWidget.elevatedButtonStyle(),
                child: SizedBox(
                  height: 40.0,
                  width: 120.0,
                  child: Center(
                    child: Text(
                      'Try again',
                      style: WGWidget.createWhiteTextStyle(20.0),
                    ),
                  ),
                ))
          ],
        ),
      ),
    ));
  }
}
