import 'dart:math';
import 'package:google_fonts/google_fonts.dart';
import 'result.dart';
import 'package:bmiapp/result.dart';
import 'package:flutter/material.dart';

class calculator extends StatefulWidget {
  const calculator({Key? key}) : super(key: key);

  @override
  State<calculator> createState() => _calculatorState();
}

class _calculatorState extends State<calculator> {
  bool isMale = true;
  double heightVal = 170;

  int weight = 55;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      appBar: AppBar(
        title: Text(
          'Body Mass Index',
          style: GoogleFonts.balsamiqSans(
            textStyle:
                const TextStyle(color: Colors.white, backgroundColor: Colors.teal),
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    buildExpanded1(context, 'male'),
                    const SizedBox(width: 15),
                    buildExpanded1(context, 'female'),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.teal,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Height',
                        style: GoogleFonts.balsamiqSans(
                          textStyle: Theme.of(context).textTheme.headline2,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            heightVal.toStringAsFixed(0),
                            style: GoogleFonts.balsamiqSans(
                              textStyle: Theme.of(context).textTheme.headline2,
                            ),
                          ),
                          const Text('CM',
                              style: TextStyle(color: Colors.greenAccent)),
                        ],
                      ),
                      Slider(
                        min: 90,
                        max: 220,
                        activeColor: Colors.greenAccent,
                        value: heightVal,
                        onChanged: (newValue) {
                          setState(() {
                            heightVal = newValue;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      buildExpanded(context, 'weight'),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.teal,
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 16,
              child: TextButton(
                onPressed: () {
                  var result = weight / pow(heightVal / 100, 2);
                  print(result);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          Result(result: result, isMale: isMale),
                    ),
                  );
                },
                child: Text('Calculate',
                    style: GoogleFonts.balsamiqSans(
                      textStyle: Theme.of(context).textTheme.headline2,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Expanded buildExpanded1(BuildContext context, String type) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            isMale = type == 'male' ? true : false;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: (isMale && type == 'male') || (!isMale && type == 'female')
                ? Colors.teal
                : Colors.blueGrey,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                type == 'male' ? Icons.male : Icons.female,
                size: 90,
              ),
              const SizedBox(height: 15),
              Text(type == 'male' ? 'Male' : 'Female',
                  style: GoogleFonts.balsamiqSans(
                    textStyle: Theme.of(context).textTheme.headline2,
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Expanded buildExpanded(BuildContext context, String type) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.topCenter,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.teal,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Weight',
                  style: GoogleFonts.balsamiqSans(
                    textStyle: Theme.of(context).textTheme.headline2,
                  )),
              const SizedBox(
                height: 15,
              ),
              Text(
                '$weight',
                style: Theme.of(context).textTheme.headline2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    heroTag: type == 'weight--',
                    onPressed: () {
                      setState(() {
                        weight--;
                      });
                    },
                    child: const Icon(Icons.remove),
                    mini: true,
                    backgroundColor: Colors.greenAccent,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  FloatingActionButton(
                    heroTag: type == 'weight++',
                    onPressed: () {
                      setState(() {
                        weight++;
                      });
                    },
                    child: const Icon(Icons.add),
                    mini: true,
                    backgroundColor: Colors.greenAccent,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
