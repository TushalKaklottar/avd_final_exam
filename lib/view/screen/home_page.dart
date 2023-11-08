import 'package:avd_final_exam/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder(
          init: HomeController(),
          builder: (HomeController controller) {
            return Padding(
                padding: EdgeInsets.fromLTRB(20,20,20,0),
              child: IndexedStack(
                index: controller.index.value,
                children: [

                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
// child: IndexedStack(
// index: controller.index.value,
// children: const [
// Home(),
// Chat(),
// AddCart(),
// Favourite(),
// ],
// ),
// );
// }),
// ),
// bottomNavigationBar: const BottomBar(),
// );
// }
// }