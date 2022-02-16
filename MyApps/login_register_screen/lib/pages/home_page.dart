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
                    height: 200,
                    width: 350,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      color: Colors.red,
                      elevation: 16,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const <Widget>[
                              Padding(
                                padding: EdgeInsets.only(right:32,top:25,bottom: 25,left: 32),
                                child: Text.rich(
                                  TextSpan(
                                    style: TextStyle(
                                        fontSize: 24,
                                        color: Colors.white),
                                    children: [
                                      TextSpan(
                                        text: 'Card',
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                                 Text.rich(
                                  TextSpan(
                                    style: TextStyle(
                                        fontSize: 32,
                                        color: Colors.white,),
                                    children: [
                                      TextSpan(
                                        text: '1234 **** **** 5678',
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                          ),

                          Padding(
                            padding: const EdgeInsets.only(right:32.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: const [
                                Padding(
                                  padding: EdgeInsets.only(top:24.0),
                                  child: Text.rich(
                                    TextSpan(
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,),
                                      children: [
                                        TextSpan(
                                          text: '06/23',
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
