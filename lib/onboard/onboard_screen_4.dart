import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:master_go_replication/signin.dart';

class OnboardScreen4 extends StatelessWidget {
  const OnboardScreen4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Center(
                child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          "create\n order",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontFamily: "ubuntu",
              fontWeight: FontWeight.bold,
              fontSize: 40,
              color: HexColor("#525464")),
        ),
        Image.asset("assets/images/Illustration3.png"),
        Text(
          "It's easy just click on the plus",
          textAlign: TextAlign.center,
          style: TextStyle(color: HexColor("#838391")),
        ),
        FloatingActionButton(
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Signin())),
            backgroundColor: HexColor("#20C3AF"),
            shape: const CircleBorder(),
            child: const Icon(
              Icons.add,
              color: Colors.white,
              size: 30,
            ))
      ],
    ))));
  }
}
