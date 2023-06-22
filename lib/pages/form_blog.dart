import 'package:goodspend/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BlogFormPage extends StatefulWidget {
  const BlogFormPage({super.key});

  @override
  State<BlogFormPage> createState() => _BlogFormPageState();
}

class _BlogFormPageState extends State<BlogFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _judulBlog = "";
  String _isiBlog = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(51, 51, 51, 1),
      appBar: AppBar(
        title: Text('Data Pengeluaran'),
        backgroundColor: Color.fromRGBO(127, 195, 126, 1),
        foregroundColor: Color.fromRGBO(51, 51, 51, 1),
      ),
      drawer: DrawerClass(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(children: [
              Padding(
                // Menggunakan padding sebesar 8 pixels
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Master Your Money: Financial Freedom Unleashed!",
                    labelText: "Judul Blog",
                    hintStyle:
                        TextStyle(color: Color.fromRGBO(254, 254, 226, 1)),
                    labelStyle:
                        TextStyle(color: Color.fromRGBO(127, 195, 126, 1)),

                    // Menambahkan icon agar lebih intuitif
                    icon: const Icon(Icons.edit_note),
                    // Menambahkan circular border agar lebih rapi
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  // Menambahkan behavior saat nama diketik
                  onChanged: (String? value) {
                    setState(() {
                      _judulBlog = value!;
                    });
                  },
                  // Menambahkan behavior saat data disimpan
                  onSaved: (String? value) {
                    setState(() {
                      _judulBlog = value!;
                    });
                  },
                  // Validator sebagai validasi form
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Judul blog tidak boleh kosong!';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                // Menggunakan padding sebesar 8 pixels
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Spread your words!",
                    labelText: "Isi Blog",
                    hintStyle:
                        TextStyle(color: Color.fromRGBO(254, 254, 226, 1)),
                    labelStyle:
                        TextStyle(color: Color.fromRGBO(127, 195, 126, 1)),
                    // Menambahkan icon agar lebih intuitif
                    icon: const Icon(Icons.notes),
                    // Menambahkan circular border agar lebih rapi
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  // Menambahkan behavior saat nama diketik
                  onChanged: (String? value) {
                    setState(() {
                      _isiBlog = value!;
                    });
                  },
                  // Menambahkan behavior saat data disimpan
                  onSaved: (String? value) {
                    setState(() {
                      _isiBlog = value!;
                    });
                  },
                  // Validator sebagai validasi form
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Isi blog tidak boleh kosong!';
                    }
                    return null;
                  },
                ),
              ),
              TextButton(
                child: const Text(
                  "Tambah",
                  style: TextStyle(color: Colors.white),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 15,
                          child: Container(
                            child: ListView(
                              padding:
                                  const EdgeInsets.only(top: 20, bottom: 20),
                              shrinkWrap: true,
                              children: <Widget>[
                                Center(
                                    child: const Text(
                                        'Blog berhasil ditambahkan!')),
                                SizedBox(height: 20),
                                Text('    Judul Blog : $_judulBlog'),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('Kembali'),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
