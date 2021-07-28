// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:parenteach/controllers/selector_controller.dart';
// import 'package:parenteach/utils/utils.dart';

// class CustomSelector extends StatelessWidget {
//   final SelectorController _selectorController = Get.find();
//   final String? type;

//   CustomSelector({Key? key, this.type}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       constraints: BoxConstraints(
//           minHeight: 100, maxHeight: 500, minWidth: 300, maxWidth: 300),
//       padding: const EdgeInsets.all(8.0),
//       child: ScrollConfiguration(
//         behavior: CustomScrollBehavior(),
//         child: SingleChildScrollView(
//           child: Column(
//             children: List<Widget>.generate(

//               controller.matrixList.length,
//               (index) => ListTile(
//                 title: Text(controller.matrixList[index]),
//                 onTap: () {
//                   controller.matrixText.value = controller.matrixList[index];
//                   controller.modelUnitText.value = "";
//                   controller.typeUnit.value = "";
//                   Get.back(closeOverlays: false);
//                 },
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
