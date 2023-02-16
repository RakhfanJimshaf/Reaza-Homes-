import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:realestate/constants/appcolors.dart';
import 'package:realestate/constants/baseurl.dart';
import 'package:realestate/models/myproperties_model.dart';
import 'package:realestate/screens/edit_page.dart';
import 'package:realestate/services/delete_property_service.dart';
import 'package:realestate/services/myproperties_service.dart';

class MypropertiesPage extends StatefulWidget {
  const MypropertiesPage({Key? key}) : super(key: key);

  @override
  State<MypropertiesPage> createState() => _MypropertiesPageState();
}

class _MypropertiesPageState extends State<MypropertiesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: AppColors.dblue,
        title: Text(
          "My Properties",
          style: GoogleFonts.openSans(
              color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20),
          textAlign: TextAlign.center,
        ),
        elevation: 0,
      ),
      body: FutureBuilder<List<Mypropertiesmodel>>(
          future: getMyproperties(),
          builder: (BuildContext context,
              AsyncSnapshot<List<Mypropertiesmodel>> snapshot) {
            if (snapshot.hasData) {
              return Container(
                height: MediaQuery.of(context).size.height,
                padding: const EdgeInsets.symmetric(
                  horizontal: 5,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Stack(
                        children: [
                          ClipRect(
                            child: GestureDetector(
                              onTap: () {
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) =>
                                //             ProductDetailsView(
                                //                 model: snapshot
                                //                     .data![index])));
                              },
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.15,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                      color: const Color(0xFFF5F6F9)
                                          .withOpacity(0.15)),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(16),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(12),
                                          bottomLeft: Radius.circular(12)),
                                      child: Image.network(
                                        baseurl + snapshot.data![index].img,
                                        fit: BoxFit.cover,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.34,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.15,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.4,
                                              child: Text(
                                                " ₹" +
                                                    snapshot.data![index].price,
                                                style: GoogleFonts.oswald(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            editpage(
                                                                model: snapshot
                                                                        .data![
                                                                    index])));
                                              },
                                              child: Icon(
                                                Icons.edit,
                                                size: 23,
                                                color: AppColors.dblue,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                getdeleteproperty(snapshot
                                                        .data![index].id
                                                        .toString())
                                                    .then((value) {
                                                  if (value.status ==
                                                      "success") {
                                                    Fluttertoast.showToast(
                                                      msg: "Property deleted",
                                                      toastLength:
                                                          Toast.LENGTH_SHORT,
                                                      gravity:
                                                          ToastGravity.CENTER,
                                                      timeInSecForIosWeb: 1,
                                                      backgroundColor:
                                                          Colors.black,
                                                      textColor: Colors.white,
                                                      fontSize: 14,
                                                    );
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                const MypropertiesPage()));
                                                  }
                                                });
                                              },
                                              child: Icon(
                                                Icons.delete,
                                                size: 23,
                                                color: AppColors.ered,
                                              ),
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.location_pin,
                                              color: Colors.black,
                                              size: 20,
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              snapshot.data![index].location,
                                              style: GoogleFonts.openSans(
                                                color: Colors.black,
                                                fontSize: 13,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.square_foot_outlined,
                                              color: Colors.grey,
                                              size: 20,
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Container(
                                              width: 130,
                                              child: Text(
                                                snapshot.data![index]
                                                        .areaMeasure +
                                                    "sqft",
                                                style: GoogleFonts.openSans(
                                                  color: Colors.grey,
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
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
