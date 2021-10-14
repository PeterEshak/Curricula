import 'dart:async';

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:device_info/device_info.dart';
import 'package:version/version.dart';

class DeviceInfoPage extends StatefulWidget {
  const DeviceInfoPage({Key? key}) : super(key: key);

  @override
  _DeviceInfoPageState createState() => _DeviceInfoPageState();
}

class _DeviceInfoPageState extends State<DeviceInfoPage> {
  static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  late Map<String, dynamic> _deviceData = <String, dynamic>{};
  final Version currentVersion = Version(1, 0, 3);
  final Version latestVersion = Version.parse('2.1.0');
  final Version betaVersion = Version(2, 1, 0, preRelease: <String>['beta']);
  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  late Map<String, dynamic> deviceData;
  Future<void> initPlatformState() async {
    try {
      if (Platform.isAndroid) {
        deviceData = _readAndroidBuildData(await deviceInfoPlugin.androidInfo);
      } else if (Platform.isIOS) {
        deviceData = _readIosDeviceInfo(await deviceInfoPlugin.iosInfo);
      }
    } on PlatformException {
      deviceData = <String, dynamic>{
        'Error:': 'Failed to get platform version.'
      };
    }

    if (!mounted) return;

    setState(() => _deviceData = deviceData);
  }

  Map<String, dynamic> _readAndroidBuildData(AndroidDeviceInfo build) =>
      <String, dynamic>{
        'version.securityPatch': build.version.securityPatch,
        'version.sdkInt': build.version.sdkInt,
        'version.release': build.version.release,
        'version.previewSdkInt': build.version.previewSdkInt,
        'version.incremental': build.version.incremental,
        'version.codename': build.version.codename,
        'version.baseOS': build.version.baseOS,
        'board': build.board,
        'bootloader': build.bootloader,
        'brand': build.brand,
        'device': build.device,
        'display': build.display,
        'fingerprint': build.fingerprint,
        'hardware': build.hardware,
        'host': build.host,
        'id': build.id,
        'manufacturer': build.manufacturer,
        'model': build.model,
        'product': build.product,
        'supported32BitAbis': build.supported32BitAbis,
        'supported64BitAbis': build.supported64BitAbis,
        'supportedAbis': build.supportedAbis,
        'tags': build.tags,
        'type': build.type,
        'isPhysicalDevice': build.isPhysicalDevice,
        'androidId': build.androidId,
        'systemFeatures': build.systemFeatures,
      };

  Map<String, dynamic> _readIosDeviceInfo(IosDeviceInfo data) =>
      <String, dynamic>{
        'name': data.name,
        'systemName': data.systemName,
        'systemVersion': data.systemVersion,
        'model': data.model,
        'localizedModel': data.localizedModel,
        'identifierForVendor': data.identifierForVendor,
        'isPhysicalDevice': data.isPhysicalDevice,
        'utsname.sysname:': data.utsname.sysname,
        'utsname.nodename:': data.utsname.nodename,
        'utsname.release:': data.utsname.release,
        'utsname.version:': data.utsname.version,
        'utsname.machine:': data.utsname.machine,
      };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Platform.isAndroid ? 'Android Device Info' : 'iOS Device Info',
        ),
      ),
      body: ListView(
        children: _deviceData.keys.map((String property) {
          return Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  property,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                  child: Text(
                    '${_deviceData[property]}',
                    maxLines: 10,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              Text(
                  latestVersion > currentVersion ? 'newUpdate' : 'lastVersion'),
              Text(
                  betaVersion > latestVersion ? 'beta newUpdate' : 'lastVersion of beta'),
            ],
          );
        }).toList(),
      ),
    );
  }
}
