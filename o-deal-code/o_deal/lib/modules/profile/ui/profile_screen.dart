import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:core';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';
import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:day_night_time_picker/lib/constants.dart';
import 'package:o_deal/core/navigation/routing.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TimeOfDay _time = TimeOfDay.now();

  void onTimeChanged(TimeOfDay newTime) {
    setState(() {
      _time = newTime;
    });
  }

  double _value = 40.0;
  int val = -1;
  String? selectedValue;
  TextEditingController dateinput = TextEditingController();
  TextEditingController timeInput = TextEditingController();
  //text editing controller for text field

  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field
    timeInput.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xFFEDF3F6),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFFCB212E),
        leading: InkWell(
            onTap: () {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil(Routes.radar, (_) => false);
            },
            child: Icon(Icons.arrow_back, color: Color(0xFFFFFFFF))),
        title: Text(
          "Profile",
          style: GoogleFonts.poppins(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: Color(0xFFFFFFFF)),
        ),
      ),
      body: Container(
          child: ListView(children: []
              //     [
              //   Container(
              //       padding: EdgeInsets.symmetric(horizontal: 22, vertical: 20),
              //       child:
              //           Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              //         Text(
              //           "Range in kilometer",
              //           style: GoogleFonts.poppins(
              //               fontSize: 15,
              //               fontWeight: FontWeight.w400,
              //               color: Color(0xFF1F1F1F)),
              //         ),
              //         SizedBox(height: 20),
              //         Container(
              //           height: 20,
              //           width: MediaQuery.of(context).size.width,
              //           child: SfSlider(
              //             min: 0.0,
              //             max: 100.0,
              //             value: _value,
              //             interval: 20,
              //             // showLabels: true,
              //             enableTooltip: true,
              //             tooltipShape: SfPaddleTooltipShape(),
              //             minorTicksPerInterval: 0,
              //             onChanged: (dynamic value) {
              //               setState(() {
              //                 _value = value;
              //               });
              //             },
              //           ),
              //         ),
              //         SizedBox(height: 24),
              //         Container(
              //             child: Column(
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: [
              //               Text(
              //                 "Select Category",
              //                 style: GoogleFonts.poppins(
              //                     fontSize: 15,
              //                     fontWeight: FontWeight.w400,
              //                     color: Color(0xFF1F1F1F)),
              //               ),
              //               SizedBox(height: 13),
              //               SizedBox(
              //                 // height:20,
              //                 child: DropdownButtonHideUnderline(
              //                   child: DropdownButton2<String>(
              //                     hint: Text(
              //                       'Food',
              //                       style: TextStyle(
              //                           fontSize: 14, color: Color(0xFF1F1F1F)),
              //                     ),
              //                     items: [
              //                       DropdownMenuItem(
              //                           child: Text("Food",
              //                               textAlign: TextAlign.center,
              //                               style: TextStyle(fontSize: 15)),
              //                           value: "1"),
              //                       DropdownMenuItem(
              //                           child: Text("2",
              //                               textAlign: TextAlign.center,
              //                               style: TextStyle(fontSize: 15)),
              //                           value: "2"),
              //                       DropdownMenuItem(
              //                           child: Text("3",
              //                               textAlign: TextAlign.center,
              //                               style: TextStyle(fontSize: 15)),
              //                           value: "3"),
              //                       DropdownMenuItem(
              //                           child: Text("4",
              //                               textAlign: TextAlign.center,
              //                               style: TextStyle(fontSize: 15)),
              //                           value: "4"),
              //                     ],
              //                     value: selectedValue,
              //                     onChanged: (value) {
              //                       setState(() {
              //                         selectedValue = value as String;
              //                       });
              //                     },
              //                     iconSize: 30,
              //                     buttonHeight: 46,
              //                     buttonWidth: MediaQuery.of(context).size.width,
              //                     itemHeight: 50,
              //                     dropdownDecoration: BoxDecoration(
              //                       borderRadius: BorderRadius.circular(4),
              //                     ),
              //                     buttonPadding: EdgeInsets.only(left: 20, right: 20),
              //                     buttonDecoration: BoxDecoration(
              //                         borderRadius: BorderRadius.circular(10),
              //                         color: Color(0xFFFFFFFF)),
              //                   ),
              //                 ),
              //               ),
              //             ])),
              //         SizedBox(height: 24),
              //         Container(
              //             child: Column(
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: [
              //               Text(
              //                 "Select Date",
              //                 style: GoogleFonts.poppins(
              //                     fontSize: 15,
              //                     fontWeight: FontWeight.w400,
              //                     color: Color(0xFF1F1F1F)),
              //               ),
              //               SizedBox(height: 13),
              //               Container(
              //                   height: 50,
              //                   decoration: BoxDecoration(
              //                       borderRadius: BorderRadius.circular(10),
              //                       color: Color(0xFFFFFFFF)),
              //                   width: MediaQuery.of(context).size.width,
              //                   child: SizedBox(
              //                     child: TextField(
              //                         controller: dateinput,
              //                         onTap: () async {
              //                           DateTime? pickedDate = await showDatePicker(
              //                               context: context,
              //                               initialDate: DateTime.now(),
              //                               firstDate: DateTime(
              //                                   2022), //DateTime.now() - not to allow to choose before today.
              //                               lastDate: DateTime(2101));

              //                           if (pickedDate != null) {
              //                             print(
              //                                 pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
              //                             String formattedDate =
              //                                 DateFormat('yyyy-MM-dd')
              //                                     .format(pickedDate);
              //                             print(formattedDate);

              //                             setState(() {
              //                               dateinput.text =
              //                                   formattedDate; //set output date to TextField value.
              //                             });
              //                           } else {
              //                             print("Date is not selected");
              //                           }
              //                         },
              //                         readOnly: true,
              //                         inputFormatters: [
              //                           LengthLimitingTextInputFormatter(10),
              //                         ],
              //                         keyboardType: TextInputType.phone,
              //                         obscureText: false,
              //                         decoration: InputDecoration(
              //                           hintText: "11/20/2022",
              //                           suffixIcon: Icon(Icons.date_range,
              //                               color: Color(0xFF5E5E5E)),
              //                           constraints: BoxConstraints.tightFor(
              //                             width: MediaQuery.of(context).size.width,
              //                           ),
              //                           focusedBorder: OutlineInputBorder(
              //                             borderRadius: BorderRadius.circular(10),
              //                             borderSide: BorderSide(
              //                               color: Color(0xFFFFFFFF),
              //                             ),
              //                           ),
              //                           enabledBorder: OutlineInputBorder(
              //                             borderRadius: BorderRadius.circular(10),
              //                             borderSide: BorderSide(
              //                               color: Color(0xFFFFFFFF),
              //                               width: 10.0,
              //                             ),
              //                           ),
              //                         )),
              //                   )),
              //             ])),
              //         SizedBox(height: 24),
              //         Container(
              //             child: Column(
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: [
              //               Text(
              //                 "Select Time",
              //                 style: GoogleFonts.poppins(
              //                     fontSize: 15,
              //                     fontWeight: FontWeight.w400,
              //                     color: Color(0xFF1F1F1F)),
              //               ),
              //               SizedBox(height: 13),
              //               Container(
              //                   height: 50,
              //                   decoration: BoxDecoration(
              //                       borderRadius: BorderRadius.circular(10),
              //                       color: Color(0xFFFFFFFF)),
              //                   width: MediaQuery.of(context).size.width,
              //                   child: SizedBox(
              //                     child: TextField(
              //                         controller: timeInput,
              //                         onTap: () async {
              //                           Navigator.of(context).push(
              //                             showPicker(
              //                               context: context,
              //                               value: _time,
              //                               onChange: onTimeChanged,
              //                               minuteInterval: MinuteInterval.FIVE,
              //                               // Optional onChange to receive value as DateTime
              //                               onChangeDateTime: (DateTime time) {
              //                                 print(time);
              //                                 String formattedTime =
              //                                     DateFormat('HH:mm').format(time);
              //                                 print(formattedTime);

              //                                 setState(() {
              //                                   timeInput.text = formattedTime;
              //                                 });
              //                               },
              //                             ),
              //                           );
              //                         },
              //                         readOnly: true,
              //                         decoration: InputDecoration(
              //                           hintText: "12:45",
              //                           suffixIcon: Icon(Icons.date_range,
              //                               color: Color(0xFF5E5E5E)),
              //                           constraints: BoxConstraints.tightFor(
              //                             width: MediaQuery.of(context).size.width,
              //                           ),
              //                           focusedBorder: OutlineInputBorder(
              //                             borderRadius: BorderRadius.circular(10),
              //                             borderSide: BorderSide(
              //                               color: Color(0xFFFFFFFF),
              //                             ),
              //                           ),
              //                           enabledBorder: OutlineInputBorder(
              //                             borderRadius: BorderRadius.circular(10),
              //                             borderSide: BorderSide(
              //                               color: Color(0xFFFFFFFF),
              //                               width: 10.0,
              //                             ),
              //                           ),
              //                         )),
              //                   )),
              //             ])),
              //         SizedBox(height: 20),
              //         SizedBox(height: 20),
              //       ]))
              // ]

              )),
    ));
  }
}
