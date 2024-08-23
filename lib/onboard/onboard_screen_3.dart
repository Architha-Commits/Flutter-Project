import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:master_go_replication/onboard/onboard_screen_4.dart';

class OnboardScreen3 extends StatelessWidget {
  const OnboardScreen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Center(
                child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          "insured\n order",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontFamily: "ubuntu",
              fontWeight: FontWeight.bold,
              fontSize: 40,
              color: HexColor("#525464")),
        ),
        Image.asset("assets/images/Illustration2.png"),
        Text(
          "We ensure each order for the\n amount of 500",
          textAlign: TextAlign.center,
          style: TextStyle(color: HexColor("#838391")),
        ),
        Container(
            height: 40,
            width: 280,
            color: HexColor("#20C3AF"),
            child: ElevatedButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const OnboardScreen4())),
                style: ElevatedButton.styleFrom(
                    backgroundColor: HexColor("#20C3AF"),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero)),
                child: const Text(
                  "Next",
                  style: TextStyle(color: Colors.white),
                )))
      ],
    ))));
  }
}
