import 'package:flutter/material.dart';
import 'package:goodspend/pages/landing_page.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

void main() {
  runApp(const GoodSpendApp());
}

class GoodSpendApp extends StatelessWidget {
  const GoodSpendApp({Key? key}) : super(key: key);

  @override
    Widget build(BuildContext context) {
        return Provider(
            create: (_) {
                CookieRequest request = CookieRequest();
                return request;
            },
            child: MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'GoodSpend',
                theme: ThemeData(
                    primarySwatch: Colors.lightGreen,
                    appBarTheme: AppBarTheme(
                    iconTheme: IconThemeData(color: Color.fromRGBO(254, 254, 226, 1)),
                    color: Color.fromRGBO(254, 254, 226, 1),
                    foregroundColor: Color.fromRGBO(254, 254, 226, 1),
                  ),
                ),
                home: const LandingPage(title: 'GoodSpend'),
            ),
        );
    }
}
