import 'package:fashion/Contraller/auth.dart';
import 'package:fashion/View/Screens/sign_up.dart';
import 'package:fashion/View/Widgets/dynamic_text_field.dart';
import 'package:fashion/View/Widgets/user_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgetPassword extends StatefulWidget {
  static String id = "ForgetPassword";
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  AuthContraller authContraller = AuthContraller();
  TextEditingController controller = TextEditingController();
  late String email;
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
                "Forget Password",
                style: GoogleFonts.titilliumWeb(
                    fontSize: 25.sp, fontWeight: FontWeight.w600),
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              "Please , enter your email address , You will receive a link to create a new password via email ",
              style: GoogleFonts.titilliumWeb(
                  fontSize: 15.sp, fontWeight: FontWeight.w600),
            ),
          ),
          CustomerTextField(
            controller: controller,
            fieldName: "Email",
            hint: "Enter your Email ",
            scure: false,
            suffixIcon: false,
          ),
          const SizedBox(height: 10),
          UserButton(
            title: 'Reset Password',
            color: Colors.red,
            method: () async {
              if (controller.text.isNotEmpty) {
                if (controller.text.endsWith("@gmail.com")) {
                  try {
                    await authContraller.forgotPassword(controller.text);
                    showMessage("Check your E-mail");
                  } catch (e) {
                    showMessage(e.toString());
                  }
                } else {
                  showMessage("name.gmail.com");
                }
              } else {
                showMessage("Enter your Email");
              }
            },
          ),
          const Spacer(),
          const Spacer(),
          const Spacer(),
        ],
      ),
    );
  }
  showMessage(message){
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(
        message
      ))
    );
  }
}
