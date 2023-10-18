import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radar_test_app/controllers/first_screen_controller.dart';
import 'package:radar_test_app/ui/screens/second_screen.dart';
import 'package:radar_test_app/ui/widgets/add_color_widget.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key, required this.title});

  final String title;

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  var firstPageController = Get.put(FirstScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Obx(() {
        return Column(mainAxisSize: MainAxisSize.max, children: [
          Column(
            children: [
              AddColorWidget(
                colorContent: "قرمز",
                firstScreenController: firstPageController,
              ),
              AddColorWidget(
                colorContent: "آبی",
                firstScreenController: firstPageController,
              ),
              AddColorWidget(
                colorContent: "سبز",
                firstScreenController: firstPageController,
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 29, vertical: 8),
                  width: 100,
                  decoration: BoxDecoration(
                      color: firstPageController.items[index].color,
                      border: Border.all(width: 1)),
                  child: Center(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      onChanged: (value) {
                        firstPageController.items[index].content = value;
                      },
                      decoration: const InputDecoration(
                        hintText: 'Enter a Text for Your Item',
                      ),
                    ),
                  )),
                );
              },
              itemCount: firstPageController.items.length,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            child: InkWell(
              onTap: () {
                if (firstPageController.validateAllItems()) {
                  Get.to(const SecondScreen());
                } else {
                  Get.showSnackbar(const GetSnackBar(
                    title: "Error",
                    message: "Please Fill All Inputs",
                    duration: Duration(seconds: 2),
                  ));
                }
              },
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(border: Border.all(width: 1)),
                padding: const EdgeInsets.all(10),
                child: const Center(child: Text("صفحه بعد")),
              ),
            ),
          )
        ]);
      }),
    );
  }
}
