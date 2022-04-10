import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_list/the-list.dart';
import 'package:url_list/url-cell.dart';
import 'package:http/http.dart' as http;

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
  String theTextBoxValue = '';
  ImageProvider theWebIcon = const AssetImage('images/placeholder.png');
  Color theColor = const Color(0xFF8A8A8A);
  int theContentLengthInBytes = 0;
  bool isStart = true;
  bool isReset = false;
  String btnText = 'Processing';

  //Function for HTTP GET and updating the UI Accordingly
  Future startTheUrlProcessing(int index) async {
    var url = Uri.parse(TheList.theList[index].theURL);
    if (!(TheList.theList[index].theURL).contains('http')) {
      setState(() {
        TheList.theList[index].sizeColor = Colors.redAccent;
        TheList.theList[index].theIcon = CupertinoIcons.checkmark_alt;
        TheList.theList[index].doneIconColor = Colors.redAccent;
        TheList.theList[index].isFinishedProcessing = true;
        TheList.theList[index].dissmissDirection = DismissDirection.none;
      });
      return;
    }
    var response = await http.get(url);
    if (response.statusCode == 200) {
      if (response.headers['content-length'] != null) {
        theContentLengthInBytes =
            int.parse(response.headers['content-length'] ?? "");
      }
      int theContentLengthInKB = (theContentLengthInBytes ~/ 1000).toInt();

      setState(() {
        if (response.statusCode != 200) {
          TheList.theList[index].theSize = 'ERROR ${response.statusCode}';
          TheList.theList[index].sizeColor = Colors.redAccent;
          TheList.theList[index].theIcon = CupertinoIcons.checkmark_alt;
          TheList.theList[index].doneIconColor = Colors.redAccent;
          TheList.theList[index].isFinishedProcessing = true;
          TheList.theList[index].dissmissDirection = DismissDirection.none;
        } else if (response.statusCode == 200) {
          TheList.theList[index].theSize = 'Size: ${theContentLengthInKB}KB';
          TheList.theList[index].theIcon = CupertinoIcons.checkmark_alt;
          TheList.theList[index].doneIconColor = Colors.greenAccent;
          TheList.theList[index].isFinishedProcessing = true;
          TheList.theList[index].dissmissDirection = DismissDirection.none;
        }
      });
    } else if (response.statusCode != 200) {
      setState(() {
        TheList.theList[index].theSize = 'ERROR ${response.statusCode}';
        TheList.theList[index].sizeColor = Colors.redAccent;
        TheList.theList[index].theIcon = CupertinoIcons.checkmark_alt;
        TheList.theList[index].doneIconColor = Colors.redAccent;
        TheList.theList[index].isFinishedProcessing = true;
        TheList.theList[index].dissmissDirection = DismissDirection.none;
      });
    }
  }

  //Function for reordering the list on Drag
  void reorderData(int oldindex, int newindex) {
    if (!TheList.theList[oldindex].isFinishedProcessing) {
      setState(() {
        if (newindex > oldindex) {
          newindex -= 1;
        }
        final items = TheList.theList.removeAt(oldindex);
        TheList.theList.insert(newindex, items);
      });
    } else if (TheList.theList[oldindex].isFinishedProcessing) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: const Text(
                  'Can\'t reorder while Processing has finished',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                actions: [
                  TextButton(
                    child: const Text('OK'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              ));
    }
  }
  //Function for resetting the urls to default
  void resetList() {
    setState(() {
      // TheList.theList = [];
      TheList.theList = [
        URLCell(
          theURL: 'https://www.apple.com',
          theSize: 'Unknown Size',
          theIcon: CupertinoIcons.bars,
          favIcon: AssetImage('images/placeholder.png'),
          sizeColor: Color(0xFF8A8A8A),
          doneIconColor: Color(0xFF8A8A8A),
          isFinishedProcessing: false,
          dissmissDirection: DismissDirection.endToStart,
        ),
        URLCell(
          theURL: 'https://www.google.com',
          theSize: 'Unknown Size',
          theIcon: CupertinoIcons.bars,
          favIcon: AssetImage('images/placeholder.png'),
          sizeColor: Color(0xFF8A8A8A),
          doneIconColor: Color(0xFF8A8A8A),
          isFinishedProcessing: false,
          dissmissDirection: DismissDirection.endToStart,
        ),
        URLCell(
          theURL: 'https://www.hotels.com',
          theSize: 'Unknown Size',
          theIcon: CupertinoIcons.bars,
          favIcon: AssetImage('images/placeholder.png'),
          sizeColor: Color(0xFF8A8A8A),
          doneIconColor: Color(0xFF8A8A8A),
          isFinishedProcessing: false,
          dissmissDirection: DismissDirection.endToStart,
        ),
        URLCell(
          theURL: 'https://www.microsoft.com',
          theSize: 'Unknown Size',
          theIcon: CupertinoIcons.bars,
          favIcon: AssetImage('images/placeholder.png'),
          sizeColor: Color(0xFF8A8A8A),
          doneIconColor: Color(0xFF8A8A8A),
          isFinishedProcessing: false,
          dissmissDirection: DismissDirection.endToStart,
        ),
        URLCell(
          theURL: 'https://www.tesla.com',
          theSize: 'Unknown Size',
          theIcon: CupertinoIcons.bars,
          favIcon: AssetImage('images/placeholder.png'),
          sizeColor: Color(0xFF8A8A8A),
          doneIconColor: Color(0xFF8A8A8A),
          isFinishedProcessing: false,
          dissmissDirection: DismissDirection.endToStart,
        ),
        URLCell(
          theURL: 'https://www.uber.com',
          theSize: 'Unknown Size',
          theIcon: CupertinoIcons.bars,
          favIcon: AssetImage('images/placeholder.png'),
          sizeColor: Color(0xFF8A8A8A),
          doneIconColor: Color(0xFF8A8A8A),
          isFinishedProcessing: false,
          dissmissDirection: DismissDirection.endToStart,
        ),
        URLCell(
          theURL: 'https://www.yahoo.com',
          theSize: 'Unknown Size',
          theIcon: CupertinoIcons.bars,
          favIcon: AssetImage('images/placeholder.png'),
          sizeColor: Color(0xFF8A8A8A),
          doneIconColor: Color(0xFF8A8A8A),
          isFinishedProcessing: false,
          dissmissDirection: DismissDirection.endToStart,
        ),
      ];
    });
  }

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
                        Visibility(
                          visible: isStart,
                          child: TextButton(
                            onPressed: () {
                              isStart = false;
                              isReset = true;
                              setState(() {
                                btnText = 'Processing';
                              });

                              for (var index = 0;
                                  index <= TheList.theList.length - 1;
                                  index++) {
                                TheList.theList[index].favIcon = NetworkImage(
                                    '${TheList.theList[index].theURL}/favicon.ico');
                                startTheUrlProcessing(index);
                              }
                              Future.delayed(const Duration(seconds: 2), () {
                                setState(() {
                                  btnText = 'Reset';
                                });
                              });
                            },
                            child: const Text(
                              'Start',
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
                        ),
                        Visibility(
                          visible: isReset,
                          child: TextButton(
                            onPressed: () {
                              isStart = true;
                              isReset = false;
                              resetList();
                            },
                            child: Text(
                              btnText,
                              style: const TextStyle(
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
                        ),
                        TextButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                      title: const Text('Add a URL to the list'),
                                      content: SizedBox(
                                        width: 100,
                                        height: 50,
                                        child: TextField(
                                          decoration: const InputDecoration(
                                            labelText: 'Link:',
                                            labelStyle: TextStyle(
                                                color: Color(0xFF1C1D2F)),
                                            focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Color(0xFF1C1D2F))),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Color(0xFF1C1D2F)),
                                            ),
                                            border: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Color(0xFF1C1D2F)),
                                            ),
                                            hintText: 'https://www.google.com',
                                            fillColor: Color(0xFF1C1D2F),
                                          ),
                                          cursorColor: const Color(0xFF1C1D2F),
                                          onChanged: (value) {
                                            theTextBoxValue = value;
                                          },
                                        ),
                                      ),
                                      actions: [
                                        TextButton(
                                          child: const Text('ADD'),
                                          onPressed: () {

                                            setState(() {
                                              TheList.theList.add(URLCell(
                                                theURL: theTextBoxValue,
                                                theSize: 'Unknown',
                                                theIcon: CupertinoIcons.bars,
                                                favIcon: theWebIcon,
                                                sizeColor: const Color(0xFF8A8A8A),
                                                doneIconColor:
                                                    const Color(0xFF8A8A8A),
                                                isFinishedProcessing: false,
                                                dissmissDirection:
                                                    DismissDirection.endToStart,
                                              ));
                                            });
                                            Navigator.pop(context);
                                          },
                                        )
                                      ],
                                    ));
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

          //The Url ListView
          Expanded(
            child: ReorderableListView(
              scrollDirection: Axis.vertical,
              onReorder: reorderData,
              children: [
                for (int index = 0;
                    index <= TheList.theList.length - 1;
                    index++)
                  //For Dragging to delete
                  Dismissible(
                    direction: TheList.theList[index].dissmissDirection,
                    key: ValueKey(TheList.theList[index]),
                    onDismissed: (direction) {
                      setState(() {
                        TheList.theList.removeAt(index);
                      });

                      //show msg of deleted Item.
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Url ${index + 1} deleted')));
                    },
                    //The Cell skeleton
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10),
                      child: Container(
                        decoration: const BoxDecoration(
                            border: Border(
                          bottom: BorderSide(width: 1.0, color: Colors.black38),
                        )),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.black38, width: 1.0),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: SizedBox(
                                        width: 20,
                                        height: 20,
                                        child: Image(
                                            image:
                                                TheList.theList[index].favIcon),
                                      ),
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        TheList.theList[index].theURL,
                                        style: const TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                      Text(
                                        TheList.theList[index].theSize,
                                        style: TextStyle(
                                          fontSize: 10,
                                          color:
                                              TheList.theList[index].sizeColor,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: TheList.theList[index].doneIconColor,
                                  ),
                                  child: Icon(
                                    TheList.theList[index].theIcon,
                                    color: Colors.white,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                    background: Container(
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                'Delete',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              )),
                        ),
                        color: Colors.redAccent),
                  ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
