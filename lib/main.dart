import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
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
  String _output = '0';
  String _input = '';
  String _operation = '';
  double _num1 = 0;
  double _num2 = 0;

  void _buttonPressed(String value) {
    setState(() {
      if (value == 'C') {
        _input = '';
        _output = '0';
        _num1 = 0;
        _num2 = 0;
        _operation = '';
        
      } else if (value == '+' || value == '-' || value == '*' || value == '/') {
        _num1 = double.tryParse(_input) ?? 0;
        _operation = value;
        _input = '';
      } else if (value == '=') {
        _num2 = double.tryParse(_input) ?? 0;
        if (_operation == '+') {
          _output = (_num1 + _num2).toString();
        } else if (_operation == '-') {
          _output = (_num1 - _num2).toString();
        } else if (_operation == '*') {
          _output = (_num1 * _num2).toString();
        } else if (_operation == '/') {
          _output = (_num1 / _num2).toString();
        }
        _input = _output;
        _operation = '';
      } else {
        _input += value;
        _output = _input;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.all(20.0),
              child: Text(
                _output,
                style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Row(
            children: [
              _buildButton('7'),
              _buildButton('8'),
              _buildButton('9'),
              _buildButton('/'),
            ],
          ),
          Row(
            children: [
              _buildButton('4'),
              _buildButton('5'),
              _buildButton('6'),
              _buildButton('*'),
            ],
          ),
          Row(
            children: [
              _buildButton('1'),
              _buildButton('2'),
              _buildButton('3'),
              _buildButton('-'),
            ],
          ),
          Row(
            children: [
              _buildButton('C'),
              _buildButton('0'),
              _buildButton('='),
              _buildButton('+'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildButton(String value) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: ElevatedButton(
          onPressed: () => _buttonPressed(value),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(24.0),
            textStyle: const TextStyle(fontSize: 20),
          ),
          child: Text(value),
        ),
      ),
    );
  }
}
