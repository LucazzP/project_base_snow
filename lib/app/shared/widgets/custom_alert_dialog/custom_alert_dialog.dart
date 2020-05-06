import 'package:flutter/material.dart';
import 'package:project_sample_base/app/shared/widgets/custom_alert_dialog/types/device_info_dialog.dart';

class CustomAlertDialog {
  static Future<void> deviceInfo(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => DeviceInfoDialog(),
    );
  }
}
