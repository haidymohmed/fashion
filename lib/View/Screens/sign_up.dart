import 'package:fashion/Contraller/auth.dart';
import 'package:fashion/View/Widgets/dynamic_text_field.dart';
import 'package:fashion/View/Widgets/user_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home_page.dart';
import 'log_in.dart';
class SignUp extends StatefulWidget {
  static String id = "SignUp";
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  AuthContraller authContraller = AuthContraller();
  late String email , password , name;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "SignUp",
                style: GoogleFonts.titilliumWeb(
                    fontSize: 25.sp,
                    fontWeight: FontWeight.w600
                ),
              ),
            ),
          ),
          const Spacer(),
          Form(
            key: formKey,
            child: Column(
              children: [
                CustomerTextField(
                    fieldName: "Name" ,
                    hint :"Enter your Name "  ,
                    scure : false ,
                    suffixIcon : false,
                    onSaved: (v){
                      name = v.toString();
                    },
                    validator: (v){
                      if(v.toString().isEmpty){
                        return "Enter Name";
                      }
                    },
                ),
                CustomerTextField(
                  fieldName: "Email" ,
                  hint:  "Enter your Email "  ,
                  scure : false ,
                  suffixIcon : false ,
                  onSaved: (v){
                    email = v.toString();
                  },
                  validator: (v){
                    if(v.toString().isEmpty){
                      return "Enter Email";
                    }
                  },
                ),
                CustomerTextField(
                  fieldName: "Password" ,
                  hint:  "Enter your password "  ,
                  scure : true ,
                  suffixIcon : true ,
                  suffixIconData : Icons.remove_red_eye_outlined,
                  onSaved: (v){
                    password = v.toString();
                  },
                  validator: (v){
                    if(v.toString().length < 8){
                      return "Password must be more than 8 digits";
                    }
                  },
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: InkWell(
              onTap: (){
                Navigator.pushNamed(context, LogIn.id);
              },
              child: Container(
                margin:  EdgeInsets.symmetric(horizontal: 20.sp  , vertical: 20.sp),
                width: .6.sw,
                height: 20.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Text(
                      "Already have an account ?",
                    ),
                    Icon(Icons.arrow_right_alt_outlined , color: Colors.red,),
                  ],
                ),
              ),
            ),
          ),
          UserButton(
            title : 'SignUp',
            color : Colors.red,
            method : () async{
              if(formKey.currentState!.validate()){
                formKey.currentState!.save();
                try{
                  await authContraller.signUp(email, password , name);
                  Navigator.pushNamed(context, HomePage.id);
                }
                catch(e){
                  print(e);
                }
              }
            },
          ),
          const Spacer(),
          const Spacer(),
          Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              "Or SIGNUP with Social Account",
              style: GoogleFonts.titilliumWeb(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 5
                ),
                child: InkWell(
                  onTap: (){},
                  child: Icon(FontAwesomeIcons.google,color: Colors.red,size: 40.sp,),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 5
                ),
                child: InkWell(
                  onTap: (){},
                  child: const Icon(FontAwesomeIcons.facebook,color: Colors.blue,size: 40,),
                ),
              )
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
