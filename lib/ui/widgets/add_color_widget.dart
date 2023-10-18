import 'package:flutter/material.dart';
import 'package:radar_test_app/controllers/first_screen_controller.dart';

class AddColorWidget extends StatelessWidget {
  final String colorContent;
  final FirstScreenController firstScreenController;
  AddColorWidget({
    super.key,
    required this.colorContent,
    required this.firstScreenController,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  firstScreenController.addCounter(colorContent);

                  firstScreenController.addItemToList(colorContent);
                },
                icon: Icon(Icons.add),
              ),
              Text(colorContent == "قرمز"
                  ? firstScreenController.redCounter.toString()
                  : (colorContent == "آبی"
                      ? firstScreenController.blueCounter.toString()
                      : firstScreenController.greenCounter.toString())),
              IconButton(
                  onPressed: () {
                    firstScreenController.increaseCounter(colorContent);

                    firstScreenController.removeItem(colorContent);
                  },
                  icon: Icon(Icons.remove))
            ],
          ),
          Text(colorContent)
        ],
      ),
    );
  }
}
