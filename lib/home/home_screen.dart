import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:master_go_replication/signin.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Fluttertoast.showToast(msg: "Signout successfully");
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => const Signin()),
                        (r) => false);
                  },
                  child: const Text("sign out"))
            ],
          ),
        ),
      ),
    );
  }
}
