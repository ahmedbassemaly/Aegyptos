import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyImageView extends StatelessWidget {
  String imgPath;
  String title;

  MyImageView(this.imgPath, this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          // width: MediaQuery.of(context).size.width * 0.8,
          margin: const EdgeInsets.all(6.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Colors.black.withOpacity(0.5),
                Colors.transparent,
              ],
            ),
            image:
                DecorationImage(image: AssetImage(imgPath), fit: BoxFit.cover),
          ),
        ),
        Positioned.fill(
          child: Container(
            padding: const EdgeInsets.all(10.0),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              gradient: LinearGradient(
                colors: [
                  Color(0xFF9f9da9),
                  Colors.transparent,
                  Colors.transparent,
                  Color(0xFF9f9da9),
                ],
                end: Alignment.topCenter,
                begin: Alignment.bottomCenter,
                stops: [0, 0, 0.6, 1],
              ),
            ),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Text(
                title,
                style: GoogleFonts.oswald(
                    textStyle:
                        const TextStyle(fontSize: 25, color: Colors.white)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
