import 'package:fashion/Models/category.dart';
import 'package:fashion/View/Widgets/user_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'get_category.dart';
class WomenCat extends StatefulWidget {
  const WomenCat({Key? key}) : super(key: key);

  @override
  _WomenCatState createState() => _WomenCatState();
}

class _WomenCatState extends State<WomenCat> {
  final List<Category>? _list = [
    Category(name: "New" , imgUrl: "https://images.unsplash.com/photo-1591338459467-bd36100b07c2?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzJ8fGNsb3RoZXMlMjB3b21lbnxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
    Category(name: "Clothes" , imgUrl: "https://images.unsplash.com/photo-1615125990940-590bb28a2cea?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjV8fGNsb3RoZXMlMjB3b21lbnxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
    Category(name: "Shoes" , imgUrl: "https://images.unsplash.com/photo-1515347619252-60a4bf4fff4f?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8c2hvZXMlMjB3b21lbnxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
    Category(name: "Accessories" , imgUrl: "https://images.unsplash.com/photo-1521120098171-0400b4ec1319?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzN8fGFjY2Vzc29yaWVzfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
  ];
  List<String> text = [  "Tops", "Shirts & Blouses" , "Cardigans & Sweaters" , "Knitwear" , "Blazers" , "Outerwear" , "Pants" ,"Jeans" , "Shorts" , "Skirts", "Dresses"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            height: .13.sh,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(15)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "SUMMER SALES",
                  style: GoogleFonts.acme(
                    fontSize: 25.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.white
                  ),
                ),
                Text(
                  "Up to 50% off",
                  style: GoogleFonts.acme(
                    fontSize: 15.sp,
                      color: Colors.white
                  ),
                ),
              ],
            ),
          ),
          GetCategory(_list![0]),
          GetCategory(_list![1]),
          GetCategory(_list![2]),
          GetCategory(_list![3]),
          Container(
            margin: EdgeInsets.only(
                top: 20.sp,
              right: 20.sp,
              left: 20.sp
            ),
            child: UserButton(
              title: 'VIEW ALL ITEMS',
              color: Colors.red,
              method: (){},
            ),
          ),
          Padding(
              padding: EdgeInsets.all(20.sp),
            child: Text(
              "Choose category",
              style: GoogleFonts.abel(
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
                color: Colors.grey
              ),
            ),
          ),
          for (int i = 0 ; i < text.length ; i++)
            InkWell(
              onTap: (){
                print(text[i]);
              },
              child: getList()[i]
          )
        ],
      ),
    );
  }
  List<Widget> getList(){
    List<Container> item = [];
    for (var element in text) {
      item.add(
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: 20.sp,
                vertical: 14.sp
            ),
            decoration: BoxDecoration(
              border : Border(
                bottom: BorderSide(width: 2 , color: Colors.black12.withOpacity(.07)),
              ),
            ),
            child: Text(
              element,
              style: GoogleFonts.titilliumWeb(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600
              ),
            ),
          )
      );
    }
    return item;
  }
}
