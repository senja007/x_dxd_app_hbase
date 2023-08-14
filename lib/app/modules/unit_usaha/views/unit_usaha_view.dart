import 'package:crud_flutter_api/app/modules/sidebar/views/sidebar_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/unit_usaha_controller.dart';

class UnitUsahaView extends GetView<UnitUsahaController> {
  final UnitUsahaController _unitUsahaController =
      Get.put(UnitUsahaController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Petugas'),
        // Set the hamburger menu icon to open the sidebar
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
      ),
      body: _unitUsahaController.isLoading.value
          ? const Center(child: CircularProgressIndicator())
          : (_unitUsahaController.unitUsahaHydraList.value.length > 0
              ? ListView.builder(
                  itemCount:
                      _unitUsahaController.unitUsahaHydraList.value.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    var object =
                        _unitUsahaController.unitUsahaHydraList.value[index];

                    return ExpansionTile(
                      title: Text(
                        object.subject!,
                      ),
                      leading: const Icon(Icons.label_important_outline),
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: Text(
                            'from ${object.from!.address!.trim()}',
                            style: const TextStyle(
                                fontSize: 13, color: Colors.white70),
                            textAlign: TextAlign.start,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: Text(
                            object.createdAt!,
                            style: const TextStyle(
                                fontSize: 13, color: Colors.white70),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: Text(
                            object.intro!,
                            style: const TextStyle(fontSize: 13),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    );
                  },
                )
              : const Center(
                  child: Text(
                  "You have no messages",
                  style: TextStyle(fontSize: 15),
                ))),
    );
  }
}
