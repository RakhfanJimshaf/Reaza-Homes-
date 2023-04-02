import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:realestate/constants/baseurl.dart';
import 'package:realestate/models/favlist_model.dart';
import 'package:realestate/services/deletefav_list_service.dart';
import 'package:realestate/services/favlist_service.dart';

class myfav extends StatefulWidget {
  const myfav({Key? key}) : super(key: key);

  @override
  State<myfav> createState() => _myfavState();
}

class _myfavState extends State<myfav> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.only(left: 0.0, top: 60),
          child: SizedBox(
              height: 80,
              width: 500,
              child: Text(
                "Liked Properties",
                style: GoogleFonts.reemKufi(color: Colors.black),
              )),
        ),
      ),
      //   iconTheme: const IconThemeData(color: Colors.white),
      //   backgroundColor: AppColors.dblue,
      //   title: Text(
      //     "My Favourites",
      //     style: GoogleFonts.openSans(
      //         color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20),
      //     textAlign: TextAlign.center,
      //   ),
      //   elevation: 0,
      // ),
      body: FutureBuilder<List<Favlistmodel>>(
          future: getFavlist(),
          builder: (BuildContext context,
              AsyncSnapshot<List<Favlistmodel>> snapshot) {
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
                                            snapshot.data![index].category ==
                                                    "Sell"
                                                ? Text(
                                                    "Sale",
                                                    style: TextStyle(
                                                      color: Colors.green,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  )
                                                : Text(
                                                    "Rent",
                                                    style: TextStyle(
                                                      color: Colors.red,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
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
                                            Text(
                                              snapshot.data![index]
                                                      .areaMeasure +
                                                  "sqft",
                                              style: GoogleFonts.openSans(
                                                color: Colors.grey,
                                                fontSize: 13,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            IconButton(
                                                onPressed: () {
                                                  getdeleteDeleteFavlist(
                                                          snapshot.data![index]
                                                              .propertyId
                                                              .toString())
                                                      .then((value) {
                                                    if (value.status ==
                                                        "success") {
                                                      Fluttertoast.showToast(
                                                        msg:
                                                            "Removed from favourites",
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
                                                                  const myfav()));
                                                    }
                                                  });
                                                },
                                                icon: Icon(Icons.remove_circle))
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
