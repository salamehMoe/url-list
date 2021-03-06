import 'package:flutter/cupertino.dart';
import 'package:url_list/url-cell.dart';

//CLASS WITH DEFAULT LIST ITEMS
class TheList {
  static List<URLCell> theList = [
    URLCell(
      theURL: 'https://www.apple.com',
      theSize: 'Unknown Size',
      theIcon: CupertinoIcons.bars,
      favIcon: const AssetImage('images/placeholder.png'),
      sizeColor: const Color(0xFF8A8A8A),
      doneIconColor: const Color(0xFF8A8A8A),
      isFinishedProcessing: false,
      dissmissDirection: DismissDirection.endToStart,
    ),
    URLCell(
      theURL: 'https://www.google.com',
      theSize: 'Unknown Size',
      theIcon: CupertinoIcons.bars,
      favIcon: const AssetImage('images/placeholder.png'),
      sizeColor: const Color(0xFF8A8A8A),
      doneIconColor: const Color(0xFF8A8A8A),
      isFinishedProcessing: false,
      dissmissDirection: DismissDirection.endToStart,
    ),
    URLCell(
      theURL: 'https://www.hotels.com',
      theSize: 'Unknown Size',
      theIcon: CupertinoIcons.bars,
      favIcon: const AssetImage('images/placeholder.png'),
      sizeColor: const Color(0xFF8A8A8A),
      doneIconColor: const Color(0xFF8A8A8A),
      isFinishedProcessing: false,
      dissmissDirection: DismissDirection.endToStart,
    ),
    URLCell(
      theURL: 'https://www.microsoft.com',
      theSize: 'Unknown Size',
      theIcon: CupertinoIcons.bars,
      favIcon: const AssetImage('images/placeholder.png'),
      sizeColor: const Color(0xFF8A8A8A),
      doneIconColor: const Color(0xFF8A8A8A),
      isFinishedProcessing: false,
      dissmissDirection: DismissDirection.endToStart,
    ),
    URLCell(
      theURL: 'https://www.tesla.com',
      theSize: 'Unknown Size',
      theIcon: CupertinoIcons.bars,
      favIcon: const AssetImage('images/placeholder.png'),
      sizeColor: const Color(0xFF8A8A8A),
      doneIconColor: const Color(0xFF8A8A8A),
      isFinishedProcessing: false,
      dissmissDirection: DismissDirection.endToStart,
    ),
    URLCell(
      theURL: 'https://www.uber.com',
      theSize: 'Unknown Size',
      theIcon: CupertinoIcons.bars,
      favIcon: const AssetImage('images/placeholder.png'),
      sizeColor: const Color(0xFF8A8A8A),
      doneIconColor: const Color(0xFF8A8A8A),
      isFinishedProcessing: false,
      dissmissDirection: DismissDirection.endToStart,
    ),
    URLCell(
      theURL: 'https://www.yahoo.com',
      theSize: 'Unknown Size',
      theIcon: CupertinoIcons.bars,
      favIcon: const AssetImage('images/placeholder.png'),
      sizeColor: const Color(0xFF8A8A8A),
      doneIconColor: const Color(0xFF8A8A8A),
      isFinishedProcessing: false,
      dissmissDirection: DismissDirection.endToStart,
    ),
  ];
}
