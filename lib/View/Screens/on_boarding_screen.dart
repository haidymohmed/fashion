import 'package:fashion/View/Screens/log_in.dart';
import 'package:fashion/View/Screens/sign_up.dart';
import 'package:fashion/View/Widgets/intro_page_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late final List<PageViewModel> _listPageViewModel ;

  firstTime()async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance() ;
    sharedPreferences.setBool("first", false);
  }
  @override
  initState(){
    super.initState();
    firstTime();
  }
  @override
  Widget build(BuildContext context) {
    _listPageViewModel = [
      IntroPageModel("","","images/deliveries.svg",false , context),
      IntroPageModel("Hello","Second Page","images/marilyn.svg",false , context),
      IntroPageModel("All You Need","Everything you imagine are here with us , More than 100 brands with special price","images/online shopping.svg",true , context),
    ];
    return SafeArea(
      child: Scaffold(
        body: IntroductionScreen(
          pages: _listPageViewModel,
          onDone: () {
            Navigator.popAndPushNamed(context, SignUp.id);
          },
          onSkip: () {
            Navigator.popAndPushNamed(context, SignUp.id);
          },
          showSkipButton: true,
          skip: Text("Skip",style: GoogleFonts.titilliumWeb(fontSize: 18.sp , fontWeight: FontWeight.w600,color: Colors.red.shade900),),
          next: Text("Next",style: GoogleFonts.titilliumWeb(fontSize: 18.sp , fontWeight: FontWeight.w600,color: Colors.red.shade900),),
          done: Text("Done",style: GoogleFonts.titilliumWeb(fontSize: 18.sp , fontWeight: FontWeight.w600,color: Colors.red.shade900),),
          dotsDecorator: DotsDecorator(
              size: const Size.square(10.0),
              activeSize: const Size(20.0, 10.0),
              color: Colors.red.shade800,
              activeColor: Colors.red.shade900,
              spacing: const EdgeInsets.symmetric(horizontal: 3.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0)
              )
          ),
        ),
      ),
    );
  }

}
