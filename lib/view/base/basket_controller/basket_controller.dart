import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../models/entity/basket/service_entity.dart';
import '../../../utilites/app_logger.dart';
import '../../../utilites/hive_utils/hive_utils.dart';

class BasketController extends GetxController {


  Box<ServiceBasket> box = Boxes.getBasketBox();
  @override
  void onInit() async {
    // getItems();
    super.onInit();
  }
  var isBusyAddToCart = false.obs;
  List<ServiceBasket> item =<ServiceBasket>[];


  // Future getBasket()async {
  //   try{
  //
  //     return rpm;
  //   }catch(e){
  //     AppLogger.e('$e');
  //   }
  // }

  Future addToCart(ServiceBasket item) async {
    try {
      // items.add(item);
      // if (isBusyAddToCart.value == false) {
      // isBusyAddToCart.value = true;
      await box.put(item.id, item);
      // await box.add(item);
      // isBusyAddToCart.value = false;
      // }
      // await box.add(item);
      // update();
    } catch (e) {
      AppLogger.catchLog(e);
    }
  }

  Future removeItem(ServiceBasket item) async {
    try {
      box.delete(item.id);
    } catch (e) {
      AppLogger.catchLog("$e");
    }
  }

  clearCart() {
    try {
      Hive.deleteBoxFromDisk(Boxes.basketBox);
    } catch (error) {
      debugPrint('$error');
    }
  }

  increase(int? productID) {
    if (productID == null) {
      return;
    }
    try {
      item =
          box.values.where((element) => element.id == productID).toList();

      if (item.isNotEmpty) {
        ServiceBasket items = item.first;
        // removeItem(items);
        items.quantity++;
        update();
        addToCart(items);
      }
    } catch (e) {
      printError(info: "$e");
    }
  }

  decrease(int? productID) {
    if (productID == null) {
      return;
    }
    ServiceBasket item =
    box.values.singleWhere((element) => element.id == productID);
    removeItem(item);
    item.quantity--;
    if (item.quantity > 0) {
      addToCart(item);
    }
    update();
  }

  int checkItemCount(int? productID) {
    try {
      if (productID == null) {
        return 0;
      }

      item = box.values.where((element) => element.id == productID).toList();
      return item.isEmpty ? 0 : item[0].quantity ;
    } catch (e) {
      return 0;
    }
  }
  double discountTotal() {
    double total = 0;
    for (var element in box.values) {
      double discount = double.parse(element.discount);
      var quant = element.quantity;
      total = total + (discount * quant);
    }
    return total;
  }
  double calculatedTotal() {
    double total = 0;
    for (var element in box.values) {
      double price = double.parse(element.price);
      var quant = element.quantity;
      total = total + (price * quant);
    }
    return total;
  }
  double total() {
    double total = 0;
    for (var element in box.values) {
      total =calculatedTotal()-discountTotal();
    }
    return total;
  }
}
