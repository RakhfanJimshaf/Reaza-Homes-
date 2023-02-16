import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:panorama/panorama.dart';
import 'package:realestate/constants/appcolors.dart';
import 'package:realestate/models/view_property_model.dart';
import 'package:realestate/screens/payment.dart';
import 'package:realestate/services/favourite_service.dart';

class ProductDetailsView extends StatefulWidget {
  final Viewpropertymodel model;
  const ProductDetailsView({Key? key, required this.model}) : super(key: key);

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  bool isfavourite = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: AppColors.dblue,
        title: Text(
          "Property Details",
          style: GoogleFonts.openSans(
              color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20),
          textAlign: TextAlign.center,
        ),
        elevation: 0,
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .40,
              width: MediaQuery.of(context).size.width,
              child:
                  //  Image.network(
                  //   baseurl + widget.model.img,
                  //   fit: BoxFit.cover,
                  // ),
                  Panorama(
                child: Image.asset('assets/PANO_20200221_113656.jpg'),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .49,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                      right: 10,
                      left: 10,
                    ),
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "₹" + widget.model.price,
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              IconButton(
                                  onPressed: () {
                                    getaddFavourite(
                                      widget.model.id.toString(),
                                    ).then((value) {
                                      if (value.status == "success") {
                                        Fluttertoast.showToast(
                                          msg: "Added to favourites",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.black,
                                          textColor: Colors.white,
                                          fontSize: 14,
                                        );
                                      } else {
                                        Fluttertoast.showToast(
                                          msg: "Already added to favourites",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.black,
                                          textColor: Colors.white,
                                          fontSize: 14,
                                        );
                                      }
                                    });
                                  },
                                  icon: isfavourite
                                      ? Icon(
                                          Icons.favorite_outline,
                                          color: Colors.red,
                                        )
                                      : Icon(
                                          Icons.favorite_sharp,
                                          color: Colors.red,
                                        ))
                            ],
                          ),
                          const SizedBox(height: 5),
                          Text(
                            widget.model.proType,
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              Text(
                                widget.model.location,
                                style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Area: " + widget.model.areaMeasure + "sqft",
                                style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  color: Colors.grey[600],
                                ),
                              ),
                              SizedBox(
                                width: 160,
                              ),
                              Text(
                                widget.model.category,
                                style: GoogleFonts.poppins(
                                    fontSize: 15,
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const SizedBox(height: 25),
                          Text(
                            'Description',
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.1,
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Text(
                                    widget.model.description,
                                    style: GoogleFonts.poppins(
                                      fontSize: 15,
                                      color: Colors.grey[700],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 35,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 40,
                                width: MediaQuery.of(context).size.width * .2,
                                child: ElevatedButton(
                                    style: ButtonStyle(
                                        foregroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.deepPurple),
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                AppColors.dblue),
                                        shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ))),
                                    onPressed: () {},
                                    child: Icon(
                                      Icons.phone,
                                      color: Colors.white,
                                    )
                                    //  Text(
                                    //   "Call",
                                    //   style: TextStyle(
                                    //       fontSize: MediaQuery.of(context)
                                    //               .size
                                    //               .height *
                                    //           0.022,
                                    //       fontWeight: FontWeight.w600,
                                    //       color: Colors.white),
                                    // ),
                                    ),
                              ),
                              const SizedBox(width: 15),
                              SizedBox(
                                height: 40,
                                width: MediaQuery.of(context).size.width * .2,
                                child: ElevatedButton(
                                    style: ButtonStyle(
                                        foregroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.deepPurple),
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.black),
                                        shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ))),
                                    onPressed: () {},
                                    child: Icon(
                                      Icons.chat,
                                      color: Colors.white,
                                    )
                                    // Text(
                                    //   "Chat",
                                    //   style: TextStyle(
                                    //       fontSize: MediaQuery.of(context)
                                    //               .size
                                    //               .height *
                                    //           0.022,
                                    //       fontWeight: FontWeight.w600,
                                    //       color: Colors.white),
                                    // ),
                                    ),
                              ),
                              const SizedBox(width: 15),
                              SizedBox(
                                height: 40,
                                width: MediaQuery.of(context).size.width * .2,
                                child: ElevatedButton(
                                    style: ButtonStyle(
                                        foregroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.deepPurple),
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.black),
                                        shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ))),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => PaymentPage(
                                                    properyid: widget.model.id,
                                                    price: widget.model.price,
                                                  )));
                                    },
                                    child: Icon(
                                      Icons.currency_exchange_outlined,
                                      color: Colors.white,
                                    )
                                    // Text(
                                    //   "Chat",
                                    //   style: TextStyle(
                                    //       fontSize: MediaQuery.of(context)
                                    //               .size
                                    //               .height *
                                    //           0.022,
                                    //       fontWeight: FontWeight.w600,
                                    //       color: Colors.white),
                                    // ),
                                    ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
