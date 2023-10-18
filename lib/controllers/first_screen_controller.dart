import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radar_test_app/models/item.dart';

class FirstScreenController extends GetxController {
  List<ItemModel> items = <ItemModel>[].obs;
  var redCounter = 0.obs;
  var greenCounter = 0.obs;
  var blueCounter = 0.obs;
  var allFilled = false.obs;

  addItemToList(String content) {
    ItemModel itemModel;
    switch (content) {
      case "قرمز":
        itemModel = ItemModel(color: Colors.red, colorContent: "قرمز");

        break;
      case "آبی":
        itemModel = ItemModel(color: Colors.blue, colorContent: "آبی");
        // do something else
        break;
      case "سبز":
        itemModel = ItemModel(color: Colors.green, colorContent: "سبز");
        // do something else
        break;
      default:
        itemModel = ItemModel(color: Colors.red, colorContent: "قرمز");
    }
    items.add(itemModel);
  }

  removeItem(String content) {
    var index =
        items.lastIndexWhere((element) => element.colorContent == content);
    if (index != -1) {
      items.removeAt(index);
    }
  }

  bool validateAllItems() {
    var emptyItem = items.firstWhere(
        (element) => (element.content == null || element.content == ""),
        orElse: () {
      return ItemModel(color: Colors.red, colorContent: "");
    });
    if (emptyItem.colorContent == "") {
      allFilled.value = true;
    } else {
      allFilled.value = false;
    }
    return allFilled.value;
  }

  addCounter(String content) {
    switch (content) {
      case "قرمز":
        redCounter++;

        break;
      case "آبی":
        blueCounter++;
        // do something else
        break;
      case "سبز":
        greenCounter++;
        // do something else
        break;
    }
  }

  increaseCounter(String content) {
    switch (content) {
      case "قرمز":
        if (redCounter.value != 0) {
          redCounter--;
        }

        break;
      case "آبی":
        if (blueCounter.value != 0) {
          blueCounter--;
        }

        // do something else
        break;
      case "سبز":
        if (greenCounter.value != 0) {
          greenCounter--;
        }

        // do something else
        break;
    }
  }
}
