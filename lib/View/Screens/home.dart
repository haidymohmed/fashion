import 'package:fashion/Models/product.dart';
import 'package:fashion/View/Widgets/product_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool check = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: 1.sw,
        height: 1.sh,
        child: ListView(
          children: [
            check?
            SizedBox(
              height: .75.sh,
              child: Column(
                children: [
                  Container(
                    height: .25.sh,
                    width: 1.sw,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage("https://images.unsplash.com/photo-1503342217505-b0a15ec3261c?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fHN0cmVldCUyMGNsb3RoZXN8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
                        fit: BoxFit.cover
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 20
                      ),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          "Street Clothes",
                          style: GoogleFonts.acme(
                            fontSize: 30.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8,left: 8),
                            child: Text(
                                "Sale",
                              style: GoogleFonts.titilliumWeb(
                                fontSize: 25.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Text(
                              "Super Summer Sale",
                              style: GoogleFonts.titilliumWeb(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: InkWell(
                          onTap: (){},
                          child: Text(
                            "View All",
                            style: GoogleFonts.titilliumWeb(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 1.sw,
                    height: .4.sh,
                    child: ListView.builder(
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context , index){
                        return InkWell(
                          onTap: (){},
                          child: ProductView(
                            Product(
                              imgUrl : "https://images.unsplash.com/photo-1516762689617-e1cffcef479d?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Y2xvdGhpbmd8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
                              name : "Dorothy Perkins",
                              description : "Evening Dress",
                              price : 15,
                              discount : 20,
                              rate : 2.4,
                              fav : false,
                            ),
                          )
                        );
                      }
                    ),
                  ),
                ],
              ),
            )
            :
            Container(
              padding: const EdgeInsets.all(20),
              height: .6.sh,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    "https://images.unsplash.com/photo-1485043621645-c983f19e23c6?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NTV8fGZhc2hpb24lMjBnaXJsc3xlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"
                  ),
                  fit: BoxFit.cover
                )
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Fashion",
                            style: GoogleFonts.acme(
                                fontSize: 30.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                        ),
                  Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Sale",
                            style: GoogleFonts.acme(
                                fontSize: 30.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                        ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 30.h,
                      width: .4.sw,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.red,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              )),
                          onPressed: () {
                            setState(() {
                              check = ! check;
                            });
                            },
                          child: Text(
                            "Check",
                            style: GoogleFonts.titilliumWeb(
                                fontSize: 15.sp, fontWeight: FontWeight.w600
                            ),
                          )
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8,left: 8),
                      child: Text(
                        "New",
                        style: GoogleFonts.titilliumWeb(
                          fontSize: 25.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text(
                        "You’ve never seen it before!",
                        style: GoogleFonts.titilliumWeb(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: InkWell(
                    onTap: (){},
                    child: Text(
                      "View All",
                      style: GoogleFonts.titilliumWeb(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 1.sw,
              height: .4.sh,
              child: ListView.builder(
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context , index){
                    return InkWell(
                        onTap: (){},
                        child: ProductView(
                          Product(
                            imgUrl : "https://images.unsplash.com/photo-1516762689617-e1cffcef479d?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Y2xvdGhpbmd8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
                            name : "Dorothy Perkins",
                            description : "Evening Dress",
                            price : 15,
                            discount : 0,
                            rate : 2.4,
                            fav : false,
                          ),
                        )
                    );
                  }
              ),
            ),

            Container(
              height: .5.sh,
              width: 1.sw,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage("https://images.unsplash.com/photo-1542027647914-2d14ab410432?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjB8fHlvdW5nJTIwZ2lybHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
                    fit: BoxFit.cover
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 20
                ),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    "New Collection",
                    style: GoogleFonts.acme(
                      fontSize: 30.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Column(
                  children: [
                    Container(
                      height: .25.sh,
                      width: .5.sw,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 20
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Summer    Sale",
                            style: GoogleFonts.acme(
                              fontSize: 30.sp,
                              color: Colors.red,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: .25.sh,
                      width: .5.sw,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage("https://images.unsplash.com/photo-1582492702027-2a12bc75322f?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzN8fGJsYWNrJTIwb3V0Zml0fGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
                            fit: BoxFit.cover
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 20
                        ),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            "Black",
                            style: GoogleFonts.acme(
                              fontSize: 30.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                Container(
                  height: .5.sh,
                  width: .5.sw,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage("https://images.unsplash.com/photo-1552374196-1ab2a1c593e8?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8ZmFzaGlvbiUyMG1lbnxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
                        fit: BoxFit.cover
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 20
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Men’s   hoodies",
                        style: GoogleFonts.acme(
                          fontSize: 30.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
