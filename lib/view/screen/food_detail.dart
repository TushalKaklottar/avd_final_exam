import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FoodDetails  extends StatelessWidget {
  QueryDocumentSnapshot food;
   FoodDetails ({Key? key, required this.food}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}

// class FoodDetails extends StatelessWidget {
//   QueryDocumentSnapshot food;
//   FoodDetails({Key? key, required this.food,}) : super(key: key);
//
//   @override