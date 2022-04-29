import 'package:badges/badges.dart';
import 'package:fashion/Models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductView extends StatefulWidget {
  final Product product ;
  const ProductView(this.product);

  @override
  _ProductViewState createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  @override
  Widget build(BuildContext context) {
    return Badge(
      position: const BadgePosition(
          top: 17,
        start: 17
      ),
      borderRadius:BorderRadius.circular(15),
      badgeColor:
      widget.product.discount == 0? Colors.black : Colors.red,
      shape: BadgeShape.square,
      badgeContent: SizedBox(
        height: 15,
        width: 33,
        child: Center(
          child: Text(
            widget.product.discount == 0?
            "New":
              "-${widget.product.discount.toString().substring(0,2)}%",
            style: GoogleFonts.abel(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Colors.white
            ),
          ),
        ),
      ),
      child: Container(
        margin: const EdgeInsets.all(8.0),
        height: .4.sh,
        width: .45.sw,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Badge(
              position: const BadgePosition(
                end: -12,
                bottom: -13
              ),
              badgeColor: Colors.white,
              badgeContent: const Icon(Icons.favorite, color: Colors.red,),
              child: Container(
                height: .25.sh,
                width: .45.sw,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(widget.product.imgUrl),
                        fit: BoxFit.cover
                    )
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(5),
              height: 20.h,
              width: 1.sw,
              child: RatingBar.builder(
                initialRating: widget.product.rate,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 5,
                ),
                itemSize: 15,
                onRatingUpdate: (rating) {
                  //print(rating);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text(
                  widget.product.name,
                style: GoogleFonts.abel(
                  fontSize: 17,
                  fontWeight: FontWeight.w600
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text(
                widget.product.description,
                  style: GoogleFonts.abel(
                  fontSize: 20,
                  fontWeight: FontWeight.w600
              ),
              ),
            ),
            Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 7
                    ),
                    child: Text(
                      "${widget.product.price.toString()} \$",
                        style: GoogleFonts.abel(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text(
                      " ${((widget.product.price * (100 - widget.product.discount))/100).toString()} \$",
                      style: GoogleFonts.abel(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                        color: Colors.red
                      ),
                    ),
                  ),
               ],
            ),
          ],
        ),
      ),
    );
  }
}
