import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/pemilik_controller.dart';

class PemilikView extends GetView<PemilikController> {
  final PemilikController controller = Get.put(PemilikController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GetX ListView Example'),
        // Set the hamburger menu icon to open the sidebar
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              return ListView.builder(
                itemCount: controller.items.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(controller.items[index]),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        controller.removeItem(index);
                      },
                    ),
                  );
                },
              );
            }),
          ),
          ElevatedButton(
            onPressed: () {
              String newItem = DateTime.now().toString();
              controller.addItem(newItem);
            },
            child: Text('Add Item'),
          ),
        ],
      ),
    );
  }
}
