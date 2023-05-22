import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class KonversiUang extends StatefulWidget {
  const KonversiUang({Key key}) : super(key: key);

  @override
  State<KonversiUang> createState() => _KonversiUangState();
}

class _KonversiUangState extends State<KonversiUang> {
  double input;
  double output;
  String currencyInput;
  String currencyOutput;
  String result;
  TextEditingController inputController = TextEditingController();

  void onInputChanged(String value) {
    setState(() {
      input = double.tryParse(value.replaceAll(',', '')) ?? 0;
    });
  }

  void onCurrencyInputChanged(String value) {
    setState(() {
      currencyInput = value ?? 'IDR';
    });
  }

  void onCurrencyOutputChanged(String value) {
    setState(() {
      currencyOutput = value ?? 'IDR';
    });
  }

  void convert() {
    setState(() {
      switch (currencyInput) {
        case 'IDR':
          switch (currencyOutput) {
            case 'IDR':
              output = input;
              break;
            case 'USD':
              output = input / 14200;
              break;
            case 'EUR':
              output = input / 17000;
              break;
          }
          break;
        case 'USD':
          switch (currencyOutput) {
            case 'IDR':
              output = input * 14200;
              break;
            case 'USD':
              output = input;
              break;
            case 'EUR':
              output = input * 0.85;
              break;
          }
          break;
        case 'EUR':
          switch (currencyOutput) {
            case 'IDR':
              output = input * 17000;
              break;
            case 'USD':
              output = input * 1.17;
              break;
            case 'EUR':
              output = input;
              break;
          }
          break;
      }
      result = _formatNumber(output, 2);
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          height: size.height,
          width: size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 350,
                child: RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      text: 'Konversi Uang',
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1.4,
                    child: TextField(
                      onChanged: onInputChanged,
                      controller: inputController,
                      keyboardType: TextInputType.numberWithOptions(decimal: true),
                      style: const TextStyle(fontSize: 18, color: Colors.white),
                      decoration: const InputDecoration(
                        filled: true,
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          color: Colors.white
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                            color: Color.fromARGB(255, 110, 106, 106),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  DropdownButton(
                    value: currencyInput,
                    items: const <String>['IDR', 'USD', 'EUR']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: const TextStyle(
                            fontSize: 20, 
                            color: Color.fromARGB(255, 61, 58, 58)),
                        ),
                      );
                    }).toList(),
                    onChanged: onCurrencyInputChanged,
                  )
                ],
              ),
              const SizedBox(height: 12),
              const SizedBox(height: 12),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color.fromARGB(255, 61, 58, 58)),
                      borderRadius: BorderRadius.circular(6),
                      color: Colors.white,
                    ),
                    width: MediaQuery.of(context).size.width / 1.4,
                    height: 55,
                    child: Text(
                      result ?? '',
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  DropdownButton(
                    value: currencyOutput,
                    items: const <String>['IDR', 'USD', 'EUR']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: const TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 61, 58, 58)
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: onCurrencyOutputChanged,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: convert,
                child: const Text(
                  'C O N V E R T',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatNumber(double number, int fractionDigits) {
    final format = NumberFormat.currency(
      decimalDigits: fractionDigits,
      symbol: '',
    );
    return format.format(number).replaceAll(',', '.');
  }
}
