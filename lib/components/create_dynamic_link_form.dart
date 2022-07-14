//import 'package:demo_flutter_module/page/product_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

import '../page/product_page.dart';
import '../services/firebase_dynamic_link.dart';

class UserForm extends StatefulWidget {
  const UserForm({Key? key}) : super(key: key);

  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController campaignController = TextEditingController();
  final TextEditingController pageController = TextEditingController();

  String dataFromFlutter = "Not found";
  String msg = "Unknown";

  // static const MethodChannel _methodChannel =
  //     MethodChannel('FlutterModule/test2');

  // Future<void> getDataFromAndroid() async {
  //   String data;
  //   try {
  //     final String dynamicLink =
  //         await FirebaseDynamicLinkServices.createDynamicLink(
  //             true, 'women-page');

  //     print("Link is created : $dynamicLink");

  //     setState(() {
  //       msg = dynamicLink;
  //     });

  //     final String result =
  //         await _methodChannel.invokeMethod('test', <String, dynamic>{
  //       "campaign": campaignController.text,
  //       "page": pageController.text,
  //       "link": dynamicLink
  //     }); //sending data from flutter here

  //     data = result;
  //   } on PlatformException catch (e) {
  //     data = "Android is not responding please check the code";
  //   }

  //   setState(() {
  //     dataFromFlutter = data;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter Module")),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                "Campaign",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextFormField(
                controller: campaignController,
                decoration: const InputDecoration(
                  hintText: 'Enter your name',
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Page",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextFormField(
                controller: pageController,
                decoration: const InputDecoration(
                  hintText: 'Enter your password',
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              Column(
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      // print("Your campaign is $campaignController.text");
                      // print("Your campaign is $pageController.text");

                      //getDataFromAndroid();
                      print("Test Output");

                      String dynamicLink =
                          await FirebaseDynamicLinkServices.createDynamicLink(
                              true, 'women-page');

                      print("Link is created : $dynamicLink");

                      setState(() {
                        msg = dynamicLink;
                      });
                    },
                    child: const Text('Create Dynamic Link'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ProductPage(pageName: "Men Page")));
                    },
                    child: const Text('Go to Men Page'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ProductPage(pageName: "Women Page")));
                    },
                    child: const Text('Go to Women Page'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ProductPage(pageName: "Children Page")));
                    },
                    child: const Text('Go to Children Page'),
                  )
                ],
              ),
              Text(dataFromFlutter),
              Text(msg)
            ],
          ),
        ),
      ),
    );
  }
}
