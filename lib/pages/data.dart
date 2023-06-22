import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:goodspend/pages/landing_page.dart';
import 'package:goodspend/drawer.dart';

class DataPage extends StatefulWidget {
  const DataPage({super.key});

  @override
  State<DataPage> createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  final _formKey = GlobalKey<FormState>();
  String _namaPengeluaran = "";
  String tipePengeluaran = 'Tagihan';
  List<String> listTipePengeluaran = ['Tagihan', 'Pinjaman'];
  double jumlahPengeluaran = 0;
  String _deadlinePengeluaran = "";
  String _deskripsiPengeluaran = "";

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
            child: Column(
              children: [
                Padding(
                  // Menggunakan padding sebesar 8 pixels
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    style: TextStyle(color: Color.fromRGBO(254, 254, 226, 1)),
                    decoration: InputDecoration(
                      hintText: "Contoh: Tagihan UKT",
                      labelText: "Nama Pengeluaran",
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
                        _namaPengeluaran = value!;
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        _namaPengeluaran = value!;
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Nama Pengeluaran tidak boleh kosong!';
                      }
                      return null;
                    },
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.class_),
                  title: const Text(
                    'Tipe Pengeluaran:',
                  ),
                  titleTextStyle: TextStyle(
                    color: Color.fromRGBO(254, 254, 226, 1),
                  ),
                  trailing: DropdownButton(
                    value: tipePengeluaran,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: listTipePengeluaran.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        tipePengeluaran = newValue!;
                      });
                    },
                  ),
                ),
                Padding(
                  // Menggunakan padding sebesar 8 pixels
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: InputDecoration(
                      hintText: "Contoh: 1000000",
                      labelText: "Jumlah Pengeluaran",
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
                    // Menambahkan behavior saat jumlah diketik
                    onChanged: (String? value) {
                      setState(() {
                        jumlahPengeluaran = double.parse(value!);
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        jumlahPengeluaran = double.parse(value!);
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Jumlah Pengeluaran tidak boleh kosong!';
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
                      hintText: "Contoh: 18 Maret 2024",
                      labelText: "Deadline Pengeluaran",
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
                        _deadlinePengeluaran = value!;
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        _deadlinePengeluaran = value!;
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Deadline Pengeluaran tidak boleh kosong!';
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
                      hintText: "Contoh: Tagihan Semester 10!",
                      labelText: "Deskripsi Pengeluaran",
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
                        _deskripsiPengeluaran = value!;
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        _deskripsiPengeluaran = value!;
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Deskripsi Pengeluaran tidak boleh kosong!';
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
                                  Center(child: const Text('Informasi Data')),
                                  SizedBox(height: 20),
                                  // TODO: Munculkan informasi yang didapat dari form
                                  Text('Nama Pengeluaran: $_namaPengeluaran'),
                                  Text('Tipe Pengeluaran: $tipePengeluaran'),
                                  Text(
                                      'Jumlah Pengeluaran: $jumlahPengeluaran'),
                                  Text(
                                      'Deadline Pengeluaran: $_deadlinePengeluaran'),
                                  Text(
                                      'Deskripsi Pengeluaran: $_deskripsiPengeluaran'),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const LandingPage(
                                              title: "Data Pengeluaran",
                                            ),
                                          ));
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
