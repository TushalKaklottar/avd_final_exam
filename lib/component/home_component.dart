import 'package:avd_final_exam/controller/home_controller.dart';
import 'package:avd_final_exam/view/screen/food_detail.dart';
import 'package:avd_final_exam/widget/category_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/colors.dart';
import '../widget/icon_widget.dart';

class HomeCom extends StatelessWidget {
  const HomeCom({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: HomeController(),
      builder: (HomeController controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                iconWidget(icon: Icon(Icons.dehaze_rounded, color: AppColor.white,),
                    color: AppColor.green,
                ),
                Text(
                  "Surat - 395005",
                  style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: AppColor.grey
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15,),
            Text(
              "Hi Tushal",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppColor.green,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              "Find Your Food",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: AppColor.black,
              ),
            ),
            const SizedBox(height: 5),
            const CupertinoSearchTextField(),
            const SizedBox(height: 10),
            Row(
              children: [
                GestureDetector(
                  onTap: () => controller.selectCategory("All"),
                  child: categoryButton(tittle: "All"),
                ),
                GestureDetector(
                  onTap: () => controller.selectCategory("Food"),
                  child: categoryButton(tittle: "Food"),
                ),
                GestureDetector(
                  onTap: () => controller.selectCategory("Fruit"),
                  child: categoryButton(tittle: "Fruit"),
                ),
                GestureDetector(
                  onTap: () => controller.selectCategory("Vegetable"),
                  child: categoryButton(tittle: "Vegetable"),
                ),
              ],
            ),
            Expanded(
                child: StreamBuilder(
                  stream: (controller.category.value == "All")
                  ? FirebaseFirestore.instance.collection('food').snapshots()
                  : FirebaseFirestore.instance.collection('food').where('category', isEqualTo: controller.category.value,).snapshots(),
                  builder: (context,snapShot)  {
                    if(snapShot.hasError) {
                      return const Center(child: Text("Something went Wrong!!"),
                      );
                    } else if(snapShot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      return GridView.builder(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          padding: const EdgeInsets.only(top: 10),
                          itemCount: snapShot.data!.docs.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                            childAspectRatio: 1/1.25,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                          ),
                          itemBuilder: (context,index) {
                            List data = snapShot.data!.docs;
                            return GestureDetector(
                              onTap: () => Get.to(() => FoodDetails(food: snapShot.data!.docs[index],
                              ),
                              ),
                              child: Card(
                                elevation: 3,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25)
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        alignment: Alignment.centerRight,
                                        child: IconButton(
                                          icon: (data[index]['fav'])
                                              ? Icon(CupertinoIcons.heart_fill, color: AppColor.red,)
                                                 : Icon(CupertinoIcons.heart, color: AppColor.grey,),
                                          splashRadius: 5,
                                          onPressed: ()  => controller.updateFavourite(snapShot.data!.docs[index].id, data[index]['fav'])
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        height : 60,
                                        child: Hero(
                                          tag: data[index]['img'],
                                          child: Image.network("${data[index]['img']}"),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }
                      );
                    }
                  },
                )
            )
          ],
        );
      },
    );
  }
}
