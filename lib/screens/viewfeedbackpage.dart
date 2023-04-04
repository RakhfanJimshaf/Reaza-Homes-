import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:realestate/models/viewfeedback_model.dart';
import 'package:realestate/services/viewfeedback_service.dart';

import 'drawer.dart';

class viewfeedbackPage extends StatefulWidget {
  const viewfeedbackPage({Key? key}) : super(key: key);

  @override
  State<viewfeedbackPage> createState() => _viewfeedbackPageState();
}

class _viewfeedbackPageState extends State<viewfeedbackPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: getDrawer(context),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.only(left: 0.0, top: 60),
          child: SizedBox(
              height: 80,
              width: 500,
              child: Text(
                "View Feedback",
                style: GoogleFonts.reemKufi(color: Colors.black),
              )),
        ),
        actions: const [
          // Padding(
          //   padding: EdgeInsets.only(right: 12.0),
          //   child: Icon(
          //     Icons.notifications_outlined,
          //     color: Colors.black,
          //     size: 30,
          //   ),
          // ),
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: Icon(
              Icons.logout,
              color: Colors.black,
              size: 30,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              Text(
                "Feedback",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(
                height: 30,
              ),
              FutureBuilder<List<Viewfeedbackmodel>>(
                  future: getViewfeedback(),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Viewfeedbackmodel>> snapshot) {
                    if (snapshot.hasData) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.person,
                                          color: Colors.grey,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(snapshot.data![index].username),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          snapshot.data![index].date.toString(),
                                          style: TextStyle(
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 35.0, top: 10),
                                      child:
                                          Text(snapshot.data![index].feedback),
                                    )
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
            ],
          ),
        ),
      ),
    );
  }
}
