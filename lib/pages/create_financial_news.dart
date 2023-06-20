import 'package:flutter/material.dart';
import 'package:goodspend/drawer.dart';
import 'package:goodspend/utility/fetch_news.dart';

class CreateFinancialNews extends StatefulWidget {
  const CreateFinancialNews({super.key});
  @override
  State<CreateFinancialNews> createState() => _CreateFinancialNewsState();
}

class _CreateFinancialNewsState extends State<CreateFinancialNews> {
  String _title = '';
  String _content = '';
  String _author = '';
  String _tanggal = '';
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(51, 51, 51, 1),
        appBar: AppBar(
          title: const Text('Create Financial News'),
          backgroundColor: Color.fromRGBO(127, 195, 126, 1),
          foregroundColor: Color.fromRGBO(51, 51, 51, 1),
        ),
        drawer: DrawerClass(),
        body: Center(
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(20.0),
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(color: Color.fromRGBO(127, 195, 126, 1)),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        style:
                            TextStyle(color: Color.fromRGBO(254, 254, 226, 1)),
                        decoration: InputDecoration(
                          hintText: "Berikan judul yang menarik",
                          labelText: "Title:",
                          hintStyle: TextStyle(
                              color: Color.fromRGBO(254, 254, 226, 1)),
                          labelStyle: TextStyle(
                              color: Color.fromRGBO(127, 195, 126, 1)),
                          icon: const Icon(Icons.text_fields),
                          iconColor: Color.fromRGBO(127, 195, 126, 1),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: BorderSide(
                                color: Color.fromRGBO(127, 195, 126, 1),
                                width: 0.5),
                          ),
                        ),
                        onChanged: (String? value) {
                          setState(() {
                            _title = value!;
                          });
                        },
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'judul tidak boleh kosong!';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
                        style:
                            TextStyle(color: Color.fromRGBO(254, 254, 226, 1)),
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 200.0),
                          hintText: "Tulis berita",
                          labelText: "Content:",
                          hintStyle: TextStyle(
                              color: Color.fromRGBO(254, 254, 226, 1)),
                          labelStyle: TextStyle(
                              color: Color.fromRGBO(127, 195, 126, 1)),
                          icon: const Icon(Icons.text_snippet_rounded),
                          iconColor: Color.fromRGBO(127, 195, 126, 1),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: BorderSide(
                                color: Color.fromRGBO(127, 195, 126, 1),
                                width: 0.5),
                          ),
                        ),
                        onChanged: (String? value) {
                          setState(() {
                            _content = value!;
                          });
                        },
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Berita tidak boleh kosong!';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        style:
                            TextStyle(color: Color.fromRGBO(254, 254, 226, 1)),
                        decoration: InputDecoration(
                          hintText: "Tulis nama penulis disini",
                          labelText: "Author:",
                          hintStyle: TextStyle(
                              color: Color.fromRGBO(254, 254, 226, 1)),
                          // ignore: prefer_const_constructors
                          labelStyle: TextStyle(
                              color: Color.fromRGBO(127, 195, 126, 1)),
                          icon: const Icon(Icons.person),
                          iconColor: Color.fromRGBO(127, 195, 126, 1),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: BorderSide(
                                color: Color.fromRGBO(127, 195, 126, 1),
                                width: 0.5),
                          ),
                        ),
                        onChanged: (String? value) {
                          setState(() {
                            _author = value!;
                          });
                        },
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Nama penulis tidak boleh kosong!';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        style:
                            TextStyle(color: Color.fromRGBO(254, 254, 226, 1)),
                        decoration: InputDecoration(
                          hintText: "Format tanggal: DD/MM/YYYY",
                          labelText: "Tanggal:",
                          hintStyle: TextStyle(
                              color: Color.fromRGBO(254, 254, 226, 1)),
                          // ignore: prefer_const_constructors
                          labelStyle: TextStyle(
                              color: Color.fromRGBO(127, 195, 126, 1)),
                          icon: const Icon(Icons.calendar_month),
                          iconColor: Color.fromRGBO(127, 195, 126, 1),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: BorderSide(
                                color: Color.fromRGBO(127, 195, 126, 1),
                                width: 0.5),
                          ),
                        ),
                        onChanged: (String? value) {
                          setState(() {
                            _tanggal = value!;
                          });
                        },
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'tanggal tidak boleh kosong!';
                          }
                          // Format validation using regular expression
                          RegExp dateRegex = RegExp(r'^\d{2}/\d{2}/\d{4}$');
                          if (!dateRegex.hasMatch(value)) {
                            return 'Format tanggal harus DD/MM/YYYY!';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: 10),
                    Center(
                      child: TextButton(
                        child: const Text(
                          "Create News",
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Color.fromRGBO(127, 195, 126, 1),
                          ),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            // Form is valid, perform the desired action
                            addNews(_title, _content, _author, _tanggal);
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const CreateFinancialNews()),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
