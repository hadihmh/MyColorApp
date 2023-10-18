import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radar_test_app/controllers/second_screen_controller.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  SecondScreenController secondScreenController =
      Get.put(SecondScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Second page"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Visibility(
            visible: secondScreenController.redItems.isNotEmpty,
            child: Flexible(
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                decoration: BoxDecoration(
                    color: Colors.red, border: Border.all(width: 1)),
                height: secondScreenController.redItems.length * 40,
                child: ListView.builder(
                    itemCount: secondScreenController.redItems.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Center(
                          child: Text(
                              secondScreenController.redItems[index].content ??
                                  ""),
                        ),
                      );
                    }),
              ),
            ),
          ),
          Visibility(
            visible: secondScreenController.blueItems.isNotEmpty,
            child: Flexible(
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                decoration: BoxDecoration(
                    color: Colors.blue, border: Border.all(width: 1)),
                height: secondScreenController.blueItems.length * 40,
                child: ListView.builder(
                    itemCount: secondScreenController.blueItems.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Center(
                          child: Text(
                              secondScreenController.blueItems[index].content ??
                                  ""),
                        ),
                      );
                    }),
              ),
            ),
          ),
          Visibility(
            visible: secondScreenController.greenItems.isNotEmpty,
            child: Flexible(
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                decoration: BoxDecoration(
                    color: Colors.green, border: Border.all(width: 1)),
                height: secondScreenController.greenItems.length * 40,
                child: ListView.builder(
                    itemCount: secondScreenController.greenItems.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Center(
                          child: Text(secondScreenController
                                  .greenItems[index].content ??
                              ""),
                        ),
                      );
                    }),
              ),
            ),
          )
        ],
      ),
    );
  }
}
