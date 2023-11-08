import 'package:avd_final_exam/controller/home_controller.dart';
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
                  "Surat - 395004",
                  style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: AppColor.grey
                  ),
                ),
              ],
            )
          ],
        );
      },
    );
  }
}
// return GetBuilder(
// init: HomeController(),
// builder: (HomeController controller) {
// return Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// iconWidget(icon: Icon(Icons.dehaze_rounded, color: MyColor.white,), color: MyColor.themeColor),
// Text(
// "📍 Surat - 395004",
// style: TextStyle(fontSize: 18, color: MyColor.grey),
// ),