import 'package:fashion/Contraller/auth.dart';
import 'package:fashion/Provider/model_hud.dart';
import 'package:fashion/View/Screens/sign_up.dart';
import 'package:fashion/View/Widgets/dynamic_text_field.dart';
import 'package:fashion/View/Widgets/user_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'forget_password.dart';
import 'home_page.dart';
class LogIn extends StatefulWidget {
  static String id = "SignIn";
  LogIn({Key? key}) : super(key: key);

  @override
  _LogInState createState() => _LogInState();
}
class _LogInState extends State<LogIn> {
  bool _inAsyncCall = false;

  AuthContraller authContraller = AuthContraller();
  late String email , password;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: ModalProgressHUD(
            inAsyncCall: Provider.of<ModelHud>(context,listen: false).inAsyncCall,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                        "LogIn",
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
                            fieldName: "Email" ,
                            hint:  "Enter your Email "  ,
                            scure : false ,
                            suffixIcon : false ,
                          onSaved: (v){
                              email = v.toString();
                          },
                          validator: (v){
                              if(v.toString().endsWith("@gmail.com")){
                                email = v.toString();
                              }
                              else{
                                return "name@gmail.com";
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
                              if(v.toString().isNotEmpty){
                                password = v.toString();
                              }
                              else{
                                return "Enter Password";
                              }
                          },
                        ),
                      ],
                    )
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, ForgetPassword.id);
                    },
                    child: Container(
                      margin:  EdgeInsets.symmetric(horizontal: 20.sp  , vertical: 20.sp),
                      width: .6.sw,
                      height: 20.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          Text(
                            "Forget your password ?",
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                UserButton(
                  title : 'LOGIN',
                  color : Colors.red,
                  method : ()async{
                    if(formKey.currentState!.validate()){
                      Provider.of<ModelHud>(context,listen: false).changeAsyncCall(true);

                      formKey.currentState!.save();
                      try{
                        //await authContraller.logIn(email, password);
                        //Provider.of<ModelHud>(context,listen: false).changeAsyncCall(false);
                        Navigator.pushNamed(context, HomePage.id);
                      }catch(e){
                        print(e);
                      }
                      Provider.of<ModelHud>(context,listen: false).changeAsyncCall(false);
                    }
                  },
                ),
                const Spacer(),
                const Spacer(),
                Padding(
                    padding: EdgeInsets.all(20),
                  child: Text(
                    "Or LOGIN with Social Account",
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
                        onTap: ()async{
                          try{
                            await authContraller.signInWithGoogle();
                          }
                          catch(e){
                            print(e);
                          }
                        },
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
                        child: Icon(FontAwesomeIcons.facebook,color: Colors.blue,size: 40.sp,),
                      ),
                    )
                  ],
                ),
                const Spacer(),
              ],
            ),
          ),
        )
    );
  }
}

