// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// class UserForm extends StatefulWidget {
//   const UserForm({Key? key}) : super(key: key);

//   @override
//   State<UserForm> createState() => _UserFormState();
// }

// class _UserFormState extends State<UserForm> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//   final TextEditingController firstController = TextEditingController();
//   final TextEditingController lastController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController telController = TextEditingController();

//   String dataFromFlutter = "Not found";

//   static const MethodChannel _methodChannel =
//       MethodChannel('FlutterModule/test');

//   Future<void> sendDataToAndroid() async {
//     String data;
//     try {
//       final String result =
//           await _methodChannel.invokeMethod('test', <String, dynamic>{
//         "firstName": firstController.text,
//         "lastName": lastController.text,
//         "email": emailController.text,
//         "tel": telController.text
//       }); //sending data from flutter here
//       data = result;
//     } on PlatformException catch (e) {
//       data = "[Error] Android is not responding";
//     }

//     setState(() {
//       dataFromFlutter = data;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Flutter Module")),
//       body: Container(
//         padding: const EdgeInsets.all(20),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: <Widget>[
//               const Text(
//                 "Firstname",
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               TextFormField(
//                 controller: firstController,
//                 decoration: const InputDecoration(
//                   hintText: 'Enter your name',
//                 ),
//                 validator: (String? value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter some text';
//                   }
//                   return null;
//                 },
//               ),
//               const Text(
//                 "Lastname",
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               TextFormField(
//                 controller: lastController,
//                 decoration: const InputDecoration(
//                   hintText: 'Enter your password',
//                 ),
//                 validator: (String? value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter some text';
//                   }
//                   return null;
//                 },
//               ),
//               const Text(
//                 "Email",
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               TextFormField(
//                 controller: emailController,
//                 decoration: const InputDecoration(
//                   hintText: 'Enter your email',
//                 ),
//                 validator: (String? value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter some text';
//                   }
//                   return null;
//                 },
//               ),
//               const Text(
//                 "Tel.",
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               TextFormField(
//                 controller: telController,
//                 decoration: const InputDecoration(
//                   hintText: 'Enter your phone number',
//                 ),
//                 validator: (String? value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter some text';
//                   }
//                   return null;
//                 },
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 16.0),
//                 child: ElevatedButton(
//                   onPressed: () {
//                     // Validate will return true if the form is valid, or false if
//                     // the form is invalid.
//                     print("Click submit button");

//                     if (_formKey.currentState!.validate()) {
//                       // Process data.
//                       print(firstController.text);
//                       print(lastController.text);
//                       print(emailController.text);
//                       print(telController.text);

//                       sendDataToAndroid();
//                     }
//                   },
//                   child: const Text('Submit'),
//                 ),
//               ),
//               Text(dataFromFlutter)
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
