import 'package:flutter/material.dart';

//Custom Class for the list cell

class URLCell  {

URLCell({
  required this.theURL,
  required this.theSize,
  required this.theIcon,
  required this.favIcon,
  required this.sizeColor,
  required this.doneIconColor,
  required this.isFinishedProcessing,
  required this.dissmissDirection,


});
   ImageProvider favIcon;
   String theURL;
   String theSize;
   IconData theIcon;
   Color sizeColor;
   Color doneIconColor;
   bool isFinishedProcessing;
   DismissDirection dissmissDirection;

}
