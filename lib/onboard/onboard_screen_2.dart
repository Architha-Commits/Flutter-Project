import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:master_go_replication/onboard/onboard_screen_3.dart';

class OnboardScreen2 extends StatelessWidget {
  const OnboardScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Center(
                child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          "Honest\n Ratings",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontFamily: "ubuntu",
              fontWeight: FontWeight.bold,
              fontSize: 40,
              color: HexColor("#525464")),
        ),
        Image.asset("assets/images/Illustration1.png"),
        Text(
          "We carefully check each specialist\n and put honest",
          textAlign: TextAlign.center,
          style: TextStyle(color: HexColor("#838391")),
        ),
        ElevatedButton(
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const OnboardScreen3())),
            style: ElevatedButton.styleFrom(
                minimumSize: const Size(280, 50),
                backgroundColor: HexColor("#20C3AF"),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero)),
            child: const Text(
              "Next",
              style: TextStyle(color: Colors.white),
            ))
      ],
    ))));
  }
}
