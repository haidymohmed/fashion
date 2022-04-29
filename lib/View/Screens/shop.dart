import 'package:fashion/View/Screens/visual_search.dart';
import 'package:fashion/View/Widgets/women_category.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
class Shop extends StatefulWidget {
  const Shop({Key? key}) : super(key: key);

  @override
  _ShopState createState() => _ShopState();
}
class _ShopState extends State<Shop> with SingleTickerProviderStateMixin{
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: NestedScrollView(
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  leading: const CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 20,
                    child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                    ),
                  ),
                  actions: [
                    InkWell(
                      onTap: (){
                        Navigator.pushNamed(context, VisualSearch.id);
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Icons.search, color: Colors.black,size: 30),
                      ),
                    )
                  ],
                  title:  Center(child: Text("Categories",style: GoogleFonts.abel(color: Colors.black,fontSize: 20.sp,fontWeight: FontWeight.bold),)),
                  centerTitle: true,
                  backgroundColor: Colors.white,
                  pinned: true,
                  floating: true,
                  forceElevated: innerBoxIsScrolled,
                  bottom: TabBar(
                    unselectedLabelColor: Colors.black,
                    labelColor: Colors.red,
                    indicatorColor: Colors.red,
                    indicatorWeight: 3,
                    tabs: [
                      getTab('Women'),
                      getTab('Men'),
                      getTab('Kids'),
                    ],
                    controller: _tabController,
                  ),
                ),
              ];
            },
            body: TabBarView(
              controller: _tabController,
              children: const <Widget>[
                WomenCat(),
                WomenCat(),
                WomenCat(),
              ],
            ),
          ),
        ),
    );
  }
  Tab getTab(String title){
    return Tab(
        child: Text(
          title,
          style: GoogleFonts.abel(
              fontSize: 18.sp,
              fontWeight: FontWeight.w700
          ),
        )
    );
  }
}
