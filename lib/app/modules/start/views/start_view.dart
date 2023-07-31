import 'package:flutter/material.dart';
import 'package:crud_flutter_api/app/widgets/message/no_network.dart';
import 'package:crud_flutter_api/app/widgets/message/auto_load.dart';
import 'package:crud_flutter_api/app/utils/app_color.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/start_controller.dart';

class StartView extends GetView<StartController> {
  const StartView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<StartController>(
      builder: (controller) => AutoLoad(
        onInit: () async {
          await new Future.delayed(const Duration(seconds: 3));
          await controller.autoLogin();
        },
        child: Scaffold(
          body: GetBuilder<StartController>(
            builder: (controller) => controller.startScreen == false
                ? Container(
                    color: AppColor.primary,
                    width: double.infinity,
                    height: double.infinity,
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Spacer(),
                        Icon(Icons.account_tree_outlined,
                            size: 48, color: Colors.white),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Post app",
                          style: GoogleFonts.archivo(
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                              color: Color(0xffffca54)),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                            margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                            child: Column(
                              children: [
                                Text(
                                  "Belajar Bersama",
                                  style: GoogleFonts.cairo(
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  "Building the Nation Through Education",
                                  style: GoogleFonts.cairo(
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            )),
                        Spacer(),
                        Text(
                          "Hummasoft. V1",
                          style: GoogleFonts.cairo(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  )
                : NoNetwork(
                    onInit: controller.autoLogin,
                  ),
          ),
        ),
      ),
    );
  }
}
