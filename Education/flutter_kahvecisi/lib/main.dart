import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.brown[300],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              CircleAvatar(
                radius: 70.0,
                backgroundImage: AssetImage("assets/images/kahve.jpg"),
              ),
              Text(
                "Flutter Kahvecisi",
                style: TextStyle(
                  fontFamily: 'Caveat',
                  fontSize: 35,
                  color: Colors.brown[900],
                ),
              ),
              Text(
                "BİR FİNCAN UZAĞINDA",
                style: GoogleFonts.pacifico(fontSize: 14, color: Colors.white),
              ),
              Container(
                width: 200,
                child: Divider(
                    height: 30,
                    color: Colors.brown[900]
                ),
              ),
              SizedBox(height: 10.0),
              Card(
                margin: EdgeInsets.symmetric(
                  horizontal: 40.0
                ),
                color: Colors.brown[900],
                child: ListTile(leading: Icon(Icons.email,color: Colors.white,),
                  title: Text(
                    'engi.bolat@gmail.com',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.0,
                    ),
                  ),
                  ),
              ),
              SizedBox(height: 10.0),
              Card(
                margin: EdgeInsets.symmetric(
                    horizontal: 40.0
                ),
                color: Colors.brown[900],
                child: ListTile(leading:Icon(Icons.phone,color: Colors.white,),
                    title: Text(
                        '+90-000-000-0000',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.0,
                        ),
                    ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  ));
}


