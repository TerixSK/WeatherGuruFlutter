import 'package:flutter/material.dart';
import 'package:flutter_app_watherguru/screens/geolocation_screen.dart';
import 'package:flutter_app_watherguru/utilities/WGWidgets.dart';
import 'package:flutter_app_watherguru/widgets/bubble_button_animation_image_widget.dart';
import 'package:spring/spring.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            color: WGColors.backgroundColor,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 50.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BubbleButtonAnimationImageWidget(
                        imagePath: 'assets/images/cartoonHappyCloud.png'),
                    Text(
                      'Hello! Welcome to WeatherGuru!',
                      style: WGWidget.createWhiteTextStyle(40, isBold: true),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      'I am your personal assistant\n for viewing the weather in different cities.',
                      style: WGWidget.createWhiteTextStyle(24),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20.0),
                    const StartButton()
                  ],
                ),
              ),
            )),
      ),
    );
  }
}

class StartButton extends StatelessWidget {
  const StartButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          var route = MaterialPageRoute(
              builder: (context) => const GeolocationScreen());
          Navigator.push(context, route);
        },
        style: WGWidget.elevatedButtonStyle(),
        child: SizedBox(
          height: 50.0,
          width: 160.0,
          child: Center(
            child: Text('Start',
                style: WGWidget.createWhiteTextStyle(30, isBold: true)),
          ),
        ));
  }
}
