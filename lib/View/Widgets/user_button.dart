import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
class UserButton extends StatefulWidget {
  final Function method ;
  final Color color ;
  final String title ;
  const UserButton({required this.title ,required this.color ,required this.method});

  @override
  _UserButtonState createState() => _UserButtonState();
}

class _UserButtonState extends State<UserButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      width: .9.sw,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: widget.color,
            elevation: 0,
            shape: RoundedRectangleBorder(
              side: BorderSide(color : widget.color == Colors.transparent ?  Colors.white : widget.color , width: 2) ,
              borderRadius: BorderRadius.circular(10),
            )
        ),
        onPressed: (){
          widget.method();
        },
        child: Text(
          widget.title,
          style: GoogleFonts.titilliumWeb(
            fontSize: 15.sp,
            fontWeight: FontWeight.w600
          ),
        )
      ),
    );
  }
}
