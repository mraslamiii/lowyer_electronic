import 'package:hive/hive.dart';
import '../../models/entity/basket/service_entity.dart';
class Boxes {
  static String basketBox = "BasketBox";

  // static Box<BasketItem> getBasketBox() => Hive.box(basketBox);
  static Box<ServiceBasket> getBasketBox() => Hive.box(basketBox);
}
