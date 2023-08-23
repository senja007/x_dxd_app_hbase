import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/petugas_controller.dart';

class PetugasView extends StatelessWidget {
  final PetugasController controller = Get.put(PetugasController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('GetX ListView Example')),
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
