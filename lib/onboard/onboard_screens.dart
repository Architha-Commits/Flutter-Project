import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:master_go_replication/onboard/onboard_model.dart';
import 'package:master_go_replication/signup.dart';

class OnboardScreens extends StatefulWidget {
  const OnboardScreens({super.key});

  @override
  State<OnboardScreens> createState() => _OnboardScreensState();
}

class _OnboardScreensState extends State<OnboardScreens> {
  PageController pageController = PageController(initialPage: 0);
  int currentIndex = 0;
  // List<OnboardModel> screens = [
  //   OnboardModel(
  //     header: "Proven\n specialists",
  //     imagePath: "assets/images/o1.png",
  //     body: "We check each specialist before \nhe starts work",
  //   ),
  //   OnboardModel(
  //       header: "Honest \nratings",
  //       imagePath: "assets/images/o2.png",
  //       body: "We carefully check each specialist\n and put honest ratings"),
  //   OnboardModel(
  //       header: "Insured \norders",
  //       imagePath: "assets/images/o3.png",
  //       body: "We insure each order for\n the amount of \$500"),
  //   OnboardModel(
  //       header: "Create \norder",
  //       imagePath: "assets/images/o4.png",
  //       body: "It's easy, just click on the plus"),
  // ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          PageView.builder(
              controller: pageController,
              itemCount: screens.length,
              onPageChanged: (i) {
                setState(() {
                  currentIndex = i;
                });
              },
              itemBuilder: (context, index) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          screens[index].header,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: HexColor("#525464")),
                        ),
                        Image.asset(screens[index].imagePath),
                        Text(
                          screens[index].body,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: HexColor("#525464"), fontSize: 13),
                        ),
                        currentIndex != 3
                            ? DotsIndicator(
                                dotsCount: screens.length,
                                position: currentIndex,
                                decorator: DotsDecorator(
                                  activeColor: Colors.grey,
                                  size: const Size.square(9.0),
                                  activeSize: const Size(18.0, 9.0),
                                  activeShape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0)),
                                ),
                              )
                            : const SizedBox(),
                        const SizedBox(
                          height: 20,
                        ),
                        currentIndex != 3
                            ? InkWell(
                                onTap: () => pageController.nextPage(
                                    curve: Curves.easeIn,
                                    duration:
                                        const Duration(milliseconds: 400)),
                                child: Container(
                                  height: 50,
                                  width: 320,
                                  color: HexColor("#20C3AF"),
                                  child: const Center(
                                    child: Text(
                                      "Next",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ))
                            : ElevatedButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const Signup()));
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: HexColor("#20C3AF"),
                                    shape: const CircleBorder(),
                                    minimumSize: const Size(70, 70)),
                                child: const Icon(
                                  size: 30,
                                  Icons.add,
                                  color: Colors.white,
                                ),
                              )
                      ],
                    ),
                  ),
                );
              }),
        ],
      )),
    );
  }
}




























// import 'package:flutter/material.dart';
// import 'package:hexcolor/hexcolor.dart';
// import 'package:master_go_replication/onboard/onboard_model.dart';

// class OnboardScreens extends StatefulWidget {
//   const OnboardScreens({super.key});

//   @override
//   State<OnboardScreens> createState() => _OnboardScreensState();
// }

// class _OnboardScreensState extends State<OnboardScreens> {
//   PageController pageController = PageController(initialPage: 0);
//   int currentIndex = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: SafeArea(
//             child: PageView.builder(
//                 controller: pageController,
//                 itemCount: screens.length,
//                 onPageChanged: (i) {
//                   setState(() {
//                     currentIndex = i;
//                     print(currentIndex);
//                   });
//                 },
//                 itemBuilder: (context, index) {
//                   return Center(
//                       child: Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       Text(
//                         screens[index].header,
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                             fontFamily: "ubuntu",
//                             fontWeight: FontWeight.bold,
//                             fontSize: 40,
//                             color: HexColor("#525464")),
//                       ),
//                       Image.asset(screens[index].imagePath),
//                       Text(
//                         screens[index].body,
//                         textAlign: TextAlign.center,
//                         style: TextStyle(color: HexColor("#838391")),
//                       ),
//                       currentIndex != 3
//                           ? ElevatedButton(
//                               onPressed: () => pageController.nextPage(
//                                   curve: Curves.easeIn,
//                                   duration: const Duration(milliseconds: 400)),
//                               style: ElevatedButton.styleFrom(
//                                   minimumSize: const Size(280, 50),
//                                   backgroundColor: HexColor("#20C3AF"),
//                                   shape: const RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.zero)),
//                               child: const Text(
//                                 "Next",
//                                 style: TextStyle(color: Colors.white),
//                               ))
//                           : FloatingActionButton(
//                               backgroundColor: HexColor("#20C3AF"),
//                               onPressed: null,
//                               shape: const CircleBorder(),
//                               child: const Icon(
//                                 Icons.add,
//                                 color: Colors.white,
//                                 size: 30,
//                               ))
//                     ],
//                   ));
//                 })));
//   }
// }
