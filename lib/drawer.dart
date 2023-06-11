import 'package:flutter/material.dart';
import 'package:goodspend/pages/data.dart';
import 'package:goodspend/pages/landing_page.dart';
import 'package:goodspend/pages/home.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'pages/loan_calculator.dart';
import 'pages/form_blog.dart';

class DrawerClass extends StatefulWidget {
  DrawerClass({Key? key}) : super(key: key);

  @override
  _DrawerClassState createState() => _DrawerClassState();
}

class _DrawerClassState extends State<DrawerClass> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png'),
            ),
            accountEmail: Text('user@goodspend.co.id',
                style: TextStyle(color: Color.fromRGBO(127, 195, 126, 1))),
            accountName: Text(
              "User",
              style: TextStyle(
                  fontSize: 20, color: Color.fromRGBO(127, 195, 126, 1)),
            ),
            decoration: BoxDecoration(
              color: Color.fromRGBO(51, 51, 51, 1),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text(
              'Menu',
              style: TextStyle(fontSize: 20),
            ),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => UserHomePage(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.calculate),
            title: const Text(
              'Loan Calculator',
              style: TextStyle(fontSize: 20),
            ),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const LoanCalculatorPage(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.chat),
            title: const Text(
              'Financial Blog',
              style: TextStyle(fontSize: 20),
            ),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const BlogFormPage(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.chat),
            title: const Text(
              'Data Pengeluaran',
              style: TextStyle(fontSize: 20),
            ),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const DataPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
