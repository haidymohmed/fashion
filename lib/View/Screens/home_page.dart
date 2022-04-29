import 'package:fashion/View/Screens/profile.dart';
import 'package:fashion/View/Screens/shop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'bag_page.dart';
import 'favorite.dart';
import 'home.dart';
import 'shop.dart';

class HomePage extends StatefulWidget {
  static String id = "HomePage";
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> list = const [ Home() , Shop() , Bag() , Favorite() , Profile() ] ;
  int index = 0;
  isSignedMethod()async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance() ;
    setState(() {
      sharedPreferences.setBool("signed" , true);
    });
  }
  @override
  initState(){
    super.initState();
    isSignedMethod();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          selectedLabelStyle: GoogleFonts.acme(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500
          ),
          unselectedLabelStyle:  GoogleFonts.acme(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500
          ),
          iconSize: 23.sp,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.grey.shade400,
          currentIndex: index,
          onTap: (value){
            setState(() {
              index = value;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home) , label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.add_shopping_cart) , label: "Shop"),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined) , label: "Bags"),
            BottomNavigationBarItem(icon: Icon(Icons.favorite) , label: "Fav"),
            BottomNavigationBarItem(icon: Icon(Icons.person_outline_rounded) , label: "Profile"),
          ],
        ),
        body: list[index],
      ),
    );
  }
}

