import 'package:fashion/Models/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
class GetCategory extends StatefulWidget {
  final Category? category ;
  const GetCategory(this.category);

  @override
  _GetCategoryState createState() => _GetCategoryState();
}

class _GetCategoryState extends State<GetCategory> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: .13.sh,
      margin: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 5
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade50)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: .13.sh,
            width: .45.sw,
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.category!.name,
                  style: GoogleFonts.abel(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: .13.sh,
            width: .45.sw,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                image: DecorationImage(
                    image: NetworkImage(widget.category!.imgUrl),
                    fit: BoxFit.cover,
                )
            ),
          ),
        ],
      ),
    );;
  }
}
