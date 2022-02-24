import 'package:bmiapp/calculator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Result extends StatelessWidget {
  const Result({
    Key? key,
    required this.result,
    required this.isMale,
  }) : super(key: key);

  final double result;
  final bool isMale;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Result',
            style: GoogleFonts.balsamiqSans(
              textStyle:
                  const TextStyle(color: Colors.white, backgroundColor: Colors.teal),
            ),
          ),
          centerTitle: true,
        ),
        backgroundColor: Colors.greenAccent,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                  // mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Your BMI is ${result.toStringAsFixed(1)}',
                            style: GoogleFonts.balsamiqSans(
                                textStyle: const TextStyle(
                                    fontSize: 40, color: Colors.teal)),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (result >= 30)
                                Image.asset('assets/Ob.PNG',
                                    fit: BoxFit.cover, width: 173, height: 173)
                              else if (result > 25 && result < 30)
                                Image.asset('assets/Over1.PNG',
                                    fit: BoxFit.cover, width: 173, height: 173)
                              else if (result >= 18.5 && result <= 24.9)
                                Image.asset(
                                  'assets/Nor.PNG',
                                  fit: BoxFit.cover,
                                  width: 173,
                                  height: 173,
                                )
                              else
                                Image.asset('assets/Under0.PNG',
                                    fit: BoxFit.cover, width: 173, height: 173),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (result >= 30)
                            Text(
                              'Oh sorry! You need to have weight loss program :(',
                              style: GoogleFonts.balsamiqSans(
                                textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            )
                          else if (result > 25 && result < 30)
                            Text('You have some excess fat, get rid of it!',
                                style: GoogleFonts.balsamiqSans(
                                    textStyle: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)))
                          else if (result >= 18.5 && result <= 24.9)
                            Text('You have a perfect body! Good job',
                                style: GoogleFonts.balsamiqSans(
                                    textStyle: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)))
                          else
                            Text(
                              'Underweight! You have to eat more frequently!',
                              style: GoogleFonts.balsamiqSans(
                                textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              textAlign: TextAlign.center,
                            ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.height,
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const calculator(),
                                    ),
                                  );
                                },
                                child: Text('Re-calculate',
                                    style: GoogleFonts.balsamiqSans(
                                      textStyle: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 30,
                                          color: Colors.white,
                                          background: Paint()
                                            ..color = Colors.teal
                                            ..strokeWidth = 36.0
                                            ..style = PaintingStyle.stroke
                                            ..strokeJoin = StrokeJoin.round),
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ]),
            ),
          ),
        ));
  }
}
