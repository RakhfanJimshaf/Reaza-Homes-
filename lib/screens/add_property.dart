import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:realestate/constants/appcolors.dart';
import 'package:realestate/screens/homepage.dart';
import 'package:realestate/services/add_property_service.dart';
import 'package:video_player/video_player.dart';

class AddpropertyPage extends StatefulWidget {
  const AddpropertyPage({Key? key}) : super(key: key);

  @override
  State<AddpropertyPage> createState() => _AddpropertyPageState();
}

class _AddpropertyPageState extends State<AddpropertyPage> {
  final protypecontroller = TextEditingController();
  final locationcontroller = TextEditingController();
  final areacontroller = TextEditingController();
  final pricecontroller = TextEditingController();
  final descriptioncontroller = TextEditingController();
  final contactcontroller = TextEditingController();
  File? image;
  File? image1;
  File? image2;
  File? image3;
  File? video;
  String? categoryvalue;

  var dropdownvalue;

  List<DropdownMenuItem<String>> get categoryname {
    List<DropdownMenuItem<String>> Items = [
      const DropdownMenuItem(value: "Sell", child: Text("Sell")),
      const DropdownMenuItem(value: "Rent", child: Text("Rent")),
    ];
    return Items;
  }

  VideoPlayerController? _controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: AppColors.dblue,
        title: Text(
          "Add Property",
          style: GoogleFonts.openSans(
              color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20),
          textAlign: TextAlign.center,
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Stack(
                        children: [
                          // CircleAvatar(
                          //   foregroundColor: Colors.green,
                          //   radius: 70,
                          // backgroundImage: Image.file(
                          //   File(image?.path ?? ""),
                          //   fit: BoxFit.cover,
                          // ).image,
                          // ),
                          Container(
                              color: Colors.grey,
                              height: MediaQuery.of(context).size.height * 0.2,
                              width: MediaQuery.of(context).size.width * 0.2,
                              child: image != null
                                  ? Image.file(
                                      File(image?.path ?? ""),
                                      fit: BoxFit.cover,
                                    )
                                  : Container()),
                          image == null
                              ? Positioned(
                                  // right: 150,
                                  left: 20,
                                  bottom: 50,
                                  child: InkWell(
                                    onTap: () {
                                      pickImage();
                                    },
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.06,
                                      width:
                                          MediaQuery.of(context).size.height *
                                              0.06,
                                      decoration: BoxDecoration(
                                          color: Colors.grey[400],
                                          shape: BoxShape.circle),
                                      child: const Icon(Icons.add),
                                    ),
                                  ),
                                )
                              : Container()
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 5),
                        child: Stack(
                          children: [
                            // CircleAvatar(
                            //   foregroundColor: Colors.green,
                            //   radius: 70,
                            // backgroundImage: Image.file(
                            //   File(image?.path ?? ""),
                            //   fit: BoxFit.cover,
                            // ).image,
                            // ),
                            Container(
                                color: Colors.grey,
                                height:
                                    MediaQuery.of(context).size.height * 0.2,
                                width: MediaQuery.of(context).size.width * 0.2,
                                child: image1 != null
                                    ? Image.file(
                                        File(image1?.path ?? ""),
                                        fit: BoxFit.cover,
                                      )
                                    : Container()),
                            image1 == null
                                ? Positioned(
                                    // right: 150,
                                    left: 20,
                                    bottom: 50,
                                    child: InkWell(
                                      onTap: () {
                                        pickImage1();
                                      },
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.06,
                                        width:
                                            MediaQuery.of(context).size.height *
                                                0.06,
                                        decoration: BoxDecoration(
                                            color: Colors.grey[400],
                                            shape: BoxShape.circle),
                                        child: const Icon(Icons.add),
                                      ),
                                    ),
                                  )
                                : Container()
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 5),
                        child: Stack(
                          children: [
                            // CircleAvatar(
                            //   foregroundColor: Colors.green,
                            //   radius: 70,
                            // backgroundImage: Image.file(
                            //   File(image?.path ?? ""),
                            //   fit: BoxFit.cover,
                            // ).image,
                            // ),
                            Container(
                                color: Colors.grey,
                                height:
                                    MediaQuery.of(context).size.height * 0.2,
                                width: MediaQuery.of(context).size.width * 0.2,
                                child: image2 != null
                                    ? Image.file(
                                        File(image2?.path ?? ""),
                                        fit: BoxFit.cover,
                                      )
                                    : Container()),
                            image2 == null
                                ? Positioned(
                                    // right: 150,
                                    left: 20,
                                    bottom: 50,
                                    child: InkWell(
                                      onTap: () {
                                        pickImage2();
                                      },
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.06,
                                        width:
                                            MediaQuery.of(context).size.height *
                                                0.06,
                                        decoration: BoxDecoration(
                                            color: Colors.grey[400],
                                            shape: BoxShape.circle),
                                        child: const Icon(Icons.add),
                                      ),
                                    ),
                                  )
                                : Container()
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 5),
                        child: Stack(
                          children: [
                            // CircleAvatar(
                            //   foregroundColor: Colors.green,
                            //   radius: 70,
                            // backgroundImage: Image.file(
                            //   File(image?.path ?? ""),
                            //   fit: BoxFit.cover,
                            // ).image,
                            // ),
                            Container(
                                color: Colors.grey,
                                height:
                                    MediaQuery.of(context).size.height * 0.2,
                                width: MediaQuery.of(context).size.width * 0.2,
                                child: image3 != null
                                    ? Image.file(
                                        File(image3?.path ?? ""),
                                        fit: BoxFit.cover,
                                      )
                                    : Container()),
                            image3 == null
                                ? Positioned(
                                    // right: 150,
                                    left: 20,
                                    bottom: 50,
                                    child: InkWell(
                                      onTap: () {
                                        pickImage3();
                                      },
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.06,
                                        width:
                                            MediaQuery.of(context).size.height *
                                                0.06,
                                        decoration: BoxDecoration(
                                            color: Colors.grey[400],
                                            shape: BoxShape.circle),
                                        child: const Icon(Icons.add),
                                      ),
                                    ),
                                  )
                                : Container()
                          ],
                        ),
                      ),
                    ],
                  ),
                  Text("Video"),
                  Container(
                    margin: EdgeInsets.only(left: 5),
                    child: Stack(
                      children: [
                        // CircleAvatar(
                        //   foregroundColor: Colors.green,
                        //   radius: 70,
                        // backgroundImage: Image.file(
                        //   File(image?.path ?? ""),
                        //   fit: BoxFit.cover,
                        // ).image,
                        // ),

                        Container(
                            color: Colors.grey,
                            height: MediaQuery.of(context).size.height * 0.2,
                            width: MediaQuery.of(context).size.width,
                            child: _controller != null
                                ? _controller!.value.isInitialized
                                    ? VideoPlayer(
                                        _controller!,
                                      )
                                    : Container()
                                : Container()),

                        video == null
                            ? Positioned(
                                // right: 150,
                                left: 20,
                                bottom: 50,
                                child: InkWell(
                                  onTap: () {
                                    pickVideo();
                                  },
                                  child: Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.06,
                                    width: MediaQuery.of(context).size.height *
                                        0.06,
                                    decoration: BoxDecoration(
                                        color: Colors.grey[400],
                                        shape: BoxShape.circle),
                                    child: const Icon(Icons.add),
                                  ),
                                ),
                              )
                            : Container(),
                        video != null
                            ? FloatingActionButton(
                                onPressed: () {
                                  // Wrap the play or pause in a call to `setState`. This ensures the
                                  // correct icon is shown.
                                  setState(() {
                                    // If the video is playing, pause it.
                                    if (_controller != null) {
                                      if (_controller!.value.isPlaying) {
                                        _controller!.pause();
                                      } else {
                                        // If the video is paused, play it.
                                        _controller!.play();
                                      }
                                    }
                                  });
                                },
                                // Display the correct icon depending on the state of the player.
                                child: Icon(
                                  _controller!.value.isPlaying
                                      ? Icons.pause
                                      : Icons.play_arrow,
                                ),
                              )
                            : Container()
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.17,
                child: Card(
                  elevation: 3.0,
                  color: Colors.white,
                  shadowColor: Colors.black54,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Center(
                    child: TextFormField(
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.name,
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.04,
                      ),
                      onEditingComplete: () =>
                          FocusScope.of(context).nextFocus(),
                      controller: protypecontroller,
                      decoration: InputDecoration(
                          errorStyle: const TextStyle(height: 0),
                          contentPadding: const EdgeInsets.only(left: 10.0),
                          fillColor: Colors.white,
                          filled: true,
                          border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide.none,
                          ),
                          hintText: 'Property type',
                          hintStyle: TextStyle(
                            color: Colors.black,
                            fontSize: MediaQuery.of(context).size.width * 0.04,
                          )),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.18,
                child: Card(
                  elevation: 3.0,
                  color: Colors.white,
                  shadowColor: Colors.black54,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 13),
                      child: DropdownButtonFormField(
                          hint: Text(
                            "Select one",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.04,
                            ),
                          ),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                          validator: (value) =>
                              value == null ? "Select one" : null,
                          dropdownColor: Colors.white,
                          iconEnabledColor: Colors.black,
                          value: categoryvalue,
                          onChanged: (String? newValue) {
                            setState(() {
                              categoryvalue = newValue;
                            });
                          },
                          items: categoryname),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.17,
                    width: MediaQuery.of(context).size.width * 0.458,
                    child: Card(
                      elevation: 3.0,
                      color: Colors.white,
                      shadowColor: Colors.black54,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Center(
                        child: TextFormField(
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.04,
                          ),
                          onEditingComplete: () =>
                              FocusScope.of(context).nextFocus(),
                          controller: pricecontroller,
                          decoration: InputDecoration(
                              errorStyle: const TextStyle(height: 0),
                              contentPadding: const EdgeInsets.only(left: 10.0),
                              fillColor: Colors.white,
                              filled: true,
                              border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide.none,
                              ),
                              hintText: 'Price',
                              hintStyle: TextStyle(
                                color: Colors.black,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.04,
                              )),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.17,
                    width: MediaQuery.of(context).size.width * 0.458,
                    child: Card(
                      elevation: 3.0,
                      color: Colors.white,
                      shadowColor: Colors.black54,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Center(
                        child: TextFormField(
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.04,
                          ),
                          onEditingComplete: () =>
                              FocusScope.of(context).nextFocus(),
                          controller: areacontroller,
                          decoration: InputDecoration(
                              errorStyle: const TextStyle(height: 0),
                              contentPadding: const EdgeInsets.only(left: 10.0),
                              fillColor: Colors.white,
                              filled: true,
                              border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide.none,
                              ),
                              hintText: 'Area',
                              hintStyle: TextStyle(
                                color: Colors.black,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.04,
                              )),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.17,
                child: Card(
                  elevation: 3.0,
                  color: Colors.white,
                  shadowColor: Colors.black54,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Center(
                    child: TextFormField(
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.name,
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.04,
                      ),
                      onEditingComplete: () =>
                          FocusScope.of(context).nextFocus(),
                      controller: locationcontroller,
                      decoration: InputDecoration(
                          errorStyle: const TextStyle(height: 0),
                          contentPadding: const EdgeInsets.only(left: 10.0),
                          fillColor: Colors.white,
                          filled: true,
                          border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide.none,
                          ),
                          hintText: 'Location',
                          hintStyle: TextStyle(
                            color: Colors.black,
                            fontSize: MediaQuery.of(context).size.width * 0.04,
                          )),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Card(
                elevation: 3.0,
                color: Colors.white,
                shadowColor: Colors.black54,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Container(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.3,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    textAlign: TextAlign.justify,
                    controller: descriptioncontroller,
                    keyboardType: TextInputType.multiline,
                    maxLines: 100,
                    decoration: InputDecoration(
                      counterText: "",
                      isCollapsed: true,
                      hintText: "Add Description",
                      hintStyle: TextStyle(
                        color: Colors.black,
                        fontSize: MediaQuery.of(context).size.width * 0.04,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.17,
                child: Card(
                  elevation: 3.0,
                  color: Colors.white,
                  shadowColor: Colors.black54,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Center(
                    child: TextFormField(
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.04,
                      ),
                      onEditingComplete: () =>
                          FocusScope.of(context).nextFocus(),
                      controller: contactcontroller,
                      decoration: InputDecoration(
                          errorStyle: const TextStyle(height: 0),
                          contentPadding: const EdgeInsets.only(left: 10.0),
                          fillColor: Colors.white,
                          filled: true,
                          border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide.none,
                          ),
                          hintText: 'Contact',
                          hintStyle: TextStyle(
                            color: Colors.black,
                            fontSize: MediaQuery.of(context).size.width * 0.04,
                          )),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 40,
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.deepPurple),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(AppColors.dblue),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ))),
                  onPressed: () {
                    getAddproperty(
                            protypecontroller.text.toString(),
                            categoryvalue.toString(),
                            locationcontroller.text.toString(),
                            areacontroller.text.toString(),
                            pricecontroller.text.toString(),
                            descriptioncontroller.text.toString(),
                            contactcontroller.text.toString(),
                            (image!.path),
                            (image1!.path),
                            (image2!.path),
                            (image3!.path),
                            (video!.path))
                        .then((value) {
                      if (value.status == "success") {
                        Fluttertoast.showToast(
                          msg: "Property added",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.black,
                          textColor: Colors.white,
                          fontSize: 14,
                        );
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePage()));
                      }
                    });
                  },
                  child: Text(
                    "Add",
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.022,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future pickVideo() async {
    try {
      final video = await ImagePicker().pickVideo(source: ImageSource.gallery);
      if (video == null) return;
      final imageTemp = File(video.path);
      setState(() {
        this.video = imageTemp;
        _controller = VideoPlayerController.file(File(video.path))
          ..initialize().then((_) {
            // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
            setState(() {});
          });
      });
    } on PlatformException {
      // Print()
    }
  }

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } on PlatformException {
      // Print()
    }
  }

  Future pickImage1() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image1 = imageTemp);
    } on PlatformException {
      // Print()
    }
  }

  Future pickImage2() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image2 = imageTemp);
    } on PlatformException {
      // Print()
    }
  }

  Future pickImage3() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image3 = imageTemp);
    } on PlatformException {
      // Print()
    }
  }
}
