import 'package:flutter/material.dart';

void main() {
  runApp(const HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("BMI Calculator"),
          centerTitle: true,
          backgroundColor: const Color.fromRGBO(33, 33, 33, 1),
        ),
        body: const HomePageBody(),
      ),
    );
  }
}

class HomePageBody extends StatefulWidget {
  const HomePageBody({Key? key}) : super(key: key);

  @override
  _HomePageBodyState createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  final boyController = TextEditingController();
  final kiloController = TextEditingController();
  double bmi = 0;
  var bmiHesaplanmis;

  void _bmiHesapla() {
    double boy = double.parse(boyController.text);
    final kilo = int.parse(kiloController.text);
    print(boy);
    print(kilo);
    setState(() {
      if (boy > 0 && kilo > 0) {
        bmi = (kilo / (boy * boy));
        print(bmi);
        bmiHesaplanmis = bmi;
        print(bmiHesaplanmis);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(33, 33, 33, 1),
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 200,
              child: Image.asset(
                'assets/images/tartı.png',
                fit: BoxFit.cover,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            TextField(
              controller: kiloController,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                hintText: "Kilo",
                fillColor: Colors.white,
                filled: true,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TextField(
              controller: boyController,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                  hintText: "Boy (ör : 1.75)",
                  fillColor: Colors.white,
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.deepPurple, width: 2.0))),
            ),
            const SizedBox(height: 15),
            ConstrainedBox(
              constraints:
                  const BoxConstraints.tightFor(width: 300, height: 50),
              child: ElevatedButton(
                onPressed: _bmiHesapla,
                child: const Text('Hesapla'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.deepPurple,
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25), // <-- Radius
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            SingleChildScrollView(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  bmiHesaplanmis == null
                      ? Text(
                          "",
                        )
                      : Text(
                          "YAĞ ORANINIZ",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'OpenSans',
                              fontSize: 24),
                        ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            SingleChildScrollView(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  bmiHesaplanmis == null
                      ? Text(
                          "",
                        )
                      : Text(
                          bmiHesaplanmis.toString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'OpenSans',
                              fontSize: 24),
                        ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
