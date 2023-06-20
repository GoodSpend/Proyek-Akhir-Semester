// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../model/News.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:goodspend/utility/fetch_news.dart';
import 'package:goodspend/drawer.dart';
import '../model/global.dart' as global;
import 'edit_financial_news.dart';

class FinancialNews extends StatefulWidget {
  const FinancialNews({Key? key}) : super(key: key);

  @override
  State<FinancialNews> createState() => _FinancialNewsState();
}

class _FinancialNewsState extends State<FinancialNews> {
  String lastcall = "fetchNews";

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
        backgroundColor: Color.fromRGBO(51, 51, 51, 1),
        appBar: AppBar(
          title: const Text('Financial News'),
          backgroundColor: Color.fromRGBO(127, 195, 126, 1),
          foregroundColor: Color.fromRGBO(51, 51, 51, 1),
        ),
        drawer: DrawerClass(),
        body: Column(
          children: [
            Expanded(
                child: FutureBuilder(
                    future: fetchNews(),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.data == null) {
                        return const Center(child: CircularProgressIndicator());
                      } else {
                        if (snapshot.data.length == 0) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                "Oops, nggak ada transaksi yang sesuai filter",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 6, 72, 254),
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 8),
                            ],
                          );
                        } else {
                          return ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (_, index) => Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 12),
                              padding: const EdgeInsets.all(20.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                border: Border.all(
                                  color: Color.fromRGBO(127, 195, 126, 1),
                                  width: 1,
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ListTile(
                                    subtitle: Column(
                                      children: [
                                        Text(
                                            '${snapshot.data![index].fields.title} (${DateFormat('yyyy-MM-dd').format(snapshot.data![index].fields.publish_date)})',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromRGBO(
                                                    254, 254, 226, 1))),
                                        Text(
                                          'Oleh: ${snapshot.data![index].fields.author}',
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  254, 254, 226, 1)),
                                        ),
                                        Text(
                                          '${snapshot.data![index].fields.content}',
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  254, 254, 226, 1)),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            TextButton(
                                              onPressed: () {
                                                global.newsTitle = snapshot
                                                    .data![index].fields.title;
                                                global.newsAuthor = snapshot
                                                    .data![index].fields.author;
                                                global.newsContent = snapshot
                                                    .data![index]
                                                    .fields
                                                    .content;
                                                global.newsDate = snapshot
                                                    .data![index]
                                                    .fields
                                                    .publish_date;
                                                global.newsPk =
                                                    snapshot.data![index].pk;
                                                Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute<void>(
                                                    builder: (BuildContext
                                                            context) =>
                                                        const EditFinancialNews(),
                                                  ),
                                                );
                                              },
                                              child: const Text(
                                                "Edit",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                  Color.fromRGBO(
                                                      127, 195, 126, 1),
                                                ),
                                              ),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                deleteNews(
                                                    snapshot.data![index].pk);
                                                setState(() {});
                                              },
                                              child: const Text(
                                                "Delete",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                  Color.fromRGBO(
                                                      243, 108, 24, 1),
                                                ),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }
                      }
                    }))
          ],
        ));
  }
}
