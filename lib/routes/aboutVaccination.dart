import 'package:covid/widget/text.dart';
import 'package:flutter/material.dart';

class AboutVaccination extends StatelessWidget {
  const AboutVaccination({Key? key}) : super(key: key);

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
                TextMainNormal('About Vaccination', 20),
                Padding(padding: EdgeInsets.all(16)),
              ],
            ),
            SizedBox(
              height: height - 72,
              child: LayoutBuilder(
                builder:
                    (BuildContext context, BoxConstraints viewportConstraints) {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        Image(
                          width: 250,
                          height: 250,
                          image: AssetImage('assets/man_with_mask_logo.png'),
                        ),
                        Container(
                          width: width,
                          padding: EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(
                                  style: DefaultTextStyle.of(context).style,
                                  children: [
                                    TextSpan(
                                      text: "Source: WHO\n\n",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    TextSpan(
                                      text:
                                          "The world is in the midst of a COVID-19 pandemic. As WHO and partners work together on the response -- tracking the pandemic, advising on critical interventions, distributing vital medical supplies to those in need--- they are racing to develop and deploy safe and effective vaccines. ",
                                    ),
                                    TextSpan(
                                        text:
                                            "\n\n Vaccines save millions of lives each year. Vaccines work by training and preparing the body’s natural defences – the immune system – to recognize and fight off the viruses and bacteria they target. After vaccination, if the body is later exposed to those disease-causing germs, the body is immediately ready to destroy them, preventing illness."),
                                    TextSpan(
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                        text:
                                            "\n\n There are several safe and effective vaccines that prevent people from getting seriously ill or dying from COVID-19. "),
                                    TextSpan(
                                        text:
                                            "This is one part of managing COVID-19, in addition to the main preventive measures of staying at least 1 metre away from others, covering a cough or sneeze in your elbow, frequently cleaning your hands, wearing a mask and avoiding poorly ventilated rooms or opening a window."),
                                    TextSpan(
                                        text:
                                            "\n\n As of 3 June 2021, WHO has evaluated that the following vaccines against COVID-19 have met the necessary criteria for safety and efficacy:"),
                                    TextSpan(
                                        text:
                                            "\n\n- AstraZeneca/Oxford vaccine\n- Johnson and Johnson\n- Moderna\n- Pfizer/BionTech\n- Sinopharm\n- Sinovac"),
                                    TextSpan(
                                        text:
                                            "\n\n Read our Q&A on the Emergency Use Listing process to find out more about how WHO assesses the quality, safety and efficacy of COVID-19 vaccines."),
                                    TextSpan(
                                        text:
                                            "\n\n Some national regulators have also assessed other COVID-19 vaccine products for use in their countries.\nTake whatever vaccine is made available to you first, even if you have already had COVID-19. It is important to be vaccinated as soon as possible once it’s your turn and not wait. Approved COVID-19 vaccines provide a high degree of protection against getting seriously ill and dying from the disease, although no vaccine is 100% protective."),
                                    TextSpan(
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                        text:
                                            "\n\n WHO SHOULD GET VACCINATED\nThe COVID-19 vaccines are safe for most people 18 years and older,"),
                                    TextSpan(
                                        text:
                                            " including those with pre-existing conditions of any kind, including auto-immune disorders. These conditions include: hypertension, diabetes, asthma, pulmonary, liver and kidney disease, as well as chronic infections that are stable and controlled."),
                                    TextSpan(
                                        text:
                                            "\n\n If supplies are limited in your area, discuss your situation with your care provider if you:"),
                                    TextSpan(
                                        text:
                                            "\n- Have a compromised immune system"),
                                    TextSpan(
                                        text:
                                            "\n- Are pregnant (if you are already breastfeeding, you should continue after vaccination)"),
                                    TextSpan(
                                        text:
                                            "\n- Have a history of severe allergies, particularly to a vaccine (or any of the ingredients in the vaccine)"),
                                    TextSpan(text: "\n- Are severely frail"),
                                    TextSpan(
                                        text:
                                            "\n\n- Children and adolescents tend to have milder disease compared to adults, so unless they are part of a group at higher risk of severe COVID-19, it is less urgent to vaccinate them than older people, those with chronic health conditions and health workers.   "),
                                    TextSpan(
                                        text:
                                            "\n\n More evidence is needed on the use of the different COVID-19 vaccines in children to be able to make general recommendations on vaccinating children against COVID-19."),
                                    TextSpan(
                                        text:
                                            "\n\n WHO's Strategic Advisory Group of Experts (SAGE) has concluded that the Pfizer/BionTech vaccine is suitable for use by people aged 12 years and above. Children aged between 12 and 15 who are at high risk may be offered this vaccine alongside other priority groups for vaccination. Vaccine trials for children are ongoing and WHO will update its recommendations when the evidence or epidemiological situation warrants a change in policy."),
                                    TextSpan(
                                        text:
                                            "\n\n It's important for children to continue to have the recommended childhood vaccines."),
                                    TextSpan(
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                        text:
                                            "\n\n WHAT SHOULD I DO AND EXPECT AFTER GETTING VACCINATED"),
                                    TextSpan(
                                        text:
                                            "\n\n Stay at the place where you get vaccinated for at least 15 minutes afterwards, just in case you have an unusual reaction, so health workers can help you. "),
                                    TextSpan(
                                        text:
                                            "\n\n Check when you should come in for a second dose – if needed. Most of the vaccines available are two-dose vaccines. Check with your care provider whether you need to get a second dose and when you should get it. Second doses help boost the immune response and strengthen immunity."),
                                    TextSpan(
                                        text:
                                            "\n\n In most cases, minor side effects are normal. Common side effects after vaccination, which indicate that a person's body is building protection to COVID-19 infection include:\n- Arm soreness\n- Mild fever\n- Tiredness\n- Headaches\n- Muscle or joint aches"),
                                    TextSpan(
                                        text:
                                            "\n\n Contact your care provider if there is redness or tenderness (pain) where you got the shot that increases after 24 hours, or if side effects do not go away after a few days."),
                                    TextSpan(
                                        text:
                                            "\n\n If you experience an immediate severe allergic reaction to a first dose of the COVID-19 vaccine, you should not receive additional doses of the vaccine. It’s extremely rare for severe health reactions to be directly caused by vaccines."),
                                    TextSpan(
                                        text:
                                            "\n\n Taking painkillers such as paracetamol before receiving the COVID-19 vaccine to prevent side effects is not recommended. This is because it is not known how painkillers may affect how well the vaccine works. However, you may take paracetamol or other painkillers if you do develop side effects such as pain, fever, headache or muscle aches after vaccination.  "),
                                    TextSpan(
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                        text:
                                            "\n\n Even after you’re vaccinated, keep taking precautions"),
                                    TextSpan(
                                        text:
                                            "\n\n While a COVID-19 vaccine will prevent serious illness and death, we still don’t know the extent to which it keeps you from being infected and passing the virus on to others. The more we allow the virus to spread, the more opportunity the virus has to change."),
                                    TextSpan(
                                        text:
                                            "\n\n Continue to take actions to slow and eventually stop the spread of the virus:"),
                                    TextSpan(
                                        text:
                                            "\n- Keep at least 1 metre from others"),
                                    TextSpan(
                                        text:
                                            "\n- Wear a mask, especially in crowded, closed and poorly ventilated settings."),
                                    TextSpan(
                                        text:
                                            "\n- Clean your hands frequently"),
                                    TextSpan(
                                        text:
                                            "\n- Cover any cough or sneeze in your bent elbow"),
                                    TextSpan(
                                        text:
                                            "\n- When indoors with others, ensure good ventilation, such as by opening a window"),
                                    TextSpan(
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                        text:
                                            "\n\n Doing it all protects us all."),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
