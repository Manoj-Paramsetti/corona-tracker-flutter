import 'package:covid/api/api.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:covid/widget/text.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

class GetVaccineRoute extends StatefulWidget {
  const GetVaccineRoute({Key? key}) : super(key: key);

  @override
  _GetVaccineRouteState createState() => _GetVaccineRouteState();
}

class _GetVaccineRouteState extends State<GetVaccineRoute> {
  var states = [
    {"state_id": 1, "state_name": "Andaman and Nicobar Islands"},
    {"state_id": 2, "state_name": "Andhra Pradesh"},
    {"state_id": 3, "state_name": "Arunachal Pradesh"},
    {"state_id": 4, "state_name": "Assam"},
    {"state_id": 5, "state_name": "Bihar"},
    {"state_id": 6, "state_name": "Chandigarh"},
    {"state_id": 7, "state_name": "Chhattisgarh"},
    {"state_id": 8, "state_name": "Dadra and Nagar Haveli"},
    {"state_id": 37, "state_name": "Daman and Diu"},
    {"state_id": 9, "state_name": "Delhi"},
    {"state_id": 10, "state_name": "Goa"},
    {"state_id": 11, "state_name": "Gujarat"},
    {"state_id": 12, "state_name": "Haryana"},
    {"state_id": 13, "state_name": "Himachal Pradesh"},
    {"state_id": 14, "state_name": "Jammu and Kashmir"},
    {"state_id": 15, "state_name": "Jharkhand"},
    {"state_id": 16, "state_name": "Karnataka"},
    {"state_id": 17, "state_name": "Kerala"},
    {"state_id": 18, "state_name": "Ladakh"},
    {"state_id": 19, "state_name": "Lakshadweep"},
    {"state_id": 20, "state_name": "Madhya Pradesh"},
    {"state_id": 21, "state_name": "Maharashtra"},
    {"state_id": 22, "state_name": "Manipur"},
    {"state_id": 23, "state_name": "Meghalaya"},
    {"state_id": 24, "state_name": "Mizoram"},
    {"state_id": 25, "state_name": "Nagaland"},
    {"state_id": 26, "state_name": "Odisha"},
    {"state_id": 27, "state_name": "Puducherry"},
    {"state_id": 28, "state_name": "Punjab"},
    {"state_id": 29, "state_name": "Rajasthan"},
    {"state_id": 30, "state_name": "Sikkim"},
    {"state_id": 31, "state_name": "Tamil Nadu"},
    {"state_id": 32, "state_name": "Telangana"},
    {"state_id": 33, "state_name": "Tripura"},
    {"state_id": 34, "state_name": "Uttar Pradesh"},
    {"state_id": 35, "state_name": "Uttarakhand"},
    {"state_id": 36, "state_name": "West Bengal"},
  ];
  Map<dynamic, dynamic> district = {
    "districts": [
      {"district_id": 3, "district_name": "Nicobar"},
      {"district_id": 1, "district_name": "North and Middle Andaman"},
      {"district_id": 2, "district_name": "South Andaman"}
    ],
    "ttl": 24
  };
  String intialValueState = "1";
  String districtId = "1";
  @override
  void initState() {
    super.initState();
    GetStates().getVaccine().then((res) {});
  }

  void getDistrict(String? stateId) {
    GetDistrict(stateId!).getVaccine().then((result) {
      setState(() {
        district = result;
      });
    });
  }

  var centers = [];
  bool card = false;
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var width = screenSize.width;
    var height = screenSize.height;
    String initialDistrictValue =
        district["districts"][0]["district_id"].toString();
    final _format = DateFormat('dd-MM-yyyy');

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            // Navbar
            navBar(context),

            // Body
            // Scrollable widget
            Container(
              padding: EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 5),
            ),
            SizedBox(
              height: height - 82,
              width: width,
              child: LayoutBuilder(builder:
                  (BuildContext context, BoxConstraints viewportConstraints) {
                return SingleChildScrollView(
                  child: Center(
                    child: Column(
                      children: [
                        Image(
                          width: 250,
                          height: 250,
                          image: AssetImage('assets/man_with_mask_logo.png'),
                        ),
                        TextMainNormal(
                            "The vaccine details available only for India",
                            12.00),
                        SizedBox(
                          width: 300,
                          child: Column(
                            children: [
                              DropdownButtonFormField(
                                decoration: InputDecoration(
                                    labelText: 'Select your state'),
                                value: intialValueState,
                                onChanged: (String? newvalue) {
                                  print(newvalue);
                                  getDistrict(newvalue);
                                  setState(() {
                                    card = false;
                                    intialValueState = newvalue!;
                                  });
                                },
                                items: states
                                    .map<DropdownMenuItem<String>>((value) {
                                  return DropdownMenuItem(
                                    value: value["state_id"].toString(),
                                    child: Text(value["state_name"].toString()),
                                  );
                                }).toList(),
                                hint: Text('Select your state'),
                              ),
                              DropdownButtonFormField(
                                decoration: InputDecoration(
                                    labelText: 'Select your district'),
                                value: initialDistrictValue.toString(),
                                onChanged: (String? newvalue) {
                                  setState(() {
                                    card = false;
                                    districtId = newvalue.toString();
                                    initialDistrictValue = newvalue.toString();
                                  });
                                },
                                items: district["districts"]
                                    .map<DropdownMenuItem<String>>((value) {
                                  return DropdownMenuItem(
                                    value: value["district_id"].toString(),
                                    child:
                                        Text(value["district_name"].toString()),
                                  );
                                }).toList(),
                              ),
                              DateTimeField(
                                format: _format,
                                onShowPicker: (context, currentvalue) {
                                  return showDatePicker(
                                      context: context,
                                      firstDate: DateTime(2021),
                                      initialDate: DateTime.now(),
                                      lastDate: DateTime(2024));
                                },
                                decoration: InputDecoration(
                                    labelText: "Select the date"),
                                onChanged: (date) {
                                  card = false;
                                  GetCenter(districtId, _format.format(date!))
                                      .getVaccine()
                                      .then((res) {
                                    setState(() {
                                      centers = res["sessions"];
                                    });
                                    print(res);
                                  });
                                },
                              ),
                              Padding(
                                padding: EdgeInsets.all(40),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    card = true;
                                  });
                                },
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.cyan),
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white),
                                ),
                                child: Text("Search Center"),
                              ),
                              Padding(
                                padding: EdgeInsets.all(20),
                              ),
                              LayoutBuilder(builder: (BuildContext context,
                                  BoxConstraints viewportConstraints) {
                                if (card) {
                                  return SizedBox(
                                    height: height * 0.7,
                                    child: ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: centers.length,
                                        itemBuilder: (context, int index) {
                                          return Container(
                                            padding: EdgeInsets.all(8),
                                            margin: EdgeInsets.all(6),
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(10),
                                                ),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey
                                                        .withOpacity(0.1),
                                                    spreadRadius: 2,
                                                    blurRadius: 7,
                                                    offset: Offset(1, 1),
                                                  )
                                                ]),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                RichText(
                                                    text: TextSpan(
                                                        style:
                                                            DefaultTextStyle.of(
                                                                    context)
                                                                .style,
                                                        children: [
                                                      TextSpan(
                                                        text: "Hospital Name: ",
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      TextSpan(
                                                          text: centers[index]
                                                              ["name"]),
                                                      TextSpan(
                                                        text: "\nAddress: ",
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      TextSpan(
                                                          text: centers[index]
                                                              ["address"]),
                                                      TextSpan(
                                                        text: "\nArea: ",
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      TextSpan(
                                                          text: centers[index]
                                                              ["block_name"]),
                                                      TextSpan(
                                                        text: "\nFee Type: ",
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      TextSpan(
                                                          text: centers[index]
                                                              ["fee_type"]),
                                                      TextSpan(
                                                        text: "\nDate: ",
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      TextSpan(
                                                          text: centers[index]
                                                              ["date"]),
                                                      TextSpan(
                                                        text: "\nFee: ",
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      TextSpan(
                                                          text: centers[index]
                                                              ["fee"]),
                                                    ])),
                                              ],
                                            ),
                                          );
                                        }),
                                  );
                                } else {
                                  return Container();
                                }
                              }),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
        drawer: drawerVaccine(context),
      ),
    );
  }

  Drawer drawerVaccine(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Stack(
              children: [
                Image(
                  image: NetworkImage(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZ9-FOkOmBBfNqIBPa-zvUxw_pvveKdaI0oQ&usqp=CAU"),
                  fit: BoxFit.fitWidth,
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Center(child: TextMainNormal("About Corona", 12)),
            ListTile(
              title: TextMainNormal('Symptoms', 14),
              onTap: () {
                Navigator.popAndPushNamed(context, '/symptoms');
              },
            ),
            ListTile(
              title: TextMainNormal('Safety Measure', 14),
              onTap: () {
                Navigator.popAndPushNamed(context, '/safety');
              },
            ),
            ListTile(
              title: TextMainNormal('Home treatment', 14),
              onTap: () {
                Navigator.popAndPushNamed(context, '/treatment');
              },
            ),
            ListTile(
              title: TextMainNormal('About Vaccine', 14),
              onTap: () {
                Navigator.popAndPushNamed(context, '/safety');
              },
            ),
            ListTile(
              title: TextMainNormal('Find Vaccine', 14),
              onTap: () {
                Navigator.popAndPushNamed(context, '/getvaccine');
              },
            ),
            SizedBox(
              height: 40,
            ),
            Center(child: TextMainNormal("Other", 12)),
            ListTile(
              title: TextMainNormal('About this app', 14),
              onTap: () {
                showDialog(
                    context: context,
                    barrierDismissible: true,
                    builder: (context) {
                      return (AlertDialog(
                        title: TextMain("COVID-19 Tracker App", 18),
                        content: TextMainNormal(
                            "\"This COVID app is used to show the coronavirus status, precaution, and safety measure\"\n\nThis App is created by Manoj Paramsetti",
                            12),
                        elevation: 6,
                      ));
                    });
              },
            ),
            ListTile(
              title: TextMainNormal('Add corona discord bot', 14),
              onTap: _launchURL,
            ),
          ],
        ),
      ),
    );
  }
}

class Async {}

Row navBar(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      IconButton(
        onPressed: () {
          Navigator.popAndPushNamed(context, '/Home');
        },
        icon: Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
        iconSize: 24,
      ),
      TextMainNormal('Find Vaccine Center', 20),
      Padding(padding: EdgeInsets.all(16)),
    ],
  );
}

_launchURL() async {
  const url =
      'https://discord.com/api/oauth2/authorize?client_id=835763513100206100&permissions=2147560448&scope=bot';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
