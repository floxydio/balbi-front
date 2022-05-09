
import 'package:balbinew/Pages/Auth/login_screen.dart';
import 'package:balbinew/Service/color_service.dart';
import 'package:balbinew/Service/image_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';

class Introduction extends StatefulWidget {
  const Introduction({Key? key}) : super(key: key);

  @override
  State<Introduction> createState() => _IntroductionState();
}

class _IntroductionState extends State<Introduction> {
  final introKey = GlobalKey<IntroductionScreenState>();
  var pageDecoration = const PageDecoration(
    titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
    pageColor: Colors.white,
    imagePadding: EdgeInsets.zero,
  );

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: white,
      showBackButton: false,
      showSkipButton: false,
      skipOrBackFlex: 1,
      onDone: () {
        Get.off(const LoginScreen());
      },
      //rtl: true, // Display as right-to-left
      back: const Icon(Icons.arrow_back),
      skip: const Text('Skip', style: TextStyle(fontWeight: FontWeight.w600)),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
      curve: Curves.bounceInOut,

      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
          shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      )),
      pages: [
        PageViewModel(
            titleWidget: const Text("Temukan Pembelajaran Favorit Anak",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700)),
            body:
                "Instead of having to buy an entire share, invest any amount you want.",
            image: buildImage(ImageService().intro1),
            decoration: pageDecoration),
        PageViewModel(
            titleWidget: const Text(
              "Pembimbing yang Siap Kapan Saja",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
            ),
            body:
                "Instead of having to buy an entire share, invest any amount you want.",
            image: buildImage(ImageService().intro2),
            decoration: pageDecoration),
        PageViewModel(
            titleWidget: const Text(
              "Temukan Pembelajaran Favorit Anak",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
            ),
            body:
                "Instead of having to buy an entire share, invest any amount you want.",
            image: buildImage(ImageService().intro3),
            decoration: pageDecoration),
      ],
    );
  }
}
