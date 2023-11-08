import 'package:avd_final_exam/controller/home_controller.dart';
import 'package:avd_final_exam/widget/category_button.dart';
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
          ],
        );
      },
    );
  }
}