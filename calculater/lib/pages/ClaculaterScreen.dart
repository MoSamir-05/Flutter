import 'package:flutter/material.dart';

class ClaculaterScreen extends StatefulWidget {
  const ClaculaterScreen({super.key});

  @override
  State<ClaculaterScreen> createState() => _ClaculaterScreenState();
}

class _ClaculaterScreenState extends State<ClaculaterScreen> {




final TextEditingController _firstNumberController=TextEditingController();
final TextEditingController _secondNumberController=TextEditingController();
double _result=1;

void _add(){
  
    final firstNumber=double.tryParse(_firstNumberController.text)??0;
    final secondNumber=double.tryParse(_secondNumberController.text)??0;
    setState(() {_result=firstNumber+secondNumber;
  });
}
void _sub(){
  
    final firstNumber=double.tryParse(_firstNumberController.text)??0;
    final secondNumber=double.tryParse(_secondNumberController.text)??0;
    setState(() {_result=firstNumber-secondNumber;
  });
}
void _mul(){
  
    final firstNumber=double.tryParse(_firstNumberController.text)??0;
    final secondNumber=double.tryParse(_secondNumberController.text)??0;
    setState(() {_result=firstNumber*secondNumber;
  });
}
void _div(){
  
    final firstNumber=double.tryParse(_firstNumberController.text)??0;
    final secondNumber=double.tryParse(_secondNumberController.text)??0;
    setState(() {_result=firstNumber/secondNumber;
  });
}







  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SimpleCalculater"),
      ),
      body: Padding(padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: _firstNumberController,
            decoration: InputDecoration(
              labelText:'enter number' ,
            ),
          ),
          SizedBox(height: 30),
          TextField(
            controller: _secondNumberController,
            decoration: InputDecoration(
              labelText: 'enter another number',
            ),
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(onPressed: _add, child: Text('+')),
              ElevatedButton(onPressed: _sub, child: Text('-')),
              ElevatedButton(onPressed: _mul, child: Text('X')),
              ElevatedButton(onPressed: _div, child: Text('/')),
            ],
          ),
          SizedBox(height: 30),
          Text(
            'Result:$_result',
            style: TextStyle(fontSize: 24),
          )
        ],
      ),
      ),
    );
  }
}