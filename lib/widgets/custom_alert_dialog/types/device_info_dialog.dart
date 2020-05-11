import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:projectbasesnow/config/device_utils.dart';
import 'package:projectbasesnow/extensions.dart';

import '../../../config/flavor_config.dart';

class DeviceInfoDialog extends StatelessWidget {
  DeviceInfoDialog();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.only(bottom: 10.0),
      title: Container(
        padding: EdgeInsets.all(15.0),
        color: FlavorConfig.color,
        child: Text(
          'Device Info',
          style: TextStyle(color: Colors.white),
        ),
      ),
      titlePadding: EdgeInsets.all(0),
      content: _getContent(),
    );
  }

  Widget _getContent() {
    if (Platform.isAndroid) {
      return _androidContent();
    }
    if (Platform.isIOS) {
      return _iOSContent();
    }
    return Text("You're not on Android neither iOS");
  }

  Widget _iOSContent() {
    return FutureBuilder<IosDeviceInfo>(
      future: DeviceUtils.iosDeviceInfo,
      builder: (context, snapshot) {
        if (!snapshot.hasData) return Container();

        final device = snapshot.data;
        return SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _buildTile('Flavor: ', FlavorConfig.name),
              _buildTile(
                'Build mode: ',
                DeviceUtils.currentBuildMode().toString().getNameFromEnum(),
              ),
              _buildTile(
                'Physical device?: ',
                device.isPhysicalDevice.toString(),
              ),
              _buildTile('Device: ', device.name),
              _buildTile('Model: ', device.model),
              _buildTile('System name: ', device.systemName),
              _buildTile('System version: ', device.systemVersion)
            ],
          ),
        );
      },
    );
  }

  Widget _androidContent() {
    return FutureBuilder<AndroidDeviceInfo>(
      future: DeviceUtils.androidDeviceInfo,
      builder: (context, snapshot) {
        if (!snapshot.hasData) return Container();
        final device = snapshot.data;
        return SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _buildTile('Flavor: ', FlavorConfig.name),
              _buildTile(
                'Build mode: ',
                DeviceUtils.currentBuildMode().toString().getNameFromEnum(),
              ),
              _buildTile(
                'Physical device?: ',
                device.isPhysicalDevice.toString(),
              ),
              _buildTile('Manufacturer: ', device.manufacturer),
              _buildTile('Model: ', device.model),
              _buildTile('Android version: ', device.version.release),
              _buildTile('Android SDK: ', device.version.sdkInt.toString())
            ],
          ),
        );
      },
    );
  }

  Widget _buildTile(String key, String value) {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: Row(
        children: <Widget>[
          Text(
            key,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(value)
        ],
      ),
    );
  }
}
