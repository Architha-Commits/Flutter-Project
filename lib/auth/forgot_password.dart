import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:master_go_replication/auth/auth_methods.dart';
import 'package:master_go_replication/signin.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForGetPasswordState();
}

class _ForGetPasswordState extends State<ForgotPassword> {
  final _email = TextEditingController();
  GlobalKey<FormState> customKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("Forget Password"),
        centerTitle: true,
        // actions: const [Icon(Icons.horizontal_split)],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Form(
          key: customKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // const Text("Restart Your Mail"),
              Image.asset("assets/images/signin.png"),
              const SizedBox(height: 20),
              TextField(
                controller: _email,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'ENTER YOUR EMAIL',
                ),
              ),
              const SizedBox(height: 20),
              // TextButton(
              //   style: TextButton.styleFrom(

              //       // primary: Colors.blue,
              //       ),
              //   onPressed: () {},
              //   child: const Text('Restart Email'),
              // )
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: HexColor("#20C3AF"),
                    shape: const RoundedRectangleBorder(),
                  ),
                  onPressed: () {
                    if (customKey.currentState!.validate()) {
                      AuthMethods().forgotPassword(_email.text).then((value) {
                        Fluttertoast.showToast(
                            msg: "Reset Password Link sent successfully");
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Signin()),
                            (r) => false);
                      });
                    }
                  },
                  child: const Text(
                    'Submit',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
