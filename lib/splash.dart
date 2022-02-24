import 'package:bmiapp/calculator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class splash extends StatelessWidget {
  const splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.greenAccent,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                  // mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 80,
                              backgroundColor: Colors.white,
                              child: Image.asset(
                                'assets/bmi_gren.png',
                                fit: BoxFit.cover,
                                width: 150,
                                height: 150,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'BMI Calculator',
                            style: GoogleFonts.pacifico(
                              textStyle: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.teal,
                              ),
                            ),
                            textAlign: TextAlign.end,
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.height,
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => calculator(),
                                  ),
                                );
                              },
                              child: Text(
                                'Go to calculate your BMI',
                                style: GoogleFonts.balsamiqSans(
                                    textStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 28,
                                    ),
                                    color: Colors.white,
                                    background: Paint()
                                      ..color = Colors.teal
                                      ..strokeWidth = 36.0
                                      ..style = PaintingStyle.stroke
                                      ..strokeJoin = StrokeJoin.round),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          RichText(
                              text: TextSpan(children: [
                            TextSpan(
                              style: GoogleFonts.balsamiqSans(
                                textStyle: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              text: 'Made by ',
                            ),
                            TextSpan(
                                style: GoogleFonts.balsamiqSans(
                                  textStyle: const TextStyle(
                                      color: Colors.teal,
                                      fontWeight: FontWeight.bold),
                                ),
                                text: 'Abdulrahman Alhatti',
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () async {
                                    var url =
                                        'www.linkedin.com/in/abdulrahman-alhatti';
                                    if (!await canLaunch(url)) {
                                      await launch(url);
                                    } else {
                                      throw 'Could not launch $url';
                                    }
                                  }),
                          ]))
                        ],
                      ),
                    ),
                  ]),
            ),
          ),
        ));
  }
}
