import 'package:flutter/material.dart';
import 'package:bot_toast/bot_toast.dart';

class LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      width: 180,
      height: 100,
      padding: EdgeInsets.all(0),
      child: Image.asset('assets/gif/Loading2.gif'),
    );
  }
}

showLoading() {
  BotToast.showCustomLoading(toastBuilder: (close) {
    return LoadingWidget();
  });
}

stopLoading() {
  BotToast.closeAllLoading();
}
