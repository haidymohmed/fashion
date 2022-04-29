import 'package:fashion/View/Screens/log_in.dart';
import 'package:fashion/View/Screens/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';

// ignore: non_constant_identifier_names
PageViewModel IntroPageModel(String title , String body , String imageUrl , bool isLast ,BuildContext context) {
  return PageViewModel(
      titleWidget: Text(
        title ,
        style:  GoogleFonts.pacifico(
            fontSize: 20.sp,
            letterSpacing: 2,
            fontWeight: FontWeight.w700
        ),
      ),
      bodyWidget: Text(
        body ,
        style:  GoogleFonts.abel(
            fontSize: 16.sp,
            letterSpacing: 2,
            fontWeight: FontWeight.w400
        ),
      ),
      image: Padding(
        padding: const EdgeInsets.only(
          top: 90
        ),
        child: Center(
          child: SvgPicture.asset(
              imageUrl,
          )
        ),
      ),
      footer : isLast ?
      Padding(
        padding: EdgeInsets.only(
          top: 20.sp
        ),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.red.shade900,
             fixedSize: Size(.7.sw , 50)
           ),
            onPressed: (){
              Navigator.popAndPushNamed(context, SignUp.id);
            },
            child: Text(
                "Let's Go !",
              style: GoogleFonts.abel(
                  fontSize: 18.sp,
                  letterSpacing: 2,
                  fontWeight: FontWeight.w900
              ),
            )
        ),
      ) : Container()
  );
}


