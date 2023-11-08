import 'package:avd_final_exam/utils/colors.dart';
import 'package:avd_final_exam/view/screen/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
        return Scaffold(
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: GestureDetector(
            onTap: () => Get.off(() => const HomePage()),
            child: Container(
              margin: const EdgeInsets.all(15),
              height: 42,
              width: 200,
              decoration: BoxDecoration(
                color: AppColor.green,
                borderRadius: BorderRadius.circular(15),
              ),
              alignment: Alignment.center,
              child: Text(
                "Get Started",
                    style: GoogleFonts.poppins(
                  color: AppColor.white,
                      fontSize: 15
              ),
              ),
            ),
          ),
          backgroundColor: AppColor.white1,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               Image.asset(
                    "assets/images/img.png",
                    height: 200,
                ),
                const SizedBox(height: 30),
                Text(
                  "The Fastest In Delivery Food",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.roboto(
                    color: AppColor.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "Our Job is to filling your tummy with delicious fast delivery",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.roboto(
                    color: AppColor.grey,
                    letterSpacing: 0.1,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        );
  }
}
