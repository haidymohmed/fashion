import 'dart:ui';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:fashion/View/Screens/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';

import 'home_page.dart';
import 'on_boarding_screen.dart';

class SplashingScreen extends StatefulWidget {
  const SplashingScreen({Key? key}) : super(key: key);

  @override
  _SplashingScreenState createState() => _SplashingScreenState();
}

class _SplashingScreenState extends State<SplashingScreen> {
  late bool first = true , isSigned = false;
  checkFirst()async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance() ;
    setState(() {
      first = sharedPreferences.getBool("first")!;
    });
  }
  isSignedMethod()async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance() ;
    setState(() {
      isSigned = sharedPreferences.getBool("signed")!;
    });
  }
  @override
  initState(){
    super.initState();
    checkFirst();
    isSignedMethod();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body:AnimatedSplashScreen(
          splashTransition: SplashTransition.slideTransition,
          nextScreen: first ? const OnBoardingScreen() : isSigned ? const HomePage() : const SignUp(),
          splash: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 75,
                height: 75,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.grey.shade300,
                        width: 2
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(7))
                ),
                child: Lottie.asset("images/38608-fashionable-girl-in-red-dress.json"),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    "Fashion clothing",
                    style: GoogleFonts.titilliumWeb(
                        fontSize: 25.sp,
                        letterSpacing: 2,
                        fontWeight: FontWeight.w400
                    )
                ),
              )
            ],
          ),
        )
    );
  }
}

/*
Shimmer.fromColors(
                highlightColor: Colors.red.shade500,
                baseColor: Colors.red.shade300,
                child: SvgPicture.asset(
                  "images/woman-clothes.svg",
                  color: Colors.red.shade900,
                  width: 70,
                  height: 70,
                ),

              )
*/