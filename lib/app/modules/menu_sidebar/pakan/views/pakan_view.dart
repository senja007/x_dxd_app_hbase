import 'package:flutter/material.dart';

class PakanView extends StatelessWidget {
  const PakanView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pakan'),
        // Set the hamburger menu icon to open the sidebar
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
      ),
      body: Center(
        child: Text(
          'Pakan Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
