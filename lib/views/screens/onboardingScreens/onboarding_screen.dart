import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:youtube_clone/views/screens/other%20screens/home_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      body: Padding(
        padding: const EdgeInsets.only(top: 58),
        child: IntroductionScreen(
          pages: [
            commonPageViewModel(
                "Enjoy your day With us",
                "You can kickstart your day with short amazing videos from our platform ",
                "assets/youtube.png"),
            //page 2
            commonPageViewModel(
                "Are you tired from work ?.",
                "Look not further @youtube we got your  happiness covered and well figured, kindly give us a tap today ...",
                "assets/youtube.png"),
            //page 3
            commonPageViewModel(
                "Hey, Do you Dislike Ads ...?",
                "We got you covered, we dont want to spam your happy moments with ads",
                "assets/youtube.png"),
          ],
          dotsDecorator: DotsDecorator(
              size: Size(5, 10),
              activeColor: Colors.blue.shade100,
              activeSize: Size(20, 10),
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(60),
              )),
          showDoneButton: true,
          done: Text(
            "Done",
            style: TextStyle(fontSize: 20),
          ),
          showNextButton: true,
          next: Icon(Icons.keyboard_arrow_right_outlined),
          showSkipButton: true,
          skip: Text(
            "Skip",
            style: TextStyle(fontSize: 20),
          ),
          onDone: () {
            Get.snackbar("Alert Message", "You have successful skipped ...");
            Get.offAll(HomeScreen());
          },
        ),
      ),
    );
  }

  PageViewModel commonPageViewModel(title, bodyText, image) {
    return PageViewModel(
        title: title,
        body: bodyText,
        image: Image.asset(image),
        decoration: PageDecoration(
            pageColor: Colors.redAccent.shade700,
            titleTextStyle:
                TextStyle(fontSize: 25, fontWeight: FontWeight.bold)));
  }
}
