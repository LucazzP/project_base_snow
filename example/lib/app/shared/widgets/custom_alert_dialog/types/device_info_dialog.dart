import 'package:flutter/material.dart';


class DeviceInfoDialog extends StatelessWidget {
  DeviceInfoDialog();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Title',
        style: TextStyle(color: Colors.white),
      ),
      content: Text("Test"),
    );
  }
}
