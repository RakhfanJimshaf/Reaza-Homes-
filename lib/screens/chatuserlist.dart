import 'package:flutter/material.dart';
import 'package:realestate/constants/appcolors.dart';
import 'package:realestate/models/chatuserlistmodel.dart';
import 'package:realestate/screens/chatscreen.dart';
import 'package:realestate/services/chatuserlistservice.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.dblue,
        title: Text("Chat"),
      ),
      body: FutureBuilder<List<Chatuserlistmodel>>(
          future: getChatuserlist(),
          builder: (BuildContext context,
              AsyncSnapshot<List<Chatuserlistmodel>> snapshot) {
            if (snapshot.hasData) {
              return Container(
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 30,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ChatScreen(
                                            model: snapshot.data![index])));
                              },
                              child: Card(
                                child: Container(
                                    height: 40,
                                    width: MediaQuery.of(context).size.width,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20.0, top: 10),
                                      child: Text(snapshot.data![index].name),
                                    )),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
              );
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
    );
  }
}
