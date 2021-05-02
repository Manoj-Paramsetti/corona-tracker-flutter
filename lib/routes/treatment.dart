import 'package:covid/widget/text.dart';
import 'package:flutter/material.dart';

class Treatment extends StatefulWidget {
  Treatment({Key? key}) : super(key: key);

  @override
  _TreatmentState createState() => _TreatmentState();
}

class _TreatmentState extends State<Treatment> {
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
                TextMainNormal('Home Treatment', 20),
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
                    fit: BoxFit.fitWidth,
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
                        TextMain('Home Treatment/self-care\n', 18),
                        TextMain(
                            'After exposure to someone who has COVID-19, do the following:',
                            16),
                        TextMainNormal(
                            '- Call your health care provider or COVID-19 hotline to find out where and when to get a test.\n- Cooperate with contact-tracing procedures to stop the spread of the virus.\n- If testing is not available, stay home and away from others for 14 days.\n- While you are in quarantine, do not go to work, to school or to public places. Ask someone to bring you supplies.\n- Keep at least a 1-metre distance from others, even from your family members.\n- Wear a medical mask to protect others, including if/when you need to seek medical care.\n- Clean your hands frequently.\n- Stay in a separate room from other family members, and if not possible, wear a medical mask.\n- Keep the room well-ventilated.\n- If you share a room, place beds at least 1 metre apart.\n- Monitor yourself for any symptoms for 14 days.\n- Call your health care provider immediately if you have any of these danger signs: difficulty breathing, loss of speech or mobility, confusion or chest pain.\n- Stay positive by keeping in touch with loved ones by phone or online, and by exercising at home.',
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
