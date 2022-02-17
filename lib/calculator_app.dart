import 'package:flutter/material.dart';

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  double _firstNumberInput = 0.0;
  double _secondNumberInput = 0.0;
  bool _numberPressed = false;
  bool _operatorPressed = false;
  double _displayText = 0.0;
  String _currentOperator = '';
  double _result = 0.0;

  void onNumberPressed(double number) {
    setState(() {
      if (!_operatorPressed) {
        _firstNumberInput = _firstNumberInput * 10 + number;
        _numberPressed = true;
        _displayText = _firstNumberInput;
      } else {
        _secondNumberInput = _secondNumberInput * 10 + number;
        _numberPressed = true;
        _displayText = _secondNumberInput;
      }
    });
  }

  void calculate() {
    setState(() {
      _result = 0.0;
      switch (_currentOperator) {
        case '+':
          {
            _result = _firstNumberInput + _secondNumberInput;
            break;
          }
        case '-':
          {
            _result = _firstNumberInput - _secondNumberInput;
            break;
          }
        case 'x':
          {
            _result = _firstNumberInput * _secondNumberInput;
            break;
          }
        case '%': {
            _result = _firstNumberInput % _secondNumberInput;
            break;
          }
        case '/':
          {
            _result = _firstNumberInput / _secondNumberInput;
            break;
          }
      }
      _firstNumberInput = 0.0;
      _secondNumberInput = 0.0;
      _displayText = _result;
      _currentOperator = '';
      _operatorPressed = false;
    });
  }

  void onOperatorPressed(String operator) {
    setState(() {
      _currentOperator = operator;
      _numberPressed = false;
      _operatorPressed = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Calculator App"),
      ),
      body: SafeArea(
        child: Expanded(
          child: Column(
            children: <Widget>[
              Row(
                children: [
                  Expanded(
                    child: Container(
                        color: Colors.blueGrey[100],
                        height: 100.0,
                        child: Text(
                          _displayText.toString(),
                          style: const TextStyle(fontSize: 50.0),
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.end,
                        )),
                  ),
                ],
              ),
              Expanded(
                child: Row(
                    // first symbols row
                    children: <Widget>[
                      Expanded(
                        //clear button
                        child: RawMaterialButton(
                          onPressed: () {
                            setState(() {
                              _firstNumberInput = 0.0;
                              _secondNumberInput = 0.0;
                              _result = 0.0;
                              _displayText = 0.0;
                              _operatorPressed = false;
                              _currentOperator = '';
                            });
                          },
                          child: const Icon(Icons.backspace_outlined),
                          fillColor: Colors.blueGrey[100],
                        ),
                      ),
                      Expanded(
                        //plus or minus button, not to be implemented
                        child: RawMaterialButton(
                            onPressed: () {},
                            child: const Text('+/-',
                                style: TextStyle(fontSize: 30.0))),
                      ),
                      Expanded(
                        child: RawMaterialButton(
                            onPressed: () {
                              onOperatorPressed('%');
                            },
                            child: const Text('%',
                                style: TextStyle(fontSize: 30.0))),
                      ),
                      Expanded(
                        child: RawMaterialButton(
                          onPressed: () {
                            onOperatorPressed('x');
                          },
                          child:
                              const Text('x', style: TextStyle(fontSize: 50.0)),
                        ),
                      ),
                    ]),
              ),
              Expanded(
                child: Row(children: <Widget>[
                  Expanded(
                    child: RawMaterialButton(
                        //number '7'
                        onPressed: () {
                          onNumberPressed(7);
                        },
                        child:
                            const Text('7', style: TextStyle(fontSize: 50.0))),
                  ),
                  Expanded(
                    child: RawMaterialButton(
                        //number '8'
                        onPressed: () {
                          onNumberPressed(8);
                        },
                        child:
                            const Text('8', style: TextStyle(fontSize: 50.0))),
                  ),
                  Expanded(
                    child: RawMaterialButton(
                        //number '9'
                        onPressed: () {
                          onNumberPressed(9);
                        },
                        child:
                            const Text('9', style: TextStyle(fontSize: 50.0))),
                  ),
                  Expanded(
                    child: RawMaterialButton(
                        //symbol '-'
                        onPressed: () {
                          onOperatorPressed('-');
                        },
                        child:
                            const Text('-', style: TextStyle(fontSize: 50.0))),
                  ),
                ]),
              ),
              Expanded(
                child: Row(children: <Widget>[
                  Expanded(
                    child: RawMaterialButton(
                        onPressed: () {
                          onNumberPressed(4);
                        },
                        child:
                            const Text('4', style: TextStyle(fontSize: 50.0))),
                  ),
                  Expanded(
                    child: RawMaterialButton(
                        onPressed: () {
                          onNumberPressed(5);
                        },
                        child:
                            const Text('5', style: TextStyle(fontSize: 50.0))),
                  ),
                  Expanded(
                    child: RawMaterialButton(
                        onPressed: () {
                          onNumberPressed(6);
                        },
                        child:
                            const Text('6', style: TextStyle(fontSize: 50.0))),
                  ),
                  Expanded(
                    child: RawMaterialButton(
                        onPressed: () {
                          onOperatorPressed('+');
                        },
                        child:
                            const Text('+', style: TextStyle(fontSize: 50.0))),
                  ),
                ]),
              ),
              Expanded(
                child: Row(children: <Widget>[
                  Expanded(
                    child: RawMaterialButton(
                        onPressed: () {
                          onNumberPressed(1);
                        },
                        child:
                            const Text('1', style: TextStyle(fontSize: 50.0))),
                  ),
                  Expanded(
                    child: RawMaterialButton(
                        onPressed: () {
                          onNumberPressed(2);
                        },
                        child:
                            const Text('2', style: TextStyle(fontSize: 50.0))),
                  ),
                  Expanded(
                    child: RawMaterialButton(
                        onPressed: () {
                          onNumberPressed(3);
                        },
                        child:
                            const Text('3', style: TextStyle(fontSize: 50.0))),
                  ),
                  Expanded(
                    child: RawMaterialButton(
                      //operator '/'
                      onPressed: () {
                        onOperatorPressed('/');
                      },
                      child: const Text('/', style: TextStyle(fontSize: 50.0)),
                    ),
                  ),
                ]),
              ),
              Expanded(
                child: Row(children: <Widget>[
                  Expanded(
                    child: RawMaterialButton(
                      onPressed: () {},
                    ),
                  ),
                  Expanded(
                    child: RawMaterialButton(
                        onPressed: () {
                          onNumberPressed(0.0);
                        },
                        child:
                            const Text('0', style: TextStyle(fontSize: 50.0))),
                  ),
                  Expanded(
                    child: RawMaterialButton(
                      onPressed: () {},
                    ),
                  ),
                  Expanded(
                    child: RawMaterialButton(
                        onPressed: () {
                           calculate();
                        },
                        child:
                            const Text('=', style: TextStyle(fontSize: 50.0))),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
