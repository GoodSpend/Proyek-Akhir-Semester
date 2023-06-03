import 'package:flutter/material.dart';
import 'package:goodspend/drawer.dart';

class loanCalculationData {
  static String placeholderAmount = '';
  static String placeholderInterest = '';
  static String placeholderTenor = '';
  static double monthlyPayment = 0;
  static double totalPayment = 0;

  static void calculateMonthlyPayment() {
    calculateTotalPayment();
    monthlyPayment = totalPayment / (double.parse(placeholderTenor) * 12);
  }

  static void calculateTotalPayment() {
    totalPayment = double.parse(placeholderAmount) + (double.parse(placeholderAmount) * (double.parse(placeholderInterest) / 100));
  }
}

class LoanCalculatorPage extends StatefulWidget {
    const LoanCalculatorPage({super.key});
    @override
    State<LoanCalculatorPage> createState() => _LoanCalculatorPageState();
}

class _LoanCalculatorPageState extends State<LoanCalculatorPage> {
  final _formKey = GlobalKey<FormState>();
  loanCalculationData data = loanCalculationData();

  @override
  void initState() {
    super.initState();
  }

  @override
    Widget build(BuildContext context) {
        return Scaffold(
          backgroundColor: Color.fromRGBO(51, 51, 51, 1),
            appBar: AppBar(
                title: Text('Loan Calculator'),
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
                                style: TextStyle(color:Color.fromRGBO(254, 254, 226, 1)),
                                  decoration: InputDecoration(
                                      hintText: "Kurs dalam Rupiah, isi dengan nominal",
                                      labelText: "Loan Amount",
                                      hintStyle: TextStyle(color:Color.fromRGBO(254, 254, 226, 1)),
                                      labelStyle: TextStyle(color:Color.fromRGBO(127, 195, 126, 1)),
                                      icon: const Icon(Icons.calculate),
                                      iconColor: Color.fromRGBO(127, 195, 126, 1),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(5.0),
                                          borderSide: BorderSide(color: Color.fromRGBO(127, 195, 126, 1), width: 0.5),
                                      ),
                                  ),
                                  onChanged: (String? value) {
                                      setState(() {
                                          loanCalculationData.placeholderAmount = value!;
                                      });
                                  },
                                  validator: (String? value) {
                                      if (value == null || value.isEmpty) {
                                          return 'Amount tidak boleh kosong!';
                                      }
                                      return null;
                                    },
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                style: TextStyle(color:Color.fromRGBO(254, 254, 226, 1)),
                                  decoration: InputDecoration(
                                      hintText: "Dalam persentase, isi dengan nominal",
                                      labelText: "Annual Interest",
                                      hintStyle: TextStyle(color:Color.fromRGBO(254, 254, 226, 1)),
                                      labelStyle: TextStyle(color:Color.fromRGBO(127, 195, 126, 1)),
                                      icon: const Icon(Icons.percent),
                                      iconColor: Color.fromRGBO(127, 195, 126, 1),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(5.0),
                                          borderSide: BorderSide(color: Color.fromRGBO(127, 195, 126, 1), width: 0.5),
                                      ),
                                  ),
                                  onChanged: (String? value) {
                                      setState(() {
                                          loanCalculationData.placeholderInterest = value!;
                                      });
                                  },
                                  validator: (String? value) {
                                      if (value == null || value.isEmpty) {
                                          return 'Interest tidak boleh kosong!';
                                      }
                                      return null;
                                    },
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                style: TextStyle(color:Color.fromRGBO(254, 254, 226, 1)),
                                  decoration: InputDecoration(
                                      hintText: "Dalam tahun, isi dengan nominal",
                                      labelText: "Tenor",
                                      hintStyle: TextStyle(color:Color.fromRGBO(254, 254, 226, 1)),
                                      labelStyle: TextStyle(color:Color.fromRGBO(127, 195, 126, 1)),
                                      icon: const Icon(Icons.calendar_month),
                                      iconColor: Color.fromRGBO(127, 195, 126, 1),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(5.0),
                                          borderSide: BorderSide(color: Color.fromRGBO(127, 195, 126, 1), width: 0.5),
                                      ),
                                  ),
                                  onChanged: (String? value) {
                                      setState(() {
                                          loanCalculationData.placeholderTenor = value!;
                                      });
                                  },
                                  validator: (String? value) {
                                      if (value == null || value.isEmpty) {
                                          return 'Tenor tidak boleh kosong!';
                                      }
                                      return null;
                                    },
                            ),
                          ),
                          SizedBox(height: 10),
                          Center(
                            child: TextButton(
                              child: const Text(
                                "Calculate",
                                style: TextStyle(color: Color.fromRGBO(51, 51, 51, 1)),
                              ),
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(Color.fromRGBO(127, 195, 126, 1)),
                              ),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  loanCalculationData.calculateMonthlyPayment();
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return Dialog(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        backgroundColor: Color.fromRGBO(51, 51, 51, 1),
                                        elevation: 15,
                                        child: Container(
                                          color: Color.fromRGBO(51, 51, 51, 1),
                                          child: ListView(
                                            padding: const EdgeInsets.only(top: 20, bottom: 20),
                                            shrinkWrap: true,
                                            children: <Widget>[
                                              Center(child: const Text('Calculated Loan Details', style: TextStyle(color:Color.fromRGBO(127, 195, 126, 1)))),
                                              SizedBox(height: 20),
                                              Text(
                                                "Loan Amount : Rp" + loanCalculationData.placeholderAmount
                                                + "\n Annual Interest : " + loanCalculationData.placeholderInterest + "%"
                                                + "\n Tenor : " + loanCalculationData.placeholderTenor + " Tahun"
                                                + "\n Monthly Payment : Rp" + loanCalculationData.monthlyPayment.toString() + "/Bulan"
                                                + "\n Total Payment : Rp" + loanCalculationData.totalPayment.toString(),
                                                textAlign: TextAlign.center,
                                                style: TextStyle(color:Color.fromRGBO(254, 254, 226, 1)),
                                              ),
                                              SizedBox(height: 20),
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text('Back', style: TextStyle(color:Color.fromRGBO(127, 195, 126, 1))),
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
                          )
                        ],
                  ),
                ),
                ),
            ),
          )
        );
    }
}