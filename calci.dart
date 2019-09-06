# See https://www.dartlang.org/guides/libraries/private-files

# Files and directories created by pub
.dart_tool/
.packages
.pub/
build/
# If you're building an application, you may want to check-in your pubspec.lock
pubspec.lock

# Directory created by dartdoc
# If you don't generate documentation locally you can remove this line.
doc/api/
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: 'CALCULATOR',
      theme: new ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: new MyHomePage(title: 'Mann Says HII!!!'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String output = '0';

  String _output = '0';
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = '';

  buttonPressed(String buttonText) {


    if (buttonText == 'CLEAR') {
       _output = '0';
       num1 = 0.0;
       num2 = 0.0;
       operand = '';
    }


    else if (buttonText == '+' || buttonText == '-' || buttonText == '/' ||
        buttonText == 'X') {
      num1 = double.parse(output);
      operand = buttonText;
      _output = '0';
    }


    else if (buttonText == '.') {
      if (_output.contains('.')) {
        print('Already contains a decimalpoint');
        return;
      }
    }

      else if (buttonText == '=') {
        num2 = double.parse(output);
        if (operand == '+') {
          _output = (num1 + num2).toString();
        }
        if (operand == '-') {
          _output = (num1 - num2).toString();
        }
        if (operand == 'X') {
          _output = (num1 * num2).toString();
        }
        if (operand == '/') {
          _output = (num1 / num2).toString();
        }
        num1 = 0.0;
        num2 = 0.0;
        operand = '';
      }


      else {
        _output = _output + buttonText;
      }
      print(_output);
      setState(() {
        output = double.parse(_output).toStringAsFixed(2);
      });
    }

    Widget buildButton(String buttonText) {
      return Expanded(
          child: new OutlineButton(
            padding: EdgeInsets.all(24.0),
            child: new Text(buttonText,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                )),
            onPressed: () => buttonPressed(buttonText),
            //  color: Colors.black,
            // textColor: Colors.white,
          ));
    }

    @override
    Widget build(BuildContext context) {
      return new Scaffold(
          appBar: new AppBar(
            title: new Text(widget.title),
          ),
          body: new Container(
              child: Column(children: <Widget>[
                Container(
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.symmetric(
                      vertical: 24.0,
                      horizontal: 12.0,
                    ),
                    child: new Text(
                      output,
                      style: TextStyle(
                        fontSize: 82.0,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                Expanded(
                  child: Divider(),
                ),
                Column(children: [
                  Row(children: [
                    buildButton('7'),
                    buildButton('8'),
                    buildButton('9'),
                    buildButton('/'),
                  ]),
                  Row(children: [
                    buildButton('4'),
                    buildButton('5'),
                    buildButton('6'),
                    buildButton('X'),
                  ]),
                  Row(children: [
                    buildButton('1'),
                    buildButton('2'),
                    buildButton('3'),
                    buildButton('-'),
                  ]),
                  Row(children: [
                    buildButton('.'),
                    buildButton('0'),
                    buildButton('00'),
                    buildButton('+'),
                  ]),
                  Row(children: [
                    buildButton('CLEAR'),
                    buildButton('='),
                  ]),
                ])
              ])));
    }
  }


