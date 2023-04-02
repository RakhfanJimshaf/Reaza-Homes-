import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:realestate/constants/appcolors.dart';
import 'package:realestate/models/view_msg_model.dart';
import 'package:realestate/services/sendmsgservice.dart';
import 'package:realestate/services/view_msg_service.dart';

class ChatScreenUser extends StatefulWidget {
  final String userId;
  final String userName;
  const ChatScreenUser({
    Key? key,
    required this.userId,
    required this.userName,
  }) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

//  Received message bubble
class InBubble extends StatelessWidget {
  final String message;
  const InBubble({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Transform(
          alignment: Alignment.center,
          transform: Matrix4.rotationY(math.pi),
          child: CustomPaint(
            painter: Triangle(Colors.grey.shade300),
          ),
        ),
        Flexible(
          child: Container(
            padding: const EdgeInsets.all(15),
            margin: const EdgeInsets.only(bottom: 5),
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(19),
                bottomLeft: Radius.circular(19),
                bottomRight: Radius.circular(19),
              ),
            ),
            child: Text(
              message,
              style: const TextStyle(color: Colors.black, fontSize: 15),
            ),
          ),
        ),
      ],
    );
  }
}

// Sent message bubble
class OutBubble extends StatelessWidget {
  final String message;
  const OutBubble({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: Container(
            padding: const EdgeInsets.all(15),
            margin: const EdgeInsets.only(bottom: 5),
            decoration: BoxDecoration(
              color: Colors.indigo.shade600,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(19),
                bottomLeft: Radius.circular(19),
                bottomRight: Radius.circular(19),
              ),
            ),
            child: Text(
              message,
              style: const TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
        ),
        CustomPaint(painter: Triangle(Colors.indigo.shade600)),
      ],
    );
  }
}

// Create a custom triangle
class Triangle extends CustomPainter {
  final Color backgroundColor;
  Triangle(this.backgroundColor);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()..color = backgroundColor;

    var path = Path();
    path.lineTo(-5, 0);
    path.lineTo(0, 10);
    path.lineTo(5, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class _ChatScreenState extends State<ChatScreenUser> {
  final msgcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.dblue,
          title: Text(widget.userName),
        ),
        body: Stack(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: ListView(
                reverse: true,
                children: [
                  // InBubble(message: 'Hello'),
                  FutureBuilder<List<Viewmsgmodel>>(
                      future: getViewmsg(widget.userId.toString()),
                     
                      builder: (BuildContext context,
                          AsyncSnapshot<List<Viewmsgmodel>> snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                              shrinkWrap: true,
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                           String name=snapshot.data[index].

                                return OutBubble(
                                    message: snapshot.data![index].sendMsg);
                              });
                        } else if (snapshot.hasError) {
                          return Center(
                            child: Image.asset(
                              "assets/noimage.png",
                              height: 50,
                            ),
                          );
                        } else {
                          return Container();
                        }
                      }),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey, width: 1)),
                height: 70,
                child: Row(
                  children: [
                    IconButton(
                        icon: Icon(
                          Icons.camera_alt,
                          color: Theme.of(context).primaryColor,
                          size: 35,
                        ),
                        onPressed: null),
                    Expanded(
                      child: TextField(
                        controller: msgcontroller,
                        decoration: InputDecoration.collapsed(
                            hintText: "Write your message"),
                      ),
                    ),
                    IconButton(
                        icon: Icon(Icons.send,
                            color: Theme.of(context).primaryColor, size: 35),
                        onPressed: () {
                          getSendmsg(
                            widget.userId.toString(),
                            msgcontroller.text.toString(),
                          ).then((value) {
                            if (value.status == "success") {
                              Fluttertoast.showToast(
                                msg: "msg sent",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.black,
                                textColor: Colors.white,
                                fontSize: 14,
                              );
                            }
                          });
                        }),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
