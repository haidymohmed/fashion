import 'package:fashion/View/Widgets/dynamic_text_field.dart';
import 'package:fashion/View/Widgets/user_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
class VisualSearch extends StatefulWidget {
  static String id = "VisualSearch";
  const VisualSearch({Key? key}) : super(key: key);
  @override
  _VisualSearchState createState() => _VisualSearchState();
}

class _VisualSearchState extends State<VisualSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: CircleAvatar(
          radius: 20.sp,
          backgroundColor: Colors.white,
          child: InkWell(
            onTap: (){
              Navigator.pop(context);
            },
              child: const Icon(Icons.arrow_back,color: Colors.black,)
          ),
        ),
        title: Center(
          child: Text(
            "Virtual Search" ,
            style: GoogleFonts.titilliumWeb(
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
              color: Colors.black
            ),
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: NetworkImage("https://images.unsplash.com/photo-1613915617430-8ab0fd7c6baf?ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8ZmFzaGlvbiUyMG1vZGVsfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
                fit: BoxFit.cover
            )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                "Search for an outfit by taking a photo or uploading an image",
                style: GoogleFonts.titilliumWeb(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w600,
                  color: Colors.white
                ),
              ),
            ),
            const SizedBox(height: 10),
            UserButton(
              title : 'TAKE A PHOTO',
              color : Colors.red,
              method : (){
                //Navigator.pushNamed(context, SignUp.id);
              },
            ),
            const SizedBox(height: 10),
            UserButton(
              title : 'UPLOAD AN IMAGE',
              color : Colors.transparent,
              method : (){
                //Navigator.pushNamed(context, SignUp.id);
              },
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
