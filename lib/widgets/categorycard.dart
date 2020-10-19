import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/services/utility.dart';

class CategoryCard extends StatelessWidget {
  final String imageAssetUrl, categoryName;

  CategoryCard({this.imageAssetUrl, this.categoryName});

  Widget build(BuildContext context) {
    final _height = Utility.getSize(context).height;
    final _width = Utility.getSize(context).width;
    return Container(
      margin: EdgeInsets.only(right: 14),
      padding: const EdgeInsets.symmetric(vertical: 5),
      alignment: Alignment.center,
      width: _width * 0.23,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.black26,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.asset(
              imageAssetUrl,
              height: _height * 0.035,
              width: _height * 0.035,
            ),
          ),
          Text(
            categoryName,
            style: GoogleFonts.amaranth(
              fontSize: _width * 0.03,
            ),
          ),
        ],
      ),
    );
  }
}
