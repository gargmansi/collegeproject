import 'package:collageproject/config/color_config.dart';
import 'package:collageproject/ui/mtstyle.dart';
import 'package:collageproject/utils/size.dart';
import 'package:collageproject/widget/titletext.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class Chart extends StatefulWidget {
  const Chart({Key? key}) : super(key: key);

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  TextEditingController controller = TextEditingController();
  List<String> messages = [
    "Hello",
    "Hey",
    "This is demo message",
    "This is a reply"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "chatbot",
          style: TextStyle(
              color: Colors.blueGrey,
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Container(
            height: getHeight(context),
            width: getwidth(context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: ListView.builder(
                        itemCount: messages.length,
                        reverse: true,
                        itemBuilder: (context, index) {
                          return Align(
                            alignment: index % 2 == 0
                                ? Alignment.centerLeft
                                : Alignment.centerRight,
                            child: Container(
                              // width: getwidth(context) * 0.6,
                              margin: EdgeInsets.all(10.0),
                              padding: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: index % 2 == 0
                                          ? Radius.circular(0)
                                          : Radius.circular(20.0),
                                      topLeft: Radius.circular(20.0),
                                      topRight: Radius.circular(20.0),
                                      bottomRight: index % 2 == 0
                                          ? Radius.circular(20)
                                          : Radius.circular(0.0)),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black12.withOpacity(0.1),
                                        offset: Offset(2, 2),
                                        blurRadius: 8,
                                        spreadRadius: 0)
                                  ],
                                  gradient: LinearGradient(
                                      colors: index % 2 == 0
                                          ? [Colors.white, Colors.white]
                                          : ColorConfig.gradient,
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight)),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Flexible(
                                      child: Text(
                                    messages[messages.length - index - 1],
                                    style: TextStyle(
                                        color: index % 2 == 0
                                            ? Colors.black
                                            : Colors.white),
                                  )),
                                  SizedBox(width: 5.0),
                                  Flexible(
                                      child: Text(
                                    "07:10",
                                    style: TextStyle(
                                        fontSize: 12.0, color: Colors.black54),
                                  )),
                                ],
                              ),
                            ),
                          );
                        })),
                SizedBox(
                  height: getHeight(context) * 0.014,
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(color: Colors.grey, width: 2.0))),
                  height: getHeight(context) * 0.1,
                  width: getwidth(context),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 5.0, vertical: 10.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            // height: 50,
                            // width: 180,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.black12),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                  maxLines: 4,
                                  controller: controller,
                                  decoration: InputDecoration(
                                    hintText: "Message...",
                                    border: InputBorder.none,
                                    hintStyle: TextStyle(color: maincolor),
                                  )),
                            ),
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              if (controller.text.isEmpty) return;
                              setState(() {
                                messages.add(controller.text);
                                controller.clear();
                              });
                            },
                            icon: Icon(
                              LineIcons.paperPlane,
                              color: maincolor,
                            ))
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
