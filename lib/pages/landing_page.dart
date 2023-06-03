import 'package:flutter/material.dart';
import 'package:goodspend/pages/home.dart';
import 'package:intro_slider/intro_slider.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key, required this.title});

  final String title;

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  List<ContentConfig> listContentConfig = [];

  @override
  void initState() {
    super.initState();
    listContentConfig.add(
      const ContentConfig(
        title: "Hello There!",
        description:
            "GoodSpend is a comprehensive financial app that empowers users to take control of their finances with a range of useful features.",
        pathImage: "assets/images/goodspend_raw.png",
        backgroundColor: Color.fromRGBO(51, 51, 51, 1),
      ),
    );
  }

  void onDonePress() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => UserHomePage()),
      );
  }

  Widget renderDoneBtn() {
    return Icon(
      Icons.done,
      color: Color.fromRGBO(51, 51, 51, 1),
    );
  }

  ButtonStyle GoodSpendButtonStyle() {
    return ButtonStyle(
      shape: MaterialStateProperty.all<OutlinedBorder>(StadiumBorder()),
      backgroundColor: MaterialStateProperty.all<Color>(Color.fromRGBO(127, 195, 126, 1)),
      overlayColor: MaterialStateProperty.all<Color>(Color.fromRGBO(127, 195, 126, 1)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      key: UniqueKey(),
      listContentConfig: listContentConfig,
      renderDoneBtn: renderDoneBtn(),
      onDonePress: onDonePress,
      doneButtonStyle: GoodSpendButtonStyle(),
    );
  }
}