import 'package:collageproject/ui/mtstyle.dart';
import 'package:collageproject/utils/size.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

Widget TitleText(context, String title, String time) {
  return Container(
    child: Column(
      children: [
        Align(
          alignment: Alignment.bottomRight,
          child: Container(
            height: 50,
            width: 250,
            decoration: BoxDecoration(
                color: Colors.pinkAccent.withOpacity(0.4),
                borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  SizedBox(
                    width: getwidth(context) * 0.030,
                  ),
                  Icon(
                    LineIcons.doubleCheck,
                    color: maincolor,
                  ),
                  Spacer(),
                  Text(
                    time,
                    style: TextStyle(color: maincolor),
                  )
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: getHeight(context) * 0.00999,
        ),
      ],
    ),
  );
}

Widget newtitle(context, String title, String time) {
  return Container(
    child: Column(
      children: [
        Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            height: 50,
            width: 250,
            decoration: BoxDecoration(
                color: Colors.greenAccent.withOpacity(0.4),
                borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  SizedBox(
                    width: getwidth(context) * 0.030,
                  ),
                  Icon(
                    LineIcons.doubleCheck,
                    color: maincolor,
                  ),
                  Spacer(),
                  Text(
                    time,
                    style: TextStyle(color: maincolor),
                  )
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: getHeight(context) * 0.0100,
        ),
      ],
    ),
  );
}
