import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_list/the-list.dart';

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
          //THE HEADER
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
                        TextButton(
                          onPressed: () {
                            print('Btn Pressed');
                          },
                          child: const Text(
                            'START',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                          style: TextButton.styleFrom(
                            backgroundColor: const Color(0xFF1C1D2F),
                            minimumSize: const Size(35, 35),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            print('Add Btn Pressed');
                          },
                          child: const Icon(
                            CupertinoIcons.add,
                            color: Colors.white,
                            size: 25,
                          ),
                          //Text('+', style: TextStyle(color: Colors.white,fontSize: 20,)),
                          style: TextButton.styleFrom(
                            backgroundColor: const Color(0xFF1C1D2F),
                            padding: EdgeInsets.zero,
                            minimumSize: const Size(35, 35),
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )),

          //THE LIST
          Expanded(
            child: ListView.builder(
              itemCount: TheList.theList.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10),
                  child: Container(
                    decoration: const BoxDecoration(border: Border(bottom: BorderSide(width: 1.0, color: Colors.black38),)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width:40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black38,width: 1.0),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: FadeInImage(
                                      placeholder: AssetImage('images/placeholder.png'),
                                      image: AssetImage('images/placeholder.png'),
                                      // image: NetworkImage(widget.favIcon)
                                    ),
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(TheList.theList[index].theURL, style: TextStyle(fontSize: 15,),),
                                  Text(TheList.theList[index].theSize, style: TextStyle(fontSize: 10,),),
                                ],
                              )
                            ],
                          ),
                          Container(
                              width:30,
                              height:30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xFF8A8A8A)
                              ),
                              child: Icon(TheList.theList[index].theIcon,color: Colors.white,)),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
