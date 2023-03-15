import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:realestate/constants/appcolors.dart';
import 'package:realestate/constants/baseurl.dart';
import 'package:realestate/models/view_property_model.dart';
import 'package:realestate/screens/drawer.dart';
import 'package:realestate/screens/propertydetail.dart';
import 'package:realestate/screens/viewfeedbackpage.dart';
import 'package:realestate/services/view_property_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      drawer: getDrawer(context),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.grey[200],
        title: Text(
          "Real estate",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Icon(Icons.logout),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.17,
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: Center(
                    child: TextFormField(
                      onChanged: (value) {
                        setState(() {
                          // searchString = value.toLowerCase();
                        });
                      },
                      autofocus: false,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.04,
                      ),
                      onEditingComplete: () =>
                          FocusScope.of(context).nextFocus(),
                      decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.search,
                            color: AppColors.dblue,
                          ),
                          errorStyle: const TextStyle(height: 0),
                          contentPadding: const EdgeInsets.only(left: 10.0),
                          fillColor: Colors.white,
                          filled: true,
                          border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide.none,
                          ),
                          hintText: 'Search for property',
                          hintStyle: TextStyle(
                            color: Colors.black38,
                            fontSize: MediaQuery.of(context).size.width * 0.04,
                          )),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => viewfeedbackPage()));
                  },
                  child: Container(
                    height: 40,
                    width: 50,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(15)),
                    child: Image.asset(
                      "assets/feed.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            ListView(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              children: [
                SizedBox(
                    width: MediaQuery.of(context).size.width * 1,
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: CarouselSlider(
                      items: [
                        Container(
                            margin: const EdgeInsets.all(6.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              image: const DecorationImage(
                                image: AssetImage("assets/home1.jpg"),
                                fit: BoxFit.cover,
                              ),
                            )),
                        Container(
                            margin: const EdgeInsets.all(6.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              image: const DecorationImage(
                                image: AssetImage("assets/hom2.jpg"),
                                fit: BoxFit.cover,
                              ),
                            )),
                        Container(
                            margin: const EdgeInsets.all(6.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              image: const DecorationImage(
                                image: AssetImage("assets/home3.jpg"),
                                fit: BoxFit.cover,
                              ),
                            ))
                      ],
                      options: CarouselOptions(
                          autoPlay: true,
                          height: 180.0,
                          enlargeCenterPage: true,
                          aspectRatio: 16 / 9,
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enableInfiniteScroll: true,
                          autoPlayAnimationDuration:
                              const Duration(milliseconds: 800),
                          viewportFraction: 1),
                    )),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                "Featured Properties",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            FutureBuilder<List<Viewpropertymodel>>(
                future: getViewproperty(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<Viewpropertymodel>> snapshot) {
                  if (snapshot.hasData) {
                    return Container(
                      height: MediaQuery.of(context).size.height * 0.4444,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 5,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                      ),
                      child: GridView.builder(
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.8,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 13,
                        ),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProductDetailsView(
                                          model: snapshot.data![index])));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    color: const Color(0xFFF5F6F9)
                                        .withOpacity(0.15)),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(16),
                                ),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 100,
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(7.0)),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(10.0),
                                          topLeft: Radius.circular(10.0)),
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            baseurl + snapshot.data![index].img,
                                        imageBuilder:
                                            (context, imageProvider) =>
                                                Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: imageProvider,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 15),
                                      Center(
                                        child: Text(
                                          "Price: ₹" +
                                              snapshot.data![index].price,
                                          style: GoogleFonts.openSans(
                                            color: Colors.black,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 1,
                                      ),
                                      Center(
                                        child: Text(
                                          "sqft: " +
                                              snapshot.data![index].areaMeasure,
                                          style: GoogleFonts.openSans(
                                            color: Colors.grey[500],
                                            fontSize: 13,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 3,
                                      ),
                                      Center(
                                          child: snapshot
                                                      .data![index].category ==
                                                  "Sell"
                                              ? Text(
                                                  "Sale",
                                                  style: TextStyle(
                                                    color: Colors.green,
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                )
                                              : Text(
                                                  "Rent",
                                                  style: TextStyle(
                                                    color: Colors.red,
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                )),
                                    ],
                                  ),
                                ],
                              ),
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
                    return CircularProgressIndicator();
                  }
                }),
          ],
        ),
      ),
    );
  }
}
