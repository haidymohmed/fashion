import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
class CustomerTextField extends StatefulWidget {
  late String fieldName , hint ;
  IconData? suffixIconData ;
  late bool scure , suffixIcon ;
  late var onTap , onSaved , validator ;
  TextEditingController? controller = TextEditingController();
  CustomerTextField({Key? key, this.onSaved , this.validator , this.controller ,  this.onTap, required this.fieldName  ,required this.hint ,required this.scure, required this.suffixIcon , this.suffixIconData}) : super(key: key);
  @override
  _CustomerTextFieldState createState() => _CustomerTextFieldState();
}

class _CustomerTextFieldState extends State<CustomerTextField> {
  late String fieldName , hint ;
  late IconData prefixIconData ;
  IconData? suffixIconData ;
  late bool scure , suffixIcon ;
  _CustomerTextFieldState();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
          border: Border.all(
              width: 1,
              color: Colors.grey.shade200
          ),
          color: Colors.white,
          borderRadius: BorderRadius.circular(5)
      ),
      height: 60.h,
      width: .9.sw,
      child: TextFormField(
        controller: widget.controller,
        onSaved: widget.onSaved,
        onTap: widget.onTap,
        validator: widget.validator,
        obscureText: widget.scure ,
        decoration: InputDecoration(
          hintText: widget.hint,
          hintStyle:  GoogleFonts.titilliumWeb(
              fontSize: 15.sp,
              color: Colors.grey
          ),
          suffixIcon: getIcon(widget.suffixIcon),
          border: const OutlineInputBorder(
              borderSide: BorderSide.none
          ),
        ),
      ),
    );
  }
  IconButton? getIcon(bool isSuffix){
    if(isSuffix){
      return IconButton(
        onPressed: () {
          setState(() {
            widget.scure = ! widget.scure;
          });
        },
        icon: Icon(
          widget.suffixIconData ,
          color: Colors.grey,
          size: 20,
        ),
      );
    }
    else{
      return null;
    }
  }
}