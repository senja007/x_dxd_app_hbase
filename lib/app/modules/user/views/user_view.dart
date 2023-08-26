import 'package:crud_flutter_api/app/data/user_model.dart';
import 'package:crud_flutter_api/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../controllers/user_controller.dart';

class UserView extends StatelessWidget {
  static String routeName = "/profile";

  @override
  Widget build(BuildContext context) {
    UserController userController = Get.find<UserController>();
    return GetBuilder<UserController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            'My Profile',
            style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
            textAlign: TextAlign.center,
          ),
          automaticallyImplyLeading: false,
          backgroundColor: Color.fromARGB(255, 19, 33, 55),
          elevation: 0.0,
        ),
        body: Container(
          color: Color(0xffF7EBE1), // Background color for the body
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const SizedBox(height: 40),
                CircleAvatar(
                  radius: 70,
                  backgroundImage: NetworkImage(""),
                ),
                const SizedBox(height: 20),
                itemProfile(
                    'Username',
                    '${userController.box.read('username')}',
                    CupertinoIcons.person),
                const SizedBox(height: 10),
                itemProfile('Name', '${userController.box.read('name')}',
                    CupertinoIcons.person_3_fill),
                const SizedBox(height: 10),
                itemProfile('Role', '${userController.box.read('role')}',
                    CupertinoIcons.person_2_square_stack_fill),
                const SizedBox(height: 10),
                itemProfile('Email', '${userController.box.read('email')}',
                    CupertinoIcons.mail),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      controller.box.remove('token');
                      Get.offAllNamed(Routes.LOGIN);
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(15),
                    ),
                    child: const Text('LOG OUT'),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }

  itemProfile(String title, String subtitle, IconData iconData) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 5),
            color: Color.fromARGB(255, 0, 47, 255).withOpacity(.2),
            spreadRadius: 2,
            blurRadius: 10,
          )
        ],
      ),
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        leading: Icon(iconData),
        trailing: Icon(Icons.arrow_forward, color: Colors.grey.shade400),
        tileColor: Colors.white,
      ),
    );
  }
}
