import 'package:covid/widget/text.dart';
import 'package:flutter/material.dart';

class Symptoms extends StatefulWidget {
  Symptoms({Key? key}) : super(key: key);

  @override
  _SymptomsState createState() => _SymptomsState();
}

class _SymptomsState extends State<Symptoms> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var width = screenSize.width;
    //var height = screenSize.height;
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
                TextMainNormal('Symptoms', 20),
                Padding(padding: EdgeInsets.all(16)),
              ],
            ),
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
                  TextMain('Most common symptoms', 16),
                  TextMainNormal('- feverdry\n- cough\n- tiredness\n', 14),
                  TextMain('Less common symptoms', 16),
                  TextMainNormal(
                      '- aches and pains\n- sore throat\n- diarrhoea\n- conjunctivitis\n- headache\n- loss of taste or smell\n- a rash on skin, or discolouration of fingers or toes\n',
                      14),
                  TextMain('Serious common symptoms', 16),
                  TextMainNormal(
                      '- difficulty breathing or shortness of breath\n- chest pain or pressure\n- loss of speech or movement',
                      14),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
