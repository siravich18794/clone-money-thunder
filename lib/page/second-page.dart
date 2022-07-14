import 'dart:io';

import 'package:clone_money_thunder/components/create_dynamic_link_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SecondPage extends StatefulWidget {
  const SecondPage(
      {Key? key,
      required this.title,
      required this.firstNameTH,
      required this.lastNameTH,
      required this.firstNameENG,
      required this.lastNameENG})
      : super(key: key);

  final String title;
  final String firstNameTH;
  final String lastNameTH;
  final String firstNameENG;
  final String lastNameENG;

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  String checkCamera = "Inactive";
  bool checkMap = false;
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(13.736717, 100.523186);
  String dataFromFlutter = "Empty";

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  static const MethodChannel _methodChannel =
      MethodChannel('FlutterModule/test');

  Future<void> getDataFromNative() async {
    String data;
    try {
      final String result =
          await _methodChannel.invokeMethod('test', <String, dynamic>{
        "title": widget.title,
        "firstNameTH": widget.firstNameTH,
        "lastNameTH": widget.lastNameTH,
        "firstNameENG": widget.firstNameENG,
        "lastNameENG": widget.lastNameENG,
      }); //sending data from flutter here

      data = result;
    } on PlatformException catch (e) {
      data = "Android is not responding please check the code";
    }

    setState(() {
      dataFromFlutter = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Permission Test"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () async {
                          PermissionStatus cameraStatus =
                              await Permission.camera.request();

                          if (cameraStatus == PermissionStatus.granted) {
                            print("Camera is allowed");
                            setState(() {
                              checkCamera = "Active";
                            });
                          } else if (cameraStatus == PermissionStatus.denied) {
                            print("Camera is denied");
                            setState(() {
                              checkCamera = "Inactive";
                            });
                          } else if (cameraStatus ==
                              PermissionStatus.permanentlyDenied) {
                            openAppSettings();
                            print("Permanently denied");
                            setState(() {
                              checkCamera = "Inactive";
                            });
                          }
                        },
                        child: Text("Test Camera")),
                    Container(
                      child: Text("Camera : $checkCamera"),
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          //await Permission.location.request();
                          await Permission.locationWhenInUse.request();
                          await Permission.location.request();

                          if (await Permission.location.isGranted) {
                            print("Location is allowed");
                            setState(() {
                              checkMap = true;
                            });
                          } else {
                            print("Location is denied");
                            openAppSettings();
                          }
                        },
                        child: Text("Test Location")),
                    ElevatedButton(
                        onPressed: () async {
                          openAppSettings();
                        },
                        child: Text("Open the setting")),
                    ElevatedButton(
                        onPressed: () async {
                          await getDataFromNative();
                          SystemNavigator.pop();
                        },
                        child: Text("Submit")),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UserForm()));
                        },
                        child: Text("Go to Create Dynamic Link Page")),
                    Text(dataFromFlutter)
                  ]),
            ),
          ),
          Visibility(
            visible: checkMap,
            child: Expanded(
              child: Container(
                padding: EdgeInsets.all(10),
                child: GoogleMap(
                  onMapCreated: _onMapCreated,
                  initialCameraPosition: CameraPosition(
                    target: _center,
                    zoom: 11.0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Container(
//         alignment: Alignment.center,
//         child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
//           ElevatedButton(
//               onPressed: () async {
//                 PermissionStatus cameraStatus =
//                     await Permission.camera.request();

//                 if (cameraStatus == PermissionStatus.granted) {
//                   print("Camera is allowed");
//                   setState(() {
//                     checkCamera = "Active";
//                   });
//                 } else if (cameraStatus == PermissionStatus.denied) {
//                   print("Camera is denied");
//                   setState(() {
//                     checkCamera = "Inactive";
//                   });
//                 } else if (cameraStatus == PermissionStatus.permanentlyDenied) {
//                   openAppSettings();
//                   print("Permanently denied");
//                   setState(() {
//                     checkCamera = "Inactive";
//                   });
//                 }
//               },
//               child: Text("Test Camera : $checkCamera")),
//           ElevatedButton(
//               onPressed: () async {
//                 //await Permission.location.request();
//                 await Permission.locationWhenInUse.request();

//                 if (await Permission.location.isGranted) {
//                   print("Location is allowed");
//                 } else if (await Permission.location.isDenied) {
//                   print("Location is denied");
//                   openAppSettings();
//                 }
//               },
//               child: Text("Test Location")),
//           ElevatedButton(
//               onPressed: () async {
//                 openAppSettings();
//               },
//               child: Text("Open the setting"))
//         ]),
//       ),
