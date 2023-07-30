import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import 'package:crud_flutter_api/app/widgets/message/auto_load.dart';
import 'package:crud_flutter_api/app/widgets/message/no_data.dart';
import 'package:crud_flutter_api/app/widgets/message/no_network.dart';
import 'package:crud_flutter_api/app/utils/app_color.dart';
import 'package:crud_flutter_api/app/routes/app_pages.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) => AutoLoad(
        onInit: () async {
          await controller.loadPost();
        },
        child: Scaffold(
          extendBody: true,
          body: controller.homeScreen == false
              ? ListView(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 36),
                  children: [
                    SizedBox(height: 16),
                    // Section 1 - Welcome Back
                    Container(
                      margin: EdgeInsets.only(bottom: 16),
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              ClipOval(
                                child: Container(
                                  width: 42,
                                  height: 42,
                                  child: Image.network(
                                    "https://ui-avatars.com/api/?name=${controller.box.read('name')}/",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(width: 24),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Selamat datang kembali",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: AppColor.secondarySoft,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    controller.box.read('name'),
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'poppins',
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          InkWell(
                            onTap: () => {controller.logout()},
                            child: Text("Logout"),
                          ),
                        ],
                      ),
                    ),
                    // section 2 - card
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.only(
                          left: 24, top: 24, right: 24, bottom: 16),
                      decoration: BoxDecoration(
                        color: AppColor.primary,
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          image: AssetImage('assets/images/pattern-1.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
// job
                          Text(
                            controller.box.read('email'),
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 16,
                            ),
                            decoration: BoxDecoration(
                              color: AppColor.primarySoft,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                GetBuilder<HomeController>(
                                  builder: (controller) => controller
                                              .posts!.status ==
                                          200
                                      ? Expanded(
                                          child: Column(
                                            children: [
                                              Container(
                                                margin:
                                                    EdgeInsets.only(bottom: 6),
                                                child: Text(
                                                  "Jumlah Todo",
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                "${controller.posts!.items!.length.toString()}",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      : Expanded(
                                          child: Column(
                                            children: [
                                              Container(
                                                margin:
                                                    EdgeInsets.only(bottom: 6),
                                                child: Text(
                                                  "Jumlah Todo",
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                "0",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "List Todo Terbaru",
                            style: TextStyle(
                              fontFamily: "poppins",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextButton(
                            onPressed: () => Get.toNamed(Routes.ALL_POST),
                            child: Text("tampilkan semua"),
                            style: TextButton.styleFrom(
                              primary: AppColor.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    GetBuilder<HomeController>(
                      builder: (controller) => controller.posts!.status == 200
                          ? ListView.separated(
                              itemCount: controller.posts!.items!.length,
                              shrinkWrap: true,
                              physics: BouncingScrollPhysics(),
                              separatorBuilder: (context, index) =>
                                  SizedBox(height: 16),
                              itemBuilder: (context, index) {
                                var postData = controller.posts!.items![index];
                                return InkWell(
                                  onTap: () => {
                                    Get.toNamed(
                                      Routes.DETAIL_POST,
                                      arguments: {
                                        "id": "${postData.id}",
                                        "title": "${postData.title}",
                                        "content": "${postData.content}",
                                      },
                                    ),
                                  },
                                  borderRadius: BorderRadius.circular(8),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        width: 1,
                                        color: AppColor.primaryExtraSoft,
                                      ),
                                    ),
                                    padding: EdgeInsets.only(
                                        left: 24,
                                        top: 20,
                                        right: 29,
                                        bottom: 20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              (postData.title == null)
                                                  ? "-"
                                                  : "${postData.title}",
                                              style: TextStyle(fontSize: 12),
                                            ),
                                            Text(
                                              "${postData.content}",
                                              style: TextStyle(fontSize: 12),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            )
                          : NoData(),
                    ),
                    SizedBox(height: 64),
                  ],
                )
              : NoNetwork(onInit: controller.loadPost()),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Get.toNamed(Routes.ADD_POST);
            },
            child: Icon(
              Icons.add,
            ),
          ),
        ),
      ),
    );
  }
}
