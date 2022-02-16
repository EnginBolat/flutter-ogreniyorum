import 'package:flutter/material.dart';
import '../widgets/appbar_design.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarHomePage(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 150,
                    width: 300,
                    child: Card(
                      color: Colors.red,
                      elevation: 16,
                      child: Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(24.0),
                            child: Text.rich(
                              TextSpan(
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                    color: Colors.white),
                                children: [                              
                                  WidgetSpan(
                                    child: Icon(Icons.person,color:Colors.white,size: 32,),
                                  ),
                                  TextSpan(
                                    text: 'Welcome User',
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
