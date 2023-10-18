import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radar_test_app/controllers/first_screen_controller.dart';
import 'package:radar_test_app/models/item.dart';

class SecondScreenController extends GetxController {
  List<ItemModel> redItems = <ItemModel>[].obs;
  List<ItemModel> blueItems = <ItemModel>[].obs;
  List<ItemModel> greenItems = <ItemModel>[].obs;

  FirstScreenController firstScreenController = Get.find();

  @override
  void onInit() {
    combineItems();
    super.onInit();
  }

  combineItems() {
    firstScreenController.items.forEach((element) {
      switch (element.color) {
        case Colors.red:
          redItems.add(element);

          break;
        case Colors.blue:
          blueItems.add(element);
          break;
        case Colors.green:
          greenItems.add(element);
          break;
      }
    });
  }
}
