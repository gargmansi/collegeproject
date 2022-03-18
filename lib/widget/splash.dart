import 'dart:ui';

import 'package:collageproject/config/color_config.dart';
import 'package:collageproject/utils/size.dart';
import 'package:collageproject/widget/chat.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   Future.delayed(Duration(seconds: 3), () {
  //     Navigator.pushAndRemoveUntil(context,
  //         MaterialPageRoute(builder: (context) => Chart()), (route) => false);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.lightBlueAccent.withOpacity(0.3),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Lottie.asset("assets/chatbot.json"),
                SizedBox(
                  height: getHeight(context) * 0.025,
                ),
                Text(
                  "Welcome To Chatty",
                  style: TextStyle(
                      color: Colors.deepOrangeAccent.withOpacity(0.5),
                      fontSize: 30),
                ),
                SizedBox(
                  height: getHeight(context) * 0.02,
                ),
                const Text(
                  """
Lorem ipsum dolor sit amet. Qui consequatur delenrum et quidem officiis. A possimus fugit quo error consectetur et omnis rerum eum rerum voluptas quo autem odio. Et laudantium iste ea obcaecati modi et officia voluptatem ab voluptas porro eos officia commodi.
""",
                  style: TextStyle(color: Colors.black54, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => const Chat()),
                        (route) => false);
                  },
                  child: Container(
                    height: getHeight(context) * 0.070,
                    width: getwidth(context) * 0.70,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: ColorConfig.gradient,
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: const Center(
                        child: Text(
                      "Start Now",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    )),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
