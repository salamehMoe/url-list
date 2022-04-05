import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'URL List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'URL List'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
              height: 100,
              color: const Color(0xFFE0E0E0),
              child: Padding(
                padding: const EdgeInsets.only(top: 40.0, left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Links',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        color: Color(0xFF1C1D2F),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                       TextButton(onPressed: (){
                         print('Btn Pressed');
                       }, child: const Text('START',style: TextStyle(color: Colors.white,fontSize: 12,),),style: TextButton.styleFrom(
                         backgroundColor: const Color(0xFF1C1D2F),
                         minimumSize: const Size(35, 35),
                         shape: const RoundedRectangleBorder(
                           borderRadius: BorderRadius.all(Radius.circular(10.0),
                           ),

                         ),
                       ),),
                        TextButton(onPressed: (){
                          print('Add Btn Pressed');
                        }, child:const Icon(CupertinoIcons.add,color: Colors.white,size: 25,),//Text('+', style: TextStyle(color: Colors.white,fontSize: 20,)),
                          style: TextButton.styleFrom(
                          backgroundColor: const Color(0xFF1C1D2F),
                            padding: EdgeInsets.zero,
                            minimumSize: const Size(35, 35),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          ),

                        ),),
                      ],
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
