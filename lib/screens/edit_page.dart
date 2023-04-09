import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:realestate/constants/appcolors.dart';
import 'package:realestate/constants/baseurl.dart';
import 'package:realestate/models/myproperties_model.dart';
import 'package:realestate/services/edit_service.dart';

class editpage extends StatefulWidget {
  final Mypropertiesmodel model;
  const editpage({Key? key, required this.model}) : super(key: key);

  @override
  State<editpage> createState() => _editpageState();
}

class _editpageState extends State<editpage> {
  final TextEditingController priceController = new TextEditingController();
  final TextEditingController contactController = new TextEditingController();

  final TextEditingController descriptionController =
      new TextEditingController();

  String newprice = "";
  String newcontact = "";

  String newdescription = "";

  bool _status = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.purple,
        title: Text(
          "Edit",
          style: GoogleFonts.openSans(
              color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20),
          textAlign: TextAlign.center,
        ),
        elevation: 0,
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * .35,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(7.0)),
                ),
                child: Image.network(
                  baseurl + widget.model.img,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.55,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.grey[200],
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Edit property details',
                            style: TextStyle(
                                color: AppColors.dblue,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold),
                          ),
                          _status ? _getEditIcon() : new Container(),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Price',
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                      TextField(
                        controller: priceController,
                        enabled: !_status,
                        onChanged: (String value) {
                          newprice = value;
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Description',
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                      TextField(
                        controller: descriptionController,
                        enabled: !_status,
                        onChanged: (String value) {
                          newdescription = value;
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Contact',
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                      TextField(
                        controller: contactController,
                        enabled: !_status,
                        onChanged: (String value) {
                          newcontact = value;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      !_status ? _getActionButtons() : new Container(),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    String newcontact = widget.model.contact;
    String newprice = widget.model.price;

    String newdescription = widget.model.description;

    priceController.text = newprice;
    contactController.text = newcontact;

    descriptionController.text = newdescription;

    super.initState();
  }

  _getActionButtons() {
    return new Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(right: 25.0),
          child: Container(
              width: MediaQuery.of(context).size.width * .4,
              child: new ElevatedButton(
                style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.deepPurple),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.green),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ))),
                child: new Text(
                  "Save",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  getEditproperty(
                    widget.model.id.toString(),
                    priceController.text.toString(),
                    descriptionController.text.toString(),
                    contactController.text.toString(),
                  ).then((value) {
                    if (value.status == "success") {
                      Fluttertoast.showToast(
                        msg: "Updation successfull",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.black,
                        textColor: Colors.white,
                        fontSize: 14,
                      );
                      Navigator.pop(context);
                    }
                  });
                  setState(() {
                    _status = true;
                    FocusScope.of(context).requestFocus(new FocusNode());
                  });
                },
              )),
        ),
        Container(
            width: MediaQuery.of(context).size.width * .4,
            child: new ElevatedButton(
              child: new Text(
                "Cancel",
                style: TextStyle(color: Colors.white),
              ),
              style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.deepPurple),
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ))),
              onPressed: () {
                setState(() {
                  _status = true;
                  FocusScope.of(context).requestFocus(new FocusNode());
                });
              },
            )),
      ],
    );
  }

  _getEditIcon() {
    return new GestureDetector(
      child: new CircleAvatar(
        backgroundColor: Colors.red,
        radius: 14.0,
        child: new Icon(
          Icons.edit,
          color: Colors.white,
          size: 16.0,
        ),
      ),
      onTap: () {
        setState(() {
          _status = false;
        });
      },
    );
  }
}
