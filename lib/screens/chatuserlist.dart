import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
      extendBody: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.only(left: 0.0, top: 60),
          child: SizedBox(
              height: 80,
              width: 500,
              child: Text(
                "Chats",
                style: GoogleFonts.reemKufi(color: Colors.black),
              )),
        ),
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
