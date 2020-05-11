import 'package:flutter/material.dart';
import 'types/device_info_dialog.dart';

class CustomAlertDialog {
  static Future<void> deviceInfo(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => DeviceInfoDialog(),
    );
  }
}
