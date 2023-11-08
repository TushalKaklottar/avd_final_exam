import 'package:avd_final_exam/controller/home_controller.dart';
import 'package:avd_final_exam/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

Widget categoryButton({required String tittle}) {
  return Obx(() => Container(
    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
    margin: EdgeInsets.symmetric(horizontal: 2),
    decoration: BoxDecoration(
      color: (HomeController.homeController.category == tittle) ?
          AppColor.grey :
          AppColor.transparent,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Text(
      tittle,
      style: GoogleFonts.poppins(
        fontSize: 16,
        color: (HomeController.homeController.category == tittle) ?
        AppColor.green:
        AppColor.black,
      ),
    ),
  )
  );
}
