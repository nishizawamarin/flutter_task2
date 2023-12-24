import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}



class _MyHomePageState extends State<MyHomePage> {


   int _counter =0;
   int _number =0;
   int _result = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('calculator'),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 150,
                    child: TextField(
                     keyboardType: TextInputType.number,
                     inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      onChanged: (value) {
                        setState(() {
                          _counter = int.tryParse(value) ?? 0;
                        });
                      },
                     decoration: const InputDecoration(
                       border: OutlineInputBorder(),
                     ),
             ),
                  ),
                  SizedBox(
                    width: 150,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      onChanged: (value) {
                        setState(() {
                          _number = int.tryParse(value) ?? 0;
                        });
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Text('結果:$_result',),
                  
                ],
              ),

              const SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: (){
                      setState(() {
                        _result=_counter+_number;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(10),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))
                    ),
                    child: const Icon(Icons.add,size: 15,),
                  ),
                  const SizedBox(width: 20,),
                  ElevatedButton(
                    onPressed: (){
                      setState(() {
                       _result= _counter-_number;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(10),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))
                    ),
                    child:  const Icon(Icons.remove,size: 15,),
                  ),
                  const SizedBox(width: 20,),
                  ElevatedButton(
                    onPressed: (){
                      setState(() {
                        _result=_counter*_number;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(10),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))
                    ),
                    child: const Icon(Icons.close,size: 15,),
                  ),
                  const SizedBox(width: 20,),
                  ElevatedButton(
                    onPressed: (){
                      setState(() {
                        if (_number != 0) {
                          _result = _counter ~/ _number;
                        } else {
                          // Handle division by zero
                          _result = 0;
                        }
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(10),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))
                    ),
                    child: const Text('÷'),
                  ),
                ],
              ),
            ],
          ),
      ),
    );
  }
}