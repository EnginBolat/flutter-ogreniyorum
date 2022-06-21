import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_tutorial/controller.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Getx Tutorial",
      home: Home(),
    );
  }
}

// ignore: must_be_immutable
class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  var controller = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => Text("${controller.counter}",
                  style: Theme.of(context).textTheme.headline4),
            ),
            ElevatedButton(
              onPressed: () async {
                await Get.to(
                  () => Second(),
                );
              },
              child: const Text("Second"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.increment();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class Second extends StatelessWidget {
  Second({Key? key}) : super(key: key);
  final Controller ctrl = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(
          () => Text(
            "${ctrl.counter}",
          ),
        ),
      ),
    );
  }
}
