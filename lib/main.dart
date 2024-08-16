import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
//helloworld
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String output = "";
  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";
  @override
  Widget build(BuildContext context) {
    operations(String value) {
      if (value == "CLEAR") {
        _output = "0";
        num1 = 0.0;
        num2 = 0.0;
        operand = "";
      } else if (value == "+" || value == "-" || value == "*" || value == "/") {
        num1 = double.parse(output);
        operand = value;
        _output = "0";
      } else if (value == ".") {
        if (_output.contains(".")) {
          // ignore: avoid_print
          print("Already Contains Decimal");
          return;
        } else {
          _output = _output + value;
        }
      } else if (value == "=") {
        num2 = double.parse(output);
        if (operand == "+") {
          _output = (num1 + num2).toString();
        }
        if (operand == "-") {
          _output = (num1 - num2).toString();
        }
        if (operand == "*") {
          _output = (num1 * num2).toString();
        }
        if (operand == "/") {
          _output = (num1 / num2).toString();
        }
        num1 = 0.0;
        num2 = 0.0;
        operand = "";
      } else {
        _output = _output + value;
      }
      setState(() {
        output = double.parse(_output).toStringAsFixed(2);
      });
    }

    Widget button(String buttonText) {
      return Expanded(
        child: OutlinedButton(
          onPressed: () {
            operations(buttonText);
          },
          style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
              const EdgeInsets.all(24.0),
            ),
          ),
          child: Text(
            buttonText,
            style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
        ),
      );
    }


    return Scaffold(
        appBar: AppBar(
          
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
         
          title: const Text("Calculator App"),
        ),
        
        body: Container(
            child: Column(children: [
          Container(
            alignment: Alignment.centerRight,
            padding:
                const EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
           
            child: Text(
              output,
              style:
                  const TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
            ),
          ),
          const Expanded(child: Divider()),
          Column(
            children: [
              Row(
                children: [
                  button("7"),
                  button("8"),
                  button("9"),
                  button("/"),
                ],
              ),
              Row(
                children: [
                  button("4"),
                  button("5"),
                  button("6"),
                  button("*"),
                ],
              ),
              Row(
                children: [
                  button("1"),
                  button("2"),
                  button("3"),
                  button("-"),
                ],
              ),
              Row(
                children: [
                  button("."),
                  button("0"),
                  button("00"),
                  button("+"),
                ],
              ),
              Row(
                children: [
                  button("CLEAR"),
                  button("="),
                ],
              )
            ],
          )
        ])));
  }
}
