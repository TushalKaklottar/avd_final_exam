import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../models/models.dart';

class HomeController extends GetxController {


  static HomeController homeController = Get.put(homeController);
  CollectionReference food = FirebaseFirestore.instance.collection('food');
  RxInt index = 0.obs;
  RxString category = "all".obs;

  insertData(Food foods) {
    return food.add(foods.toMap())
        .then((value) => print("Value Added.."))
        .catchError((error) => print("Error :: $error"));
  }
  pageIndex(int val) {
    index.value = val;
    update();
  }

  selectCategory(String val) {
    category.value = val;
    update();
  }

  updateFavourite(String id, bool val) {
    return food
        .doc(id)
        .update({'fav': !val})
        .then((value) => print("Value Updated..."))
        .catchError((error) => print("Error :: $error"));
  }
}
