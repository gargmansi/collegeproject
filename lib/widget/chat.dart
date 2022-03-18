import 'package:collageproject/config/color_config.dart';
import 'package:collageproject/data/openai.dart';
import 'package:collageproject/services/open_ai_service.dart';
import 'package:collageproject/ui/mtstyle.dart';
import 'package:collageproject/utils/size.dart';
import 'package:collageproject/widget/titletext.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:line_icons/line_icons.dart';
import 'package:lottie/lottie.dart';

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  TextEditingController controller = TextEditingController();
  List<Map<String, dynamic>> messages = [];
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
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
          child: SizedBox(
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
                          if (isLoading && index == 0) {
                            return Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  margin: const EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: const BorderRadius.only(
                                        bottomLeft: Radius.circular(0),
                                        topLeft: Radius.circular(20.0),
                                        topRight: Radius.circular(20.0),
                                        bottomRight: Radius.circular(20)),
                                    boxShadow: [
                                      BoxShadow(
                                          color:
                                              Colors.black12.withOpacity(0.1),
                                          offset: const Offset(2, 2),
                                          blurRadius: 8,
                                          spreadRadius: 0)
                                    ],
                                  ),
                                  child: Lottie.asset("assets/loading.json",
                                      height: 50.0, width: 100.0),
                                ));
                          }
                          return Align(
                            alignment: messages[index]["from"] != "me"
                                ? Alignment.centerLeft
                                : Alignment.centerRight,
                            child: Container(
                              // width: getwidth(context) * 0.6,
                              margin: const EdgeInsets.all(10.0),
                              padding: const EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft:
                                          messages[index]["from"] != "me"
                                              ? const Radius.circular(0)
                                              : const Radius.circular(20.0),
                                      topLeft: const Radius.circular(20.0),
                                      topRight: const Radius.circular(20.0),
                                      bottomRight:
                                          messages[index]["from"] != "me"
                                              ? const Radius.circular(20)
                                              : const Radius.circular(0.0)),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black12.withOpacity(0.1),
                                        offset: const Offset(2, 2),
                                        blurRadius: 8,
                                        spreadRadius: 0)
                                  ],
                                  gradient: LinearGradient(
                                      colors: messages[index]["from"] != "me"
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
                                    messages[index]["message"],
                                    style: TextStyle(
                                        color: messages[index]["from"] != "me"
                                            ? Colors.black
                                            : Colors.white),
                                  )),
                                  const SizedBox(width: 5.0),
                                  Flexible(
                                      child: Text(
                                    messages[index]["time"],
                                    style: const TextStyle(
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
                  decoration: const BoxDecoration(
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
                            onPressed: () async {
                              if (controller.text.isEmpty) return;
                              String question = controller.text;
                              setState(() {
                                isLoading = true;
                                controller.clear();
                              });
                              setState(() {
                                messages.insert(0, {
                                  "message": question,
                                  "from": "me",
                                  "time":
                                      DateFormat("hh:mm").format(DateTime.now())
                                });
                              });

                              try {
                                String answer = await OpenAI().answer(question);
                                messages.insert(0, {
                                  "message": answer,
                                  "from": "bot",
                                  "time":
                                      DateFormat("hh:mm").format(DateTime.now())
                                });
                                setState(() {
                                  isLoading = false;
                                });
                              } catch (e) {
                                setState(() {
                                  messages.insert(0, {
                                    "message": "Some error occurred",
                                    "from": "bot",
                                    "time": DateFormat("hh:mm")
                                        .format(DateTime.now())
                                  });
                                  isLoading = false;
                                });
                              }
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
