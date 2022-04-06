import 'package:flutter/cupertino.dart';
import 'package:url_list/url-cell.dart';

class TheList{
  static List<URLCell> theList = [
    URLCell(theURL: 'http://www.apple.com', theSize: 'Unknown Size', theIcon: CupertinoIcons.bars, favIcon: 'images/placeholder.png'),
    URLCell(theURL: 'http://www.google.com', theSize: 'Unknown Size', theIcon: CupertinoIcons.bars, favIcon: 'images/placeholder.png'),
    URLCell(theURL: 'http://www.hotels.com', theSize: 'Unknown Size', theIcon: CupertinoIcons.bars, favIcon: 'images/placeholder.png'),
    URLCell(theURL: 'http://www.microsoft.com', theSize: 'Unknown Size', theIcon: CupertinoIcons.bars, favIcon: 'images/placeholder.png'),
    URLCell(theURL: 'http://www.tesla.com', theSize: 'Unknown Size', theIcon: CupertinoIcons.bars, favIcon: 'images/placeholder.png'),
    URLCell(theURL: 'http://www.uber.com', theSize: 'Unknown Size', theIcon: CupertinoIcons.bars, favIcon: 'images/placeholder.png'),
  ];
}
