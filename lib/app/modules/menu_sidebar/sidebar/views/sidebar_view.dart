import 'package:crud_flutter_api/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SidebarView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(child: ListView(children: [
        Divider(
          color: Colors.grey
        ),
        buildDrawerItem(
          text: "Hewan", 
          icon: Icons.agriculture,  
          onTap: () => navigate(0),
          tileColor: Get.currentRoute == Routes.HEWAN ? Colors.blue : null,
          textIconColor: Get.currentRoute == Routes.HEWAN ? Colors.white : Colors.black, 
        ),
        buildDrawerItem(
          text: "Peternak", 
          icon: Icons.agriculture,  
          onTap: () => navigate(1),
          tileColor: Get.currentRoute == Routes.PEMILIK ? Colors.blue : null,
          textIconColor: Get.currentRoute == Routes.PEMILIK ? Colors.white : Colors.black, 
        ),
        buildDrawerItem(
          text: "Petugas", 
          icon: Icons.agriculture,  
          onTap: () => navigate(2),
          tileColor: Get.currentRoute == Routes.PETUGAS ? Colors.blue : null,
          textIconColor: Get.currentRoute == Routes.PETUGAS ? Colors.white : Colors.black, 
        ),
        buildDrawerItem(
          text: "Vaksin", 
          icon: Icons.agriculture,  
          onTap: () => navigate(3),
          tileColor: Get.currentRoute == Routes.VAKSIN ? Colors.blue : null,
          textIconColor: Get.currentRoute == Routes.VAKSIN ? Colors.white : Colors.black, 
        ),
        buildDrawerItem(
          text: "Inseminasi", 
          icon: Icons.agriculture,  
          onTap: () => navigate(4),
          tileColor: Get.currentRoute == Routes.INSEMINASI ? Colors.blue : null,
          textIconColor: Get.currentRoute == Routes.INSEMINASI ? Colors.white : Colors.black, 
        ),
        buildDrawerItem(
          text: "Kelahiran", 
          icon: Icons.agriculture,  
          onTap: () => navigate(5),
          tileColor: Get.currentRoute == Routes.KELAHIRAN ? Colors.blue : null,
          textIconColor: Get.currentRoute == Routes.KELAHIRAN ? Colors.white : Colors.black, 
        ),buildDrawerItem(
          text: "Pengobatan", 
          icon: Icons.agriculture,  
          onTap: () => navigate(6),
          tileColor: Get.currentRoute == Routes.PENGOBATAN ? Colors.blue : null,
          textIconColor: Get.currentRoute == Routes.PENGOBATAN ? Colors.white : Colors.black, 
        ),buildDrawerItem(
          text: "PKB", 
          icon: Icons.agriculture,  
          onTap: () => navigate(7),
          tileColor: Get.currentRoute == Routes.PKB ? Colors.blue : null,
          textIconColor: Get.currentRoute == Routes.PKB ? Colors.white : Colors.black, 
        ),
      ],),),
    );
  }

  Widget buildDrawerItem({
    required String text,
    required IconData icon,
    required Color textIconColor,
    required Color? tileColor,
    required VoidCallback onTap,
  }){
    return ListTile(
      leading: Icon(icon, color: textIconColor),
      title: Text(
        text,
        style: TextStyle(color: textIconColor),
      ),
      tileColor: tileColor,
      onTap: onTap,
    );
  }

  navigate(int index) {
    if(index == 0){
      Get.toNamed(Routes.HEWAN);
    }
    else if(index == 1){
      Get.toNamed(Routes.PEMILIK);
    }
    else if(index == 2){
      Get.toNamed(Routes.PETUGAS);
    }
    else if(index == 3){
      Get.toNamed(Routes.VAKSIN);
    }
    else if(index == 4){
      Get.toNamed(Routes.INSEMINASI);
    }
    else if(index == 5){
      Get.toNamed(Routes.KELAHIRAN);
    }
    else if(index == 6){
      Get.toNamed(Routes.PENGOBATAN);
    }
    if(index == 7){
      Get.toNamed(Routes.PKB);
    }
  }
}
