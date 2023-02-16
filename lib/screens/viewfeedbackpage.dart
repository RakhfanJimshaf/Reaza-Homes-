import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:realestate/constants/appcolors.dart';
import 'package:realestate/models/viewfeedback_model.dart';
import 'package:realestate/services/viewfeedback_service.dart';

class viewfeedbackPage extends StatefulWidget {
  const viewfeedbackPage({Key? key}) : super(key: key);

  @override
  State<viewfeedbackPage> createState() => _viewfeedbackPageState();
}

class _viewfeedbackPageState extends State<viewfeedbackPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: AppColors.dblue,
        title: Text(
          "View Feedback",
          style: GoogleFonts.openSans(
              color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20),
          textAlign: TextAlign.center,
        ),
        elevation: 0,
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
