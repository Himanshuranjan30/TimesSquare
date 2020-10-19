import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import 'package:news/screens/homescreen.dart';

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  Widget _buildImage(String assetName) {
    return Align(
      child: Image.asset('assets/$assetName.png', width: 200.0),
      alignment: Alignment.bottomCenter,
    );
  }

  int count = 1;
  // SharedPreferences prefs;
  // getdemostatus() async {
  //   prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     prefs.setBool('isdemoover', true);
  //   });
  // }

  // bool isdemoover = false;
  // getdemostatus1() async {
  //   prefs = await SharedPreferences.getInstance();
  //   print('here');
  //   setState(() {
  //     isdemoover = prefs.getBool('isdemoover') ?? false;
  //   });
  // }

  // void initState() {
  //   super.initState();
  //   getdemostatus1();
  // }

  final pageDecoration = const PageDecoration(
    titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
    bodyTextStyle: TextStyle(fontSize: 19.0),
    descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
    pageColor: Colors.white,
    imagePadding: EdgeInsets.zero,
  );

  @override
  Widget build(BuildContext context) {
    final isdemoover = ModalRoute.of(context).settings.arguments as bool;
    return isdemoover
        ? HomeScreen()
        : IntroductionScreen(
            key: introKey,
            pages: [
              PageViewModel(
                title: "Top Headlines on the Go!",
                body:
                    "Never miss out on any news from around the Globe,We got you covered with news from different categories.",
                image: _buildImage('img1'),
                decoration: pageDecoration,
              ),
              PageViewModel(
                title: "Get Notified Daily!",
                body:
                    "Finding it tough to have some news daily? We got it covered with our notification feature.",
                image: _buildImage('img2'),
                decoration: pageDecoration,
              ),
              PageViewModel(
                title: "Multiple Languages!",
                body:
                    "Finding it tough to understand the article in English? Translate it to Hindi with our Selective Translation feature.",
                image: _buildImage('img3'),
                decoration: pageDecoration,
              ),
              PageViewModel(
                title: "Sharing is Caring!",
                body: "Share the news you read with your Friends and Family.",
                image: _buildImage('img4'),
                decoration: pageDecoration,
              ),
            ],
            onDone: () {
              Navigator.of(context).popAndPushNamed('/home_screen');
            },
            //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
            showSkipButton: true,
            skipFlex: 0,
            nextFlex: 0,
            skip: const Text('Skip'),
            next: const Icon(Icons.arrow_forward),
            done: const Text('Done',
                style: TextStyle(fontWeight: FontWeight.w600)),
            dotsDecorator: const DotsDecorator(
              size: Size(10.0, 10.0),
              color: Color(0xFFBDBDBD),
              activeSize: Size(22.0, 10.0),
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(25.0)),
              ),
            ),
          );
  }
}
