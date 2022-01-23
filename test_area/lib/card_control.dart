import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class CardControl extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        Container(
          padding: EdgeInsets.all(5),
          height: 500,
          width: 200,
          child: Column(
            children: [
              Expanded(
                child: AspectRatio(
                  aspectRatio: 4 / 3,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      "https://images.unsplash.com/photo-1542291026-7eec264c27ff?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Text(
                "Red Shoe",
                style: GoogleFonts.getFont("Sedgwick Ave",fontSize: 24),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(5),
          height: 200,
          width: 200,
          child: Column(
            children: [
              Expanded(
                child: AspectRatio(
                  aspectRatio: 4 / 3,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      "https://images.unsplash.com/photo-1595950653106-6c9ebd614d3a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Text(
                "Pink Shoe",
                style: GoogleFonts.getFont("Sedgwick Ave",fontSize: 24),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(5),
          height: 200,
          width: 200,
          child: Column(
            children: [
              Expanded(
                child: AspectRatio(
                  aspectRatio: 4 / 3,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      "https://images.unsplash.com/photo-1600185365483-26d7a4cc7519?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=725&q=80",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Text(
                "Orange Shoe",
               style: GoogleFonts.getFont("Sedgwick Ave",fontSize: 24),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
