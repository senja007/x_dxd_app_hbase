import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../controllers/user_controller.dart';

class UserView extends StatelessWidget {
  static String routeName = "/profile";
  @override
  Widget build(BuildContext context) {
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
        body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const SizedBox(height: 40),
                CircleAvatar(
                  radius: 70,
                  backgroundImage: AssetImage('assets/images/profile.jpg'),
                ),
                const SizedBox(height: 20),
                itemProfile('Name', 'Ahad Hashmi', CupertinoIcons.person),
                const SizedBox(height: 10),
                itemProfile('Phone', '03107085816', CupertinoIcons.phone),
                const SizedBox(height: 10),
                itemProfile('Address', 'abc address, xyz city',
                    CupertinoIcons.location),
                const SizedBox(height: 10),
                itemProfile('Email', 'ahadhashmideveloper@gmail.com',
                    CupertinoIcons.mail),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(15),
                      ),
                      child: const Text('Edit Profile')),
                )
              ],
            )),
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
                color: Colors.deepOrange.withOpacity(.2),
                spreadRadius: 2,
                blurRadius: 10)
          ]),
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
