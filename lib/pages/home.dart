import 'package:flutter/material.dart';
import 'package:goodspend/drawer.dart';
import 'package:goodspend/pages/form_blog.dart';
import 'package:goodspend/pages/loan_calculator.dart';
import 'package:goodspend/pages/financial_news.dart';
import 'package:goodspend/pages/data.dart';

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
        body: Stack(children: <Widget>[
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
            child: Text(
              'Selamat datang!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
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
                child: InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BlogFormPage()),
                    );
                  },
                  child: Container(
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
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FinancialNews()),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.new_releases,
                            color: Colors.white,
                            size: 30.0,
                          ),
                          Padding(padding: EdgeInsets.all(3)),
                          Text(
                            "Financial News",
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
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const DataPage()),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.data_usage,
                            color: Colors.white,
                            size: 30.0,
                          ),
                          Padding(padding: EdgeInsets.all(3)),
                          Text(
                            "Data",
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
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoanCalculatorPage()),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.calculate,
                            color: Colors.white,
                            size: 30.0,
                          ),
                          Padding(padding: EdgeInsets.all(3)),
                          Text(
                            "Loan Calculator",
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
        ]));
  }
}
