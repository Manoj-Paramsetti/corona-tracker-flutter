import 'package:covid/widget/text.dart';
import 'package:flutter/material.dart';

class Safety extends StatefulWidget {
  Safety({Key? key}) : super(key: key);

  @override
  _SafetyState createState() => _SafetyState();
}

class _SafetyState extends State<Safety> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var width = screenSize.width;
    var height = screenSize.height;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.popAndPushNamed(context, '/Home');
                    //scaffoldKey.currentState!.openDrawer();
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                  iconSize: 24,
                ),
                TextMainNormal('Saftey Measurement', 20),
                Padding(padding: EdgeInsets.all(16)),
              ],
            ),
            SizedBox(
              height: height - 72,
              child: LayoutBuilder(builder:
                  (BuildContext context, BoxConstraints viewportConstraints) {
                return SingleChildScrollView(
                    child: Column(children: [
                  Image(
                    width: width,
                    height: height * 0.40,
                    fit: BoxFit.contain,
                    image: NetworkImage(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-RaNVe7YVjIlyPh_aEul2Goqvqw5s2ncS9g&usqp=CAU"),
                  ),
                  Container(
                    width: width,
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextMain('Safety measurements against corona\n', 18),
                        TextMain('To prevent the spread of COVID-19:', 16),
                        TextMainNormal(
                            'Clean your hands often. Use soap and water, or an alcohol-based hand rub.\nMaintain a safe distance from anyone who is coughing or sneezing.\nWear a mask when physical distancing is not possible.\nDon\’t touch your eyes, nose or mouth.\nCover your nose and mouth with your bent elbow or a tissue when you cough or sneeze.\nStay home if you feel unwell.\nIf you have a fever, cough and difficulty breathing, seek medical attention.\n',
                            14),
                        TextMain('Masks', 16),
                        TextMainNormal(
                            'Masks can help prevent the spread of the virus from the person wearing the mask to others. Masks alone do not protect against COVID-19, and should be combined with physical distancing and hand hygiene. Follow the advice provided by your local health authority.',
                            14),
                        TextMain('Recommended', 16),
                        TextMainNormal(
                            'Calling in advance allows your healthcare provider to quickly direct you to the right health facility. This protects you, and prevents the spread of viruses and other infections.',
                            14),
                      ],
                    ),
                  ),
                ]));
              }),
            ),
          ],
        ),
      ),
    );
  }
}
