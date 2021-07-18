//import 'package:covid/widget/text.dart';
import 'package:covid/api/api.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:covid/widget/text.dart';

class GetVaccineRoute extends StatefulWidget {
  const GetVaccineRoute({Key? key}) : super(key: key);

  @override
  _GetVaccineRouteState createState() => _GetVaccineRouteState();
}

class _GetVaccineRouteState extends State<GetVaccineRoute> {
  late Map<dynamic, dynamic> state;
  @override
  void initState() {
    super.initState();
    GetStates().getVaccine().then((res) {
      setState(() {
        state = res;
      });
    });
    GetVaccine(600094).getVaccine();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var width = screenSize.width;
    var height = screenSize.height;
    var dropdownValue = "Select State";
    var state = [];

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
              height: height - 60,
              width: width,
              child: LayoutBuilder(builder:
                  (BuildContext context, BoxConstraints viewportConstraints) {
                return SingleChildScrollView(
                  child: Center(
                    child: Column(
                      children: [
                        TextMainNormal(
                            "The vaccine details available only for India",
                            12.00),
                        TextMainNormal(
                          "\nState",
                          18.00,
                        ),
                        DropdownButton(
                          value: dropdownValue,
                          hint: Text('Select country'),
                          onChanged: (String? newvalue) {},
                          items: <String>['One', 'Ten', 'Two', 'Free', 'Four']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
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
      TextMainNormal('Vaccine', 20),
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
