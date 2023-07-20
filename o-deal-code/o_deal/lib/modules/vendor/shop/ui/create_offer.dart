import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:o_deal/components/od_button.dart';
import 'package:o_deal/core/data/notifiers/auth_state.dart';
import 'package:o_deal/data/models/product.dart';
import 'package:o_deal/data/notifiers/offer_state.dart';
import 'package:o_deal/modules/vendor/shop/widgets/item_card.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:elegant_radio_button_group/elegant_radio_button_group.dart';
import 'package:flutter/services.dart';
import 'package:custom_check_box/custom_check_box.dart';
import 'package:intl/intl.dart';
import 'package:o_deal/core/navigation/routing.dart';
import 'package:provider/provider.dart';
import 'package:o_deal/data/notifiers/store_state.dart';

class CreateOfferScreen extends StatefulWidget {
  const CreateOfferScreen({Key? key}) : super(key: key);

  @override
  _CreateOfferScreenState createState() => _CreateOfferScreenState();
}

class _CreateOfferScreenState extends State<CreateOfferScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController productController = TextEditingController();
  Product? product;
  TextEditingController descriptionController = TextEditingController();
  TextEditingController discountController = TextEditingController();
  TextEditingController discountTypeController = TextEditingController();
  TextEditingController otherOfferController = TextEditingController();
  TextEditingController startTimeController = TextEditingController();
  TextEditingController endTimeController = TextEditingController();
  bool justForTodayController = false;
  TextEditingController weekdaysController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  bool draftController = false;

  @override
  void initState() {
    nameController.text = "";
    descriptionController.text = "";
    startTimeController.text = "";
    endTimeController.text = "";
    startDateController.text = "";
    endDateController.text = "";
    weekdaysController.text = "1";
    discountController.text = "1";
    productController.text = "";
    super.initState();
  }

  Color _containerColor = Colors.white;
  String? selectedValue;
  String? selectedWeekday;
  int val = -1;
  bool shouldCheck = false;
  bool shouldCheckDefault = false;
  @override
  Widget build(BuildContext context) {
    StoreState ss = Provider.of<StoreState>(context);
    return SafeArea(
        child: Scaffold(
            backgroundColor: Color(0xFFFFFFFF),
            appBar: AppBar(
              toolbarHeight: 80,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25.0),
                  bottomRight: Radius.circular(25.0)
                )
              ),
              // elevation: 8,
              centerTitle: true,
              backgroundColor: Color(0xFFCB212E),
              leading: InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        Routes.vendorShop, (_) => false);
                  },
                  child: Icon(Icons.arrow_back)),
              title: Text(
                ss.store!.name.toString()+"-Create Offer",
                style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFFFFFFFF)),
              ),
            ),
            body: Container(
                child: ListView(children: [
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Offer Tittle:",
                          style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF1F1F1F)),
                        ),
                        SizedBox(height: 9),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(11),
                          decoration: BoxDecoration(
                              color: Color(0xFFEDF3F6),
                              borderRadius: BorderRadius.circular(10)),
                          child: TextFormField(
                            decoration: new InputDecoration.collapsed(
                              hintText: 'Offer Name',
                              border: InputBorder.none,
                            ),
                            controller: nameController,
                            // initialValue: "Product Name",
                            style: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF1F1F1F)),
                          ),
                        ),
                        SizedBox(
                          height: 14,
                        ),
                        RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: "Product Image: ",
                                  style: GoogleFonts.poppins(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xFF1F1F1F))),
                              TextSpan(
                                  text: " (Max 5)",
                                  style: GoogleFonts.poppins(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xFF1F1F1F))),
                            ],
                          ),
                        ),
                        // SizedBox(height:10),
                        SizedBox(height: 10),
                        GridView.count(
                            physics: const ScrollPhysics(),
                            crossAxisCount: 3,
                            childAspectRatio:
                                MediaQuery.of(context).size.width /
                                    (MediaQuery.of(context).size.height * 0.5),
                            crossAxisSpacing: 1.0,
                            mainAxisSpacing: 8.0,
                            shrinkWrap: true,
                            children: [
                              Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/border.png"))),
                            child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image(image:AssetImage("assets/icons/gallery.png"),height:30),
                                    SizedBox(height: 9),
                                    SizedBox(
                                      width:100,
                                      child:Text(
                                        "Add Product Gallery",
                                        textAlign:TextAlign.center,
                                        style: GoogleFonts.poppins(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFF1F1F1F)),
                                      ),
                                    )
                                  ]
                                )
                              ),
                              Image(
                                  image: AssetImage(
                                      "assets/images/product-1.png")),
                              Image(
                                  image: AssetImage(
                                      "assets/images/product-2.png")),
                              Image(
                                  image: AssetImage(
                                      "assets/images/product-3.png")),
                              Image(
                                  image: AssetImage(
                                      "assets/images/product-4.png")),
                              const Image(
                                  image: AssetImage(
                                      "assets/images/product-5.png")),
                            ]),
                        SizedBox(height: 20),
                        RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: "Description of offer",
                                  style: GoogleFonts.poppins(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xFF1F1F1F))),
                              TextSpan(
                                  text: " (100 words only)",
                                  style: GoogleFonts.poppins(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xFF1F1F1F))),
                            ],
                          ),
                        ),
                        SizedBox(height: 9),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(11),
                          decoration: BoxDecoration(
                              color: Color(0xFFEDF3F6),
                              borderRadius: BorderRadius.circular(10)),
                          child: TextFormField(
                             maxLength: 100,
                            decoration: new InputDecoration.collapsed(
                              hintText: 'Description',
                              border: InputBorder.none,
                            ),
                            controller: descriptionController,
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            style: GoogleFonts.poppins(
                              fontSize: 11,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF1F1F1F),
                            ),

                            // initialValue:
                            //     "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                          ),
                          // Text(
                          //   "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                          //   style: GoogleFonts.poppins(
                          //       fontSize: 11,
                          //       fontWeight: FontWeight.w400,
                          //       color: Color(0xFF1F1F1F)),
                          // ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          "Discount of offer",
                          style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF1F1F1F)),
                        ),
                        SizedBox(height: 10),
                        SizedBox(
                          // height:20,
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton2<String>(
                              hint: Text(
                                '10%',
                                style: TextStyle(
                                    fontSize: 14, color: Color(0xFF1F1F1F)),
                              ),
                              items: [
                                DropdownMenuItem(
                                    child: Text("10%",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 15)),
                                    value: "1"),
                                DropdownMenuItem(
                                    child: Text("20%",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 15)),
                                    value: "2"),
                                DropdownMenuItem(
                                    child: Text("30%",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 15)),
                                    value: "3"),
                                DropdownMenuItem(
                                    child: Text("40%",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 15)),
                                    value: "4"),
                              ],
                              value: discountController.text,
                              onChanged: (value) {
                                setState(() {
                                  discountController.text = value as String;
                                });
                              },
                              // iconSize: 30,
                              // buttonHeight: 46,
                              // buttonWidth: MediaQuery.of(context).size.width,
                              // itemHeight: 50,
                              // dropdownDecoration: BoxDecoration(
                              //   borderRadius: BorderRadius.circular(4),
                              // ),
                              // buttonPadding:
                              //     EdgeInsets.only(left: 20, right: 20),
                              // buttonDecoration: BoxDecoration(
                              //     borderRadius: BorderRadius.circular(10),
                              //     color: Color(0xFFFFFFFF)),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                            child: Column(children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(children: [
                                  SizedBox(
                                    height: 23,
                                    width: 23,
                                    child: Radio(
                                      fillColor: MaterialStateColor.resolveWith(
                                          (states) => Color(0xFFCB212E)),
                                      materialTapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                      value: 1,
                                      groupValue: val,
                                      onChanged: (value) {
                                        setState(() {
                                          val = value?.toInt() ?? 0;
                                        });
                                      },
                                    ),
                                  ),
                                  Text(
                                    " On this purchase ",
                                    style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xFF1F1F1F)),
                                  ),
                                ]),
                                Row(children: [
                                  SizedBox(
                                    height: 23,
                                    width: 23,
                                    child: Radio(
                                      fillColor: MaterialStateColor.resolveWith(
                                          (states) => Color(0xFFCB212E)),
                                      materialTapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                      value: 2,
                                      groupValue: val,
                                      onChanged: (value) {
                                        setState(() {
                                          val = value?.toInt() ?? 0;
                                        });
                                      },
                                    ),
                                  ),
                                  Text(
                                    " On next purchase",
                                    style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xFF1F1F1F)),
                                  ),
                                ]),
                              ]),
                          SizedBox(height: 20),
                          Row(children: [
                            SizedBox(
                              height: 23,
                              width: 23,
                              child: Radio(
                                fillColor: MaterialStateColor.resolveWith(
                                    (states) => Color(0xFFCB212E)),
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                value: 3,
                                groupValue: val,
                                onChanged: (value) {
                                  setState(() {
                                    val = value?.toInt() ?? 0;
                                  });
                                },
                              ),
                            ),
                            Text(
                              " Buy 1 Get 1 Free",
                              style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF1F1F1F)),
                            ),
                          ]),
                        ])),
                        SizedBox(height: 20),
                        Text(
                          "Other Offer",
                          style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF1F1F1F)),
                        ),
                        SizedBox(height: 9),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(11),
                          decoration: BoxDecoration(
                              color: Color(0xFFEDF3F6),
                              borderRadius: BorderRadius.circular(10)),
                          child: TextFormField(
                            decoration: new InputDecoration.collapsed(
                              hintText: 'Other Offer',
                              border: InputBorder.none,
                            ),
                            controller: otherOfferController,
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            style: GoogleFonts.poppins(
                              fontSize: 11,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF1F1F1F),
                            ),

                            // initialValue:
                            //     "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                          ),
                          // Text(
                          //   "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                          //   style: GoogleFonts.poppins(
                          //       fontSize: 11,
                          //       fontWeight: FontWeight.w400,
                          //       color: Color(0xFF1F1F1F)),
                          // ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          "Offer Time:",
                          style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF1F1F1F)),
                        ),
                        SizedBox(height: 10),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Start Time",
                                      style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFF1F1F1F)),
                                    ),
                                    SizedBox(height: 10),
                                    Container(
                                      height: 46,
                                      child: TextField(
                                          controller: startTimeController,
                                          inputFormatters: [
                                            LengthLimitingTextInputFormatter(5),
                                          ],
                                          // keyboardType: TextInputType.phone,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            suffixIcon: Container(
                                              margin: EdgeInsets.all(5),
                                              padding: EdgeInsets.all(6),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  color: Color(0xFFCB212E)),
                                              child: Text(
                                                "AM",
                                                textAlign: TextAlign.center,
                                                style: GoogleFonts.poppins(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                    color: Color(0xFFFFFFFF)),
                                              ),
                                            ),
                                            border: InputBorder.none,
                                            filled: true,
                                            fillColor: Color(0xFFEDF3F6),
                                            constraints:
                                                BoxConstraints.tightFor(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.4,
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                color: Color(0xFFCB212E),
                                                width: 1.0,
                                              ),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                color: Color(0xFFF6F6F6),
                                                width: 1.0,
                                              ),
                                            ),
                                          )),
                                    ),
                                  ]),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "End Time",
                                      style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFF1F1F1F)),
                                    ),
                                    SizedBox(height: 10),
                                    Container(
                                      height: 46,
                                      child: TextField(
                                          controller: endTimeController,
                                          inputFormatters: [
                                            LengthLimitingTextInputFormatter(5),
                                          ],
                                          // keyboardType: TextInputType.phone,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            suffixIcon: Container(
                                              margin: EdgeInsets.all(5),
                                              padding: EdgeInsets.all(6),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  color: Color(0xFFCB212E)),
                                              child: Text(
                                                "PM",
                                                textAlign: TextAlign.center,
                                                style: GoogleFonts.poppins(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                    color: Color(0xFFFFFFFF)),
                                              ),
                                            ),
                                            border: InputBorder.none,
                                            filled: true,
                                            fillColor: Color(0xFFEDF3F6),
                                            constraints:
                                                BoxConstraints.tightFor(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.4,
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                color: Color(0xFFF6F6F6),
                                                width: 1.0,
                                              ),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                color: Color(0xFFF6F6F6),
                                                width: 1.0,
                                              ),
                                            ),
                                          )),
                                    ),
                                  ]),
                            ]),
                        SizedBox(height: 10),
                        Row(children: [
                          CustomCheckBox(
                            value: justForTodayController,
                            shouldShowBorder: true,
                            borderColor: Color(0xFFCB212E),
                            checkedFillColor: Color(0xFFCB212E),
                            borderRadius: 4,
                            borderWidth: 1,
                            checkBoxSize: 18,
                            onChanged: (val) {
                              //do your stuff here
                              setState(() {
                                justForTodayController = val;
                              });
                            },
                          ),
                          Text(
                            "Just for today",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF1F1F1F)),
                          ),
                        ]),
                        SizedBox(height: 20),
                        Text(
                          "Week Day Offer",
                          style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF1F1F1F)),
                        ),
                        SizedBox(height: 10),
                        SizedBox(
                          // height:20,
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton2<String>(
                              hint: Text(
                                'Sunday |  Monday  |  Wednesday',
                                style: TextStyle(
                                    fontSize: 14, color: Color(0xFF1F1F1F)),
                              ),
                              items: [
                                DropdownMenuItem(
                                    child: Text(
                                        "Sunday |  Monday  |  Wednesday",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 15)),
                                    value: "1"),
                                DropdownMenuItem(
                                    child: Text(
                                        "Sunday |  Monday  |  Wednesday",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 15)),
                                    value: "2"),
                                DropdownMenuItem(
                                    child: Text(
                                        "Sunday |  Monday  |  Wednesday",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 15)),
                                    value: "3"),
                                DropdownMenuItem(
                                    child: Text(
                                        "Sunday |  Monday  |  Wednesday",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 15)),
                                    value: "4"),
                              ],
                              value: weekdaysController.text,
                              onChanged: (value) {
                                setState(() {
                                  weekdaysController.text = value as String;
                                });
                              },
                              // iconSize: 30,
                              // buttonHeight: 46,
                              // buttonWidth: MediaQuery.of(context).size.width,
                              // itemHeight: 50,
                              // dropdownDecoration: BoxDecoration(
                              //   borderRadius: BorderRadius.circular(4),
                              // ),
                              // buttonPadding:
                              //     EdgeInsets.only(left: 20, right: 20),
                              // buttonDecoration: BoxDecoration(
                              //     borderRadius: BorderRadius.circular(10),
                              //     color: Color(0xFFFFFFFF)),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          "Offer Date:",
                          style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF1F1F1F)),
                        ),
                        SizedBox(height: 10),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Start Date",
                                      style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFF1F1F1F)),
                                    ),
                                    SizedBox(height: 10),
                                    Container(
                                        height: 50,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Color(0xFFFFFFFF)),
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.4,
                                        child: SizedBox(
                                          child: TextField(
                                              style: TextStyle(fontSize: 12),
                                              controller: startDateController,
                                              onTap: () async {
                                                DateTime? pickedDate =
                                                    await showDatePicker(
                                                        context: context,
                                                        initialDate:
                                                            DateTime.now(),
                                                        firstDate: DateTime(
                                                            2022), //DateTime.now() - not to allow to choose before today.
                                                        lastDate:
                                                            DateTime(2101));

                                                if (pickedDate != null) {
                                                  print(
                                                      pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                                  String formattedDate =
                                                      DateFormat('yyyy-MM-dd')
                                                          .format(pickedDate);
                                                  print(
                                                      formattedDate); //formatted date output using intl package =>  2021-03-16
                                                  //you can implement different kind of Date Format here according to your requirement

                                                  setState(() {
                                                    startDateController.text =
                                                        formattedDate; //set output date to TextField value.
                                                  });
                                                } else {
                                                  print("Date is not selected");
                                                }
                                              },
                                              readOnly: true,
                                              inputFormatters: [
                                                LengthLimitingTextInputFormatter(
                                                    10),
                                              ],
                                              keyboardType: TextInputType.phone,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                hintText: "11/20/2022",
                                                suffixIcon: Icon(
                                                    Icons.date_range,
                                                    color: Color(0xFFCB212E)),
                                                constraints:
                                                    BoxConstraints.tightFor(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.4,
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  borderSide: BorderSide(
                                                    color: Color(0xFFFFFFFF),
                                                  ),
                                                ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  borderSide: BorderSide(
                                                    color: Color(0xFFFFFFFF),
                                                    width: 10.0,
                                                  ),
                                                ),
                                              )),
                                        )),
                                  ]),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "End Date",
                                      style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFF1F1F1F)),
                                    ),
                                    SizedBox(height: 10),
                                    Container(
                                        height: 50,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Color(0xFFFFFFFF)),
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.4,
                                        child: SizedBox(
                                          child: TextField(
                                              style: TextStyle(fontSize: 12),
                                              controller: endDateController,
                                              onTap: () async {
                                                DateTime? pickedDate =
                                                    await showDatePicker(
                                                        context: context,
                                                        initialDate:
                                                            DateTime.now(),
                                                        firstDate: DateTime(
                                                            2022), //DateTime.now() - not to allow to choose before today.
                                                        lastDate:
                                                            DateTime(2101));

                                                if (pickedDate != null) {
                                                  print(
                                                      pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                                  String formattedDate =
                                                      DateFormat('yyyy-MM-dd')
                                                          .format(pickedDate);
                                                  print(
                                                      formattedDate); //formatted date output using intl package =>  2021-03-16
                                                  //you can implement different kind of Date Format here according to your requirement

                                                  setState(() {
                                                    endDateController.text =
                                                        formattedDate; //set output date to TextField value.
                                                  });
                                                } else {
                                                  print("Date is not selected");
                                                }
                                              },
                                              readOnly: true,
                                              inputFormatters: [
                                                LengthLimitingTextInputFormatter(
                                                    10),
                                              ],
                                              keyboardType: TextInputType.phone,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                hintText: "11/20/2022",
                                                suffixIcon: Icon(
                                                    Icons.date_range,
                                                    color: Color(0xFFCB212E)),
                                                constraints:
                                                    BoxConstraints.tightFor(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.4,
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  borderSide: BorderSide(
                                                    color: Color(0xFFFFFFFF),
                                                  ),
                                                ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  borderSide: BorderSide(
                                                    color: Color(0xFFFFFFFF),
                                                    width: 10.0,
                                                  ),
                                                ),
                                              )),
                                        )),
                                  ]),
                            ]),
                        SizedBox(height: 30),
                        SizedBox(
                          height: 48,
                          // width: MediaQuery.of(context).size.width * 0.4,
                          child: ODButton(
                            disabled: false,
                            title: "SAVE THE DEAL FOR FUTURE",
                            onTap: () async {
                              authstate state = Provider.of<authstate>(context,
                                  listen: false);
                              draftController = true;
                              var data = {
                                "name": nameController.text,
                                "product_id": productController.text,
                                "store_id": state.user.id,
                                "description": descriptionController.text,
                                "discount": int.parse(discountController.text),
                                "discount_type": discountTypeController.text,
                                "other_offer": otherOfferController.text,
                                "start_time": startTimeController.text,
                                "end_time": endTimeController.text,
                                "weekdays": weekdaysController.text,
                                "start_date": startDateController.text,
                                "end_date": endDateController.text,
                                "just_for_today": justForTodayController,
                                "draft": draftController,
                              };
                              OfferState os = Provider.of<OfferState>(context,
                                  listen: false);
                              await os.addOffer(ID.unique(), data, context);
                              Navigator.popAndPushNamed(
                                  context, Routes.vendorShop);
                            },
                            titleColor: const Color(0xFFFFFFFF),
                            buttonBackgroundColor: const Color(0xFF1F1F1F),
                            borderColor: const Color(0xFFFFFF),
                            borderRadius: 10,
                            titleFontSize: 15,
                          ),
                        ),
                        SizedBox(height: 10),
                        SizedBox(
                          height: 48,
                          // width: MediaQuery.of(context).size.width * 0.4,
                          child: ODButton(
                            disabled: false,
                            title: "GO LIVE",
                            onTap: () {},
                            titleColor: const Color(0xFFFFFFFF),
                            buttonBackgroundColor: const Color(0xFFCB212E),
                            borderColor: const Color(0xFFFFFF),
                            borderRadius: 10,
                            titleFontSize: 15,
                          ),
                        ),
                      ])),
              SizedBox(height: 20),
            ]))));
  }
}
