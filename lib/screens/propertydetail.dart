import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:realestate/constants/appcolors.dart';
import 'package:realestate/constants/baseurl.dart';
import 'package:realestate/models/view_property_model.dart';
import 'package:realestate/screens/chat_module/user_chat_screen.dart';
import 'package:realestate/screens/payment.dart';
import 'package:realestate/screens/properties_preview.dart';
import 'package:realestate/services/favourite_service.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';

class ProductDetailsView extends StatefulWidget {
  final Viewpropertymodel model;
  const ProductDetailsView({Key? key, required this.model}) : super(key: key);

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  bool isfavourite = false;
  VideoPlayerController? _controller;
  @override
  void initState() {
    _controller = VideoPlayerController.network(baseurl + widget.model.video)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
    // TODO: implement initState
    super.initState();
  }

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
        child: Stack(
          children: [
            Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // SizedBox(
                //   height: MediaQuery.of(context).size.height * .40,
                //   width: MediaQuery.of(context).size.width,
                //   child:
                //       //  Image.network(
                //       //   baseurl + widget.model.img,
                //       //   fit: BoxFit.cover,
                //       // ),
                //       Panorama(
                //     child: Image.asset('assets/PANO_20200221_113656.jpg'),
                //   ),
                // ),
                Expanded(
                  child: SizedBox(
                      width: MediaQuery.of(context).size.width * 1,
                      height: MediaQuery.of(context).size.height * 80,
                      child: CarouselSlider(
                        items: [
                          Card(
                            clipBehavior: Clip.antiAlias,
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: InkWell(
                              onTap: (() {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => PropertiesPreView(
                                              url: baseurl + widget.model.img,
                                              status: "Nom",
                                            )));
                              }),
                              child: CachedNetworkImage(
                                imageUrl: baseurl + widget.model.img,
                                progressIndicatorBuilder:
                                    (context, url, progress) {
                                  return CircularProgressIndicator();
                                },
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  width: MediaQuery.of(context).size.width * 1,
                                  height:
                                      MediaQuery.of(context).size.height * 60,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: imageProvider,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Card(
                            clipBehavior: Clip.antiAlias,
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: InkWell(
                              onTap: (() {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => PropertiesPreView(
                                              url: baseurl + widget.model.img1,
                                              status: "Nom",
                                            )));
                              }),
                              child: CachedNetworkImage(
                                imageUrl: baseurl + widget.model.img1,
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  width: MediaQuery.of(context).size.width * 1,
                                  height:
                                      MediaQuery.of(context).size.height * 60,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: imageProvider,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Card(
                            clipBehavior: Clip.antiAlias,
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: InkWell(
                              onTap: (() {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => PropertiesPreView(
                                              url: baseurl + widget.model.img2,
                                              status: "Nom",
                                            )));
                              }),
                              child: CachedNetworkImage(
                                imageUrl: baseurl + widget.model.img2,
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  width: MediaQuery.of(context).size.width * 1,
                                  height:
                                      MediaQuery.of(context).size.height * 60,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: imageProvider,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Card(
                            clipBehavior: Clip.antiAlias,
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: InkWell(
                              onTap: (() {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => PropertiesPreView(
                                              url: baseurl + widget.model.img3,
                                              status: "PAN",
                                            )));
                              }),
                              child: CachedNetworkImage(
                                imageUrl: baseurl + widget.model.img3,
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  width: MediaQuery.of(context).size.width * 1,
                                  height:
                                      MediaQuery.of(context).size.height * 60,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: imageProvider,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          //
                          // Container(
                          //     margin: const EdgeInsets.all(6.0),
                          //     decoration: BoxDecoration(
                          //       borderRadius: BorderRadius.circular(10.0),
                          //       image: const DecorationImage(
                          //         image: AssetImage(
                          //           "assets/home1.jpg",
                          //         ),
                          //         fit: BoxFit.cover,
                          //       ),
                          //     )),
                          // Container(
                          //     margin: const EdgeInsets.all(6.0),
                          //     decoration: BoxDecoration(
                          //       borderRadius: BorderRadius.circular(10.0),
                          //       image: const DecorationImage(
                          //         image: AssetImage("assets/hom2.jpg"),
                          //         fit: BoxFit.cover,
                          //       ),
                          //     )),
                          // Container(
                          //     margin: const EdgeInsets.all(6.0),
                          //     decoration: BoxDecoration(
                          //       borderRadius: BorderRadius.circular(10.0),
                          //       image: const DecorationImage(
                          //         image: AssetImage("assets/home3.jpg"),
                          //         fit: BoxFit.cover,
                          //       ),
                          //     ))
                        ],
                        options: CarouselOptions(
                            autoPlay: true,
                            height: MediaQuery.of(context).size.height * 60,
                            enlargeCenterPage: true,
                            aspectRatio: 16 / 9,
                            autoPlayCurve: Curves.fastOutSlowIn,
                            enableInfiniteScroll: true,
                            autoPlayAnimationDuration:
                                const Duration(milliseconds: 800),
                            viewportFraction: 1),
                      )),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .50,
                  child: ListView(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                              msg:
                                                  "Already added to favourites",
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
                                    "Area: " +
                                        widget.model.areaMeasure +
                                        "sqft",
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
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
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
                              Container(
                                  color: Colors.grey,
                                  height:
                                      MediaQuery.of(context).size.height * 0.2,
                                  width: MediaQuery.of(context).size.width,
                                  child: _controller != null
                                      ? _controller!.value.isInitialized
                                          ? Stack(
                                              children: [
                                                VideoPlayer(
                                                  _controller!,
                                                ),
                                                _controller != null
                                                    ? FloatingActionButton(
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        onPressed: () {
                                                          // Wrap the play or pause in a call to `setState`. This ensures the
                                                          // correct icon is shown.
                                                          setState(() {
                                                            // If the video is playing, pause it.
                                                            if (_controller !=
                                                                null) {
                                                              if (_controller!
                                                                  .value
                                                                  .isPlaying) {
                                                                _controller!
                                                                    .pause();
                                                              } else {
                                                                // If the video is paused, play it.
                                                                _controller!
                                                                    .play();
                                                              }
                                                            }
                                                          });
                                                        },
                                                        // Display the correct icon depending on the state of the player.
                                                        child: Icon(
                                                          _controller!.value
                                                                  .isPlaying
                                                              ? Icons.pause
                                                              : Icons
                                                                  .play_arrow,
                                                        ),
                                                      )
                                                    : Container()
                                              ],
                                            )
                                          : Container()
                                      : Container()),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .10,
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
            Positioned(
              bottom: MediaQuery.of(context).size.height * 0.03,
              left: MediaQuery.of(context).size.width * 0.16,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 40,
                    width: MediaQuery.of(context).size.width * .2,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            foregroundColor: MaterialStateProperty.all<Color>(
                                Colors.deepPurple),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                AppColors.dblue),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ))),
                        onPressed: () {
                          _launchUrl(widget.model.contact);
                        },
                        child: Icon(
                          Icons.phone,
                          color: Colors.white,
                        )),
                  ),
                  const SizedBox(width: 15),
                  SizedBox(
                    height: 40,
                    width: MediaQuery.of(context).size.width * .2,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            foregroundColor: MaterialStateProperty.all<Color>(
                                Colors.deepPurple),
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.black),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ))),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ChatScreenUser(
                                        userId: widget.model.userId.toString(),
                                        userName:
                                            widget.model.userId.toString(),
                                      )));
                        },
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
                            foregroundColor: MaterialStateProperty.all<Color>(
                                Colors.deepPurple),
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.black),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
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
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl(String phone) async {
    String phno = "tel:" + phone;
    if (await canLaunchUrl(Uri.parse(phno))) {
      launchUrl(
        Uri.parse(phno),
      );
      LaunchMode.externalNonBrowserApplication;
    } else {
      throw 'Could not launch $phno)';
    }
  }
}
