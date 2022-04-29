import 'package:fashion/Provider/theme_prov.dart';
import 'package:fashion/View/Screens/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'Provider/model_hud.dart';
import 'View/Screens/forget_password.dart';
import 'View/Screens/sign_up.dart';
import 'View/Screens/log_in.dart';
import 'View/Screens/splashing_screen.dart';
import 'View/Screens/visual_search.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => ModelHud()),
          ChangeNotifierProvider(create: (context) => ThemeProv()),
        ],
          child: const Fashion()
      )
  );
}
class Fashion extends StatelessWidget {
  const Fashion({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: () =>
        MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.red,
           brightness: Brightness.light
          ),
          title: "Fashion ",
          color: Colors.white,
          routes: {
            HomePage.id : (context) => const HomePage(),
            LogIn.id : (context) => LogIn(),
            SignUp.id : (context) => const SignUp(),
            ForgetPassword.id : (context) => const ForgetPassword(),
            VisualSearch.id : (context) => const VisualSearch(),
        },
          home: const SafeArea(
            child: SplashingScreen(),
            ),
        )
    );
  }
}