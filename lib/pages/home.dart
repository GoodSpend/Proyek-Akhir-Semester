import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:goodspend/drawer.dart';

class UserHomePage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromRGBO(51, 51, 51, 1),
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: Color.fromRGBO(127, 195, 126, 1),
        foregroundColor: Color.fromRGBO(51, 51, 51, 1),
      ),
      drawer: DrawerClass(),
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/goodspend_raw.png"),
                alignment: Alignment.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
