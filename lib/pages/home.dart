import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:goodspend/drawer.dart';
import 'package:goodspend/pages/form_blog.dart';
import 'package:goodspend/pages/loan_calculator.dart';

class UserHomePage extends StatelessWidget {
  const UserHomePage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromRGBO(51, 51, 51, 1),
      appBar: AppBar(
        title: Text("GoodSpend"),
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
          const Padding(
            padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
            // Widget Text untuk menampilkan tulisan dengan alignment center dan style yang sesuai
            child: Text(
              'Selamat datang!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // Grid layout
          GridView.count(
            primary: true,
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 3,
            shrinkWrap: true,
            children: <Widget>[
              Material(
                color: Colors.green,
                child: InkWell( // Area responsive terhadap sentuhan
                  onTap: () {
                    // Memunculkan SnackBar ketika diklik
                    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => const BlogFormPage()),
    );
                  },
                  child: Container( // Container untuk menyimpan Icon dan Text
                    padding: const EdgeInsets.all(8),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.list_alt,
                            color: Colors.white,
                            size: 30.0,
                          ),
                          Padding(padding: EdgeInsets.all(3)),
                          Text(
                            "Financial Blog",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Material(
                color: Colors.green,
                child: InkWell(
                  onTap: () {
                    ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(const SnackBar(
                      content: Text("Kamu telah menekan tombol Logout!")));
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            // Kamu juga dapat mengggunakan icon lainnya
                            // seperti Icons.logout
                            Icons.door_back_door,
                            color: Colors.white,
                            size: 30.0,
                          ),
                          Padding(padding: EdgeInsets.all(3)),
                          Text(
                            "Logout",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
        ],
      ),
    ]
    )
    );
  }
}
