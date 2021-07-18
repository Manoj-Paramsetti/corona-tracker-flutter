import 'package:covid/api/api.dart';
import 'package:covid/widget/countup.dart';
import 'package:flutter/material.dart';
import 'package:covid/widget/text.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  var active = 0;
  var recovered = 0;
  var deaths = 0;
  var countries = [
    'global',
    'Afghanistan',
    'Albania',
    'Algeria',
    'Andorra',
    'Angola',
    'Antigua and Barbuda',
    'Argentina',
    'Armenia',
    'Australia',
    'Austria',
    'Azerbaijan',
    'Bahamas',
    'Bahrain',
    'Bangladesh',
    'Barbados',
    'Belarus',
    'Belgium',
    'Belize',
    'Benin',
    'Bhutan',
    'Bolivia',
    'Bosnia and Herzegovina',
    'Botswana',
    'Brazil',
    'Brunei',
    'Bulgaria',
    'Burkina Faso',
    'Burma',
    'Burundi',
    'Cabo Verde',
    'Cambodia',
    'Cameroon',
    'Canada',
    'Central African Republic',
    'Chad',
    'Chile',
    'China',
    'Colombia',
    'Comoros',
    'Congo (Brazzaville)',
    'Congo (Kinshasa)',
    'Costa Rica',
    "Cote d'Ivoire",
    'Croatia',
    'Cuba',
    'Cyprus',
    'Czechia',
    'Denmark',
    'Diamond Princess',
    'Djibouti',
    'Dominica',
    'Dominican Republic',
    'Ecuador',
    'Egypt',
    'El Salvador',
    'Equatorial Guinea',
    'Eritrea',
    'Estonia',
    'Eswatini',
    'Ethiopia',
    'Fiji',
    'Finland',
    'France',
    'Gabon',
    'Gambia',
    'Georgia',
    'Germany',
    'Ghana',
    'Greece',
    'Grenada',
    'Guatemala',
    'Guinea',
    'Guinea-Bissau',
    'Guyana',
    'Haiti',
    'Holy See',
    'Honduras',
    'Hungary',
    'Iceland',
    'India',
    'Indonesia',
    'Iran',
    'Iraq',
    'Ireland',
    'Israel',
    'Italy',
    'Jamaica',
    'Japan',
    'Jordan',
    'Kazakhstan',
    'Kenya',
    'Korea, South',
    'Kosovo',
    'Kuwait',
    'Kyrgyzstan',
    'Laos',
    'Latvia',
    'Lebanon',
    'Lesotho',
    'Liberia',
    'Libya',
    'Liechtenstein',
    'Lithuania',
    'Luxembourg',
    'MS Zaandam',
    'Madagascar',
    'Malawi',
    'Malaysia',
    'Maldives',
    'Mali',
    'Malta',
    'Marshall Islands',
    'Mauritania',
    'Mauritius',
    'Mexico',
    'Micronesia',
    'Moldova',
    'Monaco',
    'Mongolia',
    'Montenegro',
    'Morocco',
    'Mozambique',
    'Namibia',
    'Nepal',
    'Netherlands',
    'New Zealand',
    'Nicaragua',
    'Niger',
    'Nigeria',
    'North Macedonia',
    'Norway',
    'Oman',
    'Pakistan',
    'Panama',
    'Papua New Guinea',
    'Paraguay',
    'Peru',
    'Philippines',
    'Poland',
    'Portugal',
    'Qatar',
    'Romania',
    'Russia',
    'Rwanda',
    'Saint Kitts and Nevis',
    'Saint Lucia',
    'Saint Vincent and the Grenadines',
    'Samoa',
    'San Marino',
    'Sao Tome and Principe',
    'Saudi Arabia',
    'Senegal',
    'Serbia',
    'Seychelles',
    'Sierra Leone',
    'Singapore',
    'Slovakia',
    'Slovenia',
    'Solomon Islands',
    'Somalia',
    'South Africa',
    'South Sudan',
    'Spain',
    'Sri Lanka',
    'Sudan',
    'Suriname',
    'Sweden',
    'Switzerland',
    'Syria',
    'Taiwan*',
    'Tajikistan',
    'Tanzania',
    'Thailand',
    'Timor-Leste',
    'Togo',
    'Trinidad and Tobago',
    'Tunisia',
    'Turkey',
    'US',
    'Uganda',
    'Ukraine',
    'United Arab Emirates',
    'United Kingdom',
    'Uruguay',
    'Uzbekistan',
    'Vanuatu',
    'Venezuela',
    'Vietnam',
    'West Bank and Gaza',
    'Yemen',
    'Zambia',
    'Zimbabwe'
  ];
  var data = "";
  var dropdownValue = "global";
  @override
  void initState() {
    super.initState();
    GetCases(dropdownValue).getCases().then((res) {
      setState(() {
        var confirmed = res['confirmed']['value'];
        recovered = res['recovered']['value'];
        deaths = res['deaths']['value'];
        active = confirmed - (recovered + deaths);
      });
    });
    GetVaccine(600094).getVaccine();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var width = screenSize.width;
    var height = screenSize.height;
    var scaffoldKey = GlobalKey<ScaffoldState>();
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.black,
      ),
    );
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 0, left: 10, right: 10, bottom: 10),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    scaffoldKey.currentState!.openDrawer();
                  },
                  icon: Icon(
                    Icons.menu,
                    color: Colors.black,
                  ),
                  iconSize: 24,
                ),
                TextMain('Covid-19 Case Tracker', 20),
                Padding(padding: EdgeInsets.all(16)),
              ],
            ),
            Container(
              padding: EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 5),
            ),
            SizedBox(
              height: height - 60,
              width: width,
              child: LayoutBuilder(builder:
                  (BuildContext context, BoxConstraints viewportConstraints) {
                return SingleChildScrollView(
                  child: Container(
                    //color: Colors.blue,
                    child: Column(
                      children: [
                        Center(
                          child: Image(
                            width: 250,
                            height: 250,
                            fit: BoxFit.fitWidth,
                            image: AssetImage("man_with_mask_logo.png"),
                          ),
                        ),
                        DropdownButton(
                            value: dropdownValue,
                            hint: Text('Select country'),
                            onChanged: (String? newvalue) {
                              setState(() {
                                dropdownValue = newvalue!;
                                var response =
                                    GetCases(newvalue).getCases().then((res) {
                                  setState(() {
                                    var confirmed = res['confirmed']['value'];
                                    recovered = res['recovered']['value'];
                                    deaths = res['deaths']['value'];
                                    active = confirmed - (recovered + deaths);
                                  });
                                });
                              });
                            },
                            items: countries.map((String value) {
                              return DropdownMenuItem(
                                value: value,
                                child: Text(value),
                              );
                            }).toList()),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Column(children: [
                            TextMain(data, 14),
                            SizedBox(
                              height: 200,
                              width: 300,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black12,
                                          blurRadius: 2.0,
                                          spreadRadius: 0.0,
                                          offset: Offset(0.0, 0.0))
                                    ]),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(padding: EdgeInsets.all(5)),
                                    TextActive("   Active Cases", 20),
                                    Padding(padding: EdgeInsets.all(5)),
                                    Padding(padding: EdgeInsets.all(12)),
                                    Center(
                                      child: Column(
                                        children: [
                                          Countup(
                                            begin: 0,
                                            end: active.toDouble(),
                                            duration: Duration(seconds: 2),
                                            separator: ',',
                                            style: GoogleFonts.poppins(
                                              fontSize: 30,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 51,
                                    ),
                                    DecoratedBox(
                                      decoration: BoxDecoration(
                                        color: Colors.orange,
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(10),
                                          bottomRight: Radius.circular(10),
                                        ),
                                      ),
                                      child: Container(
                                        height: 30,
                                        width: 300,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 51,
                            ),
                            SizedBox(
                              height: 200,
                              width: 300,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black12,
                                          blurRadius: 2.0,
                                          spreadRadius: 0.0,
                                          offset: Offset(0.0, 0.0))
                                    ]),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(padding: EdgeInsets.all(5)),
                                    TextActive("   Recovered", 20),
                                    Padding(padding: EdgeInsets.all(5)),
                                    Padding(padding: EdgeInsets.all(12)),
                                    Center(
                                      child: Column(
                                        children: [
                                          Countup(
                                            begin: 0,
                                            end: recovered.toDouble(),
                                            duration: Duration(seconds: 2),
                                            separator: ',',
                                            style: GoogleFonts.poppins(
                                              fontSize: 30,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 51,
                                    ),
                                    DecoratedBox(
                                      decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(10),
                                          bottomRight: Radius.circular(10),
                                        ),
                                      ),
                                      child: Container(
                                        height: 30,
                                        width: 300,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 51,
                            ),
                            SizedBox(
                              height: 200,
                              width: 300,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black12,
                                          blurRadius: 2.0,
                                          spreadRadius: 0.0,
                                          offset: Offset(0.0, 0.0))
                                    ]),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(padding: EdgeInsets.all(5)),
                                    TextActive("   Death", 20),
                                    Padding(padding: EdgeInsets.all(5)),
                                    Padding(padding: EdgeInsets.all(12)),
                                    Center(
                                      child: Column(
                                        children: [
                                          Countup(
                                            begin: 0,
                                            end: deaths.toDouble(),
                                            duration: Duration(seconds: 2),
                                            separator: ',',
                                            style: GoogleFonts.poppins(
                                              fontSize: 30,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 51,
                                    ),
                                    DecoratedBox(
                                      decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(10),
                                          bottomRight: Radius.circular(10),
                                        ),
                                      ),
                                      child: Container(
                                        height: 30,
                                        width: 300,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            //TextMain("How to prevent from COVID-19?", 22)
                          ]),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
        drawer: Drawer(
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
        ),
      ),
    );
  }
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
