import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:master_go_replication/Hive/hive_notes_screen.dart';
// import 'package:master_go_replication/auth/Crud/home_screen1.dart';

// import 'package:master_go_replication/auth/forgot_password.dart';
// import 'package:master_go_replication/api/users_list_screen.dart';
import 'package:master_go_replication/firebase_options.dart';

// import 'package:master_go_replication/onboard/onboard_screens.dart';
// import 'package:master_go_replication/signin.dart';
// import 'package:master_go_replication/signup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Hive.initFlutter();
  await Hive.openBox<String>('notesBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: "ubuntu"),
        home: const HiveNotesScreen());
  }
}

// home: const Signin(),
// home: const Signup(),
// home: const UsersListScreen(),
// home: const OnboardScreens(),
// home:const ForgotPassword()
// home: const HomeScreen1());