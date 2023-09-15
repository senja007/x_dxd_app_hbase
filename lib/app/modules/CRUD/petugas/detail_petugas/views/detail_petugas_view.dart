import 'package:crud_flutter_api/app/routes/app_pages.dart';
import 'package:crud_flutter_api/app/utils/app_color.dart';
import 'package:crud_flutter_api/app/widgets/message/custom_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../controllers/detail_petugas_controller.dart';

class DetailPetugasView extends GetView<DetailPetugasController> {
  const DetailPetugasView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary,
      appBar: AppBar(
        title: Text(
          'Detail Petugas',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              controller.tombolEdit();
            },
            icon: Icon(Icons.edit),
          ),
        ],
        backgroundColor: Color(0xff132137),
        elevation: 0,
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 1,
            color: AppColor.secondaryExtraSoft,
          ),
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(20),
        children: [
          Obx(() {
            return Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(left: 14, right: 14, top: 4),
              margin: EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: controller.isEditing.value
                    ? Colors.grey[200]
                    : Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
                border:
                    Border.all(width: 1, color: AppColor.secondaryExtraSoft),
              ),
              child: TextFormField(
                enabled: false,
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'poppins',
                  color: Colors.black,
                ),
                controller: controller.nikC,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "NIK Petugas",
                  labelStyle: TextStyle(
                    color: AppColor.secondarySoft,
                    fontSize: 14,
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  border: InputBorder.none,
                  hintText: "NIK KTP",
                  hintStyle: TextStyle(
                    fontSize: 14,
                    fontFamily: 'poppins',
                    fontWeight: FontWeight.w500,
                    color: AppColor.secondarySoft,
                  ),
                ),
              ),
            );
          }),
          Obx(() => Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(left: 14, right: 14, top: 4),
                margin: EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: controller.isEditing.value
                      ? Colors.white
                      : Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                  border:
                      Border.all(width: 1, color: AppColor.secondaryExtraSoft),
                ),
                child: TextFormField(
                  enabled: controller.isEditing.value,
                  style: TextStyle(
                      fontSize: 14, fontFamily: 'poppins', color: Colors.black),
                  maxLines: 1,
                  autofocus: true,
                  controller: controller.namaC,
                  focusNode: controller.namaFocusNode,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    label: Text(
                      "Nama Petugas",
                      style: TextStyle(
                        color: AppColor.secondarySoft,
                        fontSize: 14,
                      ),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: InputBorder.none,
                    hintText: "Nama Lengkap",
                    hintStyle: TextStyle(
                      fontSize: 14,
                      fontFamily: 'poppins',
                      fontWeight: FontWeight.w500,
                      color: AppColor.secondarySoft,
                    ),
                  ),
                ),
              )),
          Obx(() => Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(left: 14, right: 14, top: 4),
                margin: EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: controller.isEditing.value
                      ? Colors.white
                      : Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                  border:
                      Border.all(width: 1, color: AppColor.secondaryExtraSoft),
                ),
                child: TextFormField(
                  enabled: controller.isEditing.value,
                  style: TextStyle(
                      fontSize: 14, fontFamily: 'poppins', color: Colors.black),
                  maxLines: 1,
                  controller: controller.tlpC,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    label: Text(
                      "No Telepon",
                      style: TextStyle(
                        color: AppColor.secondarySoft,
                        fontSize: 14,
                      ),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: InputBorder.none,
                    hintText: "No Telepon",
                    hintStyle: TextStyle(
                      fontSize: 14,
                      fontFamily: 'poppins',
                      fontWeight: FontWeight.w500,
                      color: AppColor.secondarySoft,
                    ),
                  ),
                ),
              )),
          Obx(() => Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(left: 14, right: 14, top: 4),
                margin: EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: controller.isEditing.value
                      ? Colors.white
                      : Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                  border:
                      Border.all(width: 1, color: AppColor.secondaryExtraSoft),
                ),
                child: TextFormField(
                  enabled: controller.isEditing.value,
                  style: TextStyle(
                      fontSize: 14, fontFamily: 'poppins', color: Colors.black),
                  maxLines: 1,
                  controller: controller.emailC,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    label: Text(
                      "Email",
                      style: TextStyle(
                        color: AppColor.secondarySoft,
                        fontSize: 14,
                      ),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: InputBorder.none,
                    hintText: "Email",
                    hintStyle: TextStyle(
                      fontSize: 14,
                      fontFamily: 'poppins',
                      fontWeight: FontWeight.w500,
                      color: AppColor.secondarySoft,
                    ),
                  ),
                ),
              )),
          Obx(() {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (controller.isEditing.value)
                  ElevatedButton(
                    onPressed: () {
                      controller.editPetugas();
                    },
                    child: Text(
                      'Edit post',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'poppins',
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(120, 55),
                      backgroundColor: Color(0xff132137),
                      padding: EdgeInsets.symmetric(vertical: 18),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    // ... Other button properties
                  )
                else
                  ElevatedButton(
                    onPressed: () {
                      controller.deletePost();
                    },
                    child: Text(
                      'Delete post',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'poppins',
                        color: AppColor.primaryExtraSoft,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(120, 55),
                      backgroundColor: Color(0xff132137),
                      padding: EdgeInsets.symmetric(vertical: 18),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
              ],
            );
          })
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     ElevatedButton(
          //       onPressed: () {
          //         controller.editPetugas();
          //       },
          //       child: Text(
          //         'Edit post',
          //         style: TextStyle(
          //           fontSize: 16,
          //           fontFamily: 'poppins',
          //           color: Colors.white,
          //         ),
          //       ),
          //       style: ElevatedButton.styleFrom(
          //         fixedSize: Size(120, 55),
          //         backgroundColor: Color(0xff132137),
          //         padding: EdgeInsets.symmetric(vertical: 18),
          //         elevation: 0,
          //         shape: RoundedRectangleBorder(
          //           borderRadius: BorderRadius.circular(8),
          //         ),
          //       ),
          //     ),
          //     SizedBox(
          //       width: 25,
          //     ),
          //     ElevatedButton(
          //       onPressed: () {
          //         controller.deletePost();
          //       },
          //       child: Text(
          //         'Delete post',
          //         style: TextStyle(
          //           fontSize: 16,
          //           fontFamily: 'poppins',
          //           color: AppColor.primaryExtraSoft,
          //         ),
          //       ),
          //       style: ElevatedButton.styleFrom(
          //         fixedSize: Size(120, 55),
          //         backgroundColor: Color(0xff132137),
          //         padding: EdgeInsets.symmetric(vertical: 18),
          //         elevation: 0,
          //         shape: RoundedRectangleBorder(
          //           borderRadius: BorderRadius.circular(8),
          //         ),
          //       ),
          //     ),
          //   ],
          // )
        ],
      ),
    );
  }
}



// import 'package:crud_flutter_api/app/routes/app_pages.dart';
// import 'package:crud_flutter_api/app/utils/app_color.dart';
// import 'package:crud_flutter_api/app/widgets/message/custom_input.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// import 'package:get/get.dart';

// import '../controllers/detail_petugas_controller.dart';

// class DetailPetugasView extends GetView<DetailPetugasController> {
//   const DetailPetugasView({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColor.primary,
//       appBar: AppBar(
//         title: Text(
//           'Detail Petugas',
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 18,
//           ),
//         ),
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back), // Ikon panah kembali
//           onPressed: () {
//             Navigator.of(context).pop(); // Aksi saat tombol diklik
//           },
//         ),
//         actions: [
//           IconButton(
//               onPressed: () {
//                 controller.tombolEdit();
//               },
//               icon: Icon(Icons.edit)),
//         ],
//         backgroundColor: Color(0xff132137),
//         elevation: 0,
//         centerTitle: true,
//         bottom: PreferredSize(
//           preferredSize: Size.fromHeight(1),
//           child: Container(
//             width: MediaQuery.of(context).size.width,
//             height: 1,
//             color: AppColor.secondaryExtraSoft,
//           ),
//         ),
//       ),
//       body: ListView(
//         shrinkWrap: true,
//         physics: BouncingScrollPhysics(),
//         padding: EdgeInsets.all(20),
//         children: [
//           Container(
//             width: MediaQuery.of(context).size.width,
//             padding: EdgeInsets.only(left: 14, right: 14, top: 4),
//             margin: EdgeInsets.only(bottom: 16),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(8),
//               border: Border.all(width: 1, color: AppColor.secondaryExtraSoft),
//             ),
//             child: TextFormField(
//               enabled: controller.isEditing.value,
//               style: TextStyle(
//                 fontSize: 14,
//                 fontFamily: 'poppins',
//                 color: Colors.black,
//               ),
//               controller: controller.nikC,
//               keyboardType: TextInputType.number,
//               decoration: InputDecoration(
//                 labelText: "NIK Petugas",
//                 labelStyle: TextStyle(
//                   color: AppColor.secondarySoft,
//                   fontSize: 14,
//                 ),
//                 floatingLabelBehavior: FloatingLabelBehavior.always,
//                 border: InputBorder.none,
//                 hintText: "NIK KTP",
//                 hintStyle: TextStyle(
//                   fontSize: 14,
//                   fontFamily: 'poppins',
//                   fontWeight: FontWeight.w500,
//                   color: AppColor.secondarySoft,
//                 ),
//               ),
//             ),
//           ),
//           Container(
//             width: MediaQuery.of(context).size.width,
//             padding: EdgeInsets.only(left: 14, right: 14, top: 4),
//             margin: EdgeInsets.only(bottom: 16),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(8),
//               border: Border.all(width: 1, color: AppColor.secondaryExtraSoft),
//             ),
//             child: TextField(
//               enabled: controller.isEditing.value,
//               style: TextStyle(
//                   fontSize: 14, fontFamily: 'poppins', color: Colors.black),
//               maxLines: 1,
//               autofocus: true,
//               controller: controller.namaC,
//               focusNode: controller.namaFocusNode,
//               keyboardType: TextInputType.name,
//               decoration: InputDecoration(
//                 label: Text(
//                   "Nama Petugas",
//                   style: TextStyle(
//                     color: AppColor.secondarySoft,
//                     fontSize: 14,
//                   ),
//                 ),
//                 floatingLabelBehavior: FloatingLabelBehavior.always,
//                 border: InputBorder.none,
//                 hintText: "Nama Lengkap",
//                 hintStyle: TextStyle(
//                   fontSize: 14,
//                   fontFamily: 'poppins',
//                   fontWeight: FontWeight.w500,
//                   color: AppColor.secondarySoft,
//                 ),
//               ),
//             ),
//           ),
//           Container(
//             width: MediaQuery.of(context).size.width,
//             padding: EdgeInsets.only(left: 14, right: 14, top: 4),
//             margin: EdgeInsets.only(bottom: 16),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(8),
//               border: Border.all(width: 1, color: AppColor.secondaryExtraSoft),
//             ),
//             child: TextField(
//               enabled: controller.isEditing.value,
//               style: TextStyle(
//                   fontSize: 14, fontFamily: 'poppins', color: Colors.black),
//               maxLines: 1,
//               controller: controller.tlpC,
//               keyboardType: TextInputType.phone,
//               decoration: InputDecoration(
//                 label: Text(
//                   "No Telepon",
//                   style: TextStyle(
//                     color: AppColor.secondarySoft,
//                     fontSize: 14,
//                   ),
//                 ),
//                 floatingLabelBehavior: FloatingLabelBehavior.always,
//                 border: InputBorder.none,
//                 hintText: "No Telepon",
//                 hintStyle: TextStyle(
//                   fontSize: 14,
//                   fontFamily: 'poppins',
//                   fontWeight: FontWeight.w500,
//                   color: AppColor.secondarySoft,
//                 ),
//               ),
//             ),
//           ),
//           Container(
//             width: MediaQuery.of(context).size.width,
//             padding: EdgeInsets.only(left: 14, right: 14, top: 4),
//             margin: EdgeInsets.only(bottom: 16),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(8),
//               border: Border.all(width: 1, color: AppColor.secondaryExtraSoft),
//             ),
//             child: TextField(
//               enabled: controller.isEditing.value,
//               style: TextStyle(
//                   fontSize: 14, fontFamily: 'poppins', color: Colors.black),
//               maxLines: 1,
//               controller: controller.emailC,
//               keyboardType: TextInputType.emailAddress,
//               decoration: InputDecoration(
//                 label: Text(
//                   "Email",
//                   style: TextStyle(
//                     color: AppColor.secondarySoft,
//                     fontSize: 14,
//                   ),
//                 ),
//                 floatingLabelBehavior: FloatingLabelBehavior.always,
//                 border: InputBorder.none,
//                 hintText: "Email",
//                 hintStyle: TextStyle(
//                   fontSize: 14,
//                   fontFamily: 'poppins',
//                   fontWeight: FontWeight.w500,
//                   color: AppColor.secondarySoft,
//                 ),
//               ),
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               ElevatedButton(
//                 onPressed: () {
//                   controller.tombolEdit();
//                 },
//                 child: Text(
//                   'Edit post',
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontFamily: 'poppins',
//                     color: Colors.white,
//                   ),
//                 ),
//                 style: ElevatedButton.styleFrom(
//                   fixedSize: Size(120, 55),
//                   backgroundColor: Color(0xff132137),
//                   padding: EdgeInsets.symmetric(vertical: 18),
//                   elevation: 0,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 width: 25,
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   controller.deletePost();
//                 },
//                 child: Text(
//                   'Delete post',
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontFamily: 'poppins',
//                     color: AppColor.primaryExtraSoft,
//                   ),
//                 ),
//                 style: ElevatedButton.styleFrom(
//                   fixedSize: Size(120, 55),
//                   backgroundColor: Color(0xff132137),
//                   padding: EdgeInsets.symmetric(vertical: 18),
//                   elevation: 0,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                 ),
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
