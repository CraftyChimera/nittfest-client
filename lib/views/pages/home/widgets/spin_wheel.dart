import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';
import 'package:nittfest/controllers/home_controller.dart';

class SpinWheel extends StatelessWidget {
  const SpinWheel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    Size size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Center(
            child: Obx(() => Transform.rotate(
                angle: controller.startAngle.value,
                child: GestureDetector(
                    onPanDown: (details) =>
                        controller.currentPointer = details.localPosition,
                    onPanUpdate: controller.updateStartAngle,
                    onPanEnd: (details) => controller.adjust(),
                    child: Image.asset(
                      'assets/carouselbg.webp',
                    ))))),
        Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Center(
                child: Image.asset(
              'assets/indicator.png',
              height: size.height / 4,
            ))),
        Center(
            child: IconButton(
                onPressed: controller.login,
                iconSize: size.height / 3.8,
                icon: Image.asset('assets/team.webp')))
      ],
    );
  }
}

// return SizedBox(
//       height: isWidthMax ? size.width / 3.5 : size.height / 3.5,
//       width: isWidthMax ? size.width / 3.5 : size.height / 3.5,
//       child: Stack(
//         children: [
//           Center(
//               child: Obx(() => Transform.rotate(
//                   angle: controller.startAngle.value,
//                   child: GestureDetector(
//                       onPanDown: (details) {
//                         print('global: ${details.globalPosition}');
//                         print('local: ${details.localPosition}');
//                         controller.currentPointer = details.localPosition;
//                       },
//                       onPanUpdate: controller.updateStartAngle,
//                       onPanEnd: (details) => controller.adjust(),
//                       child: Image.asset(
//                         'assets/carouselbg.webp',
//                       ))))),
//           Positioned(
//               top: 0,
//               left: 0,
//               right: 0,
//               child: Center(
//                   child: Image.asset(
//                 'assets/indicator.png',
//                 width: size.width / 7,
//               ))),
//           Center(
//               child: Image.asset('assets/team.webp', width: size.width / 6))
//         ],
//       ));
