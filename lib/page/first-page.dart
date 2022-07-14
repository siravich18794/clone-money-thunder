import 'package:clone_money_thunder/page/second-page.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController firstNameTHController = TextEditingController();
  final TextEditingController lastNameTHController = TextEditingController();
  final TextEditingController firstNameENGController = TextEditingController();
  final TextEditingController lastNameENGController = TextEditingController();

  // This function is triggered when the "Save" button is pressed
  void _saveForm() {
    final bool isValid = _formKey.currentState!.validate();
    if (isValid) {
      print('Got a valid input');
      // And do something here
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Money Lightning'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Text(
                    'คำนำหน้า',
                    style: TextStyle(fontFamily: 'Mitr'),
                  ),
                  alignment: Alignment.topLeft,
                ),
                const SizedBox(
                  height: 10,
                ),
                PhysicalModel(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  elevation: 2.0,
                  shadowColor: Colors.black,
                  child: TextFormField(
                    controller: titleController,
                    validator: (value) {
                      if (value != null && value.trim().length < 3) {
                        return 'This field requires a minimum of 3 characters';
                      }

                      return null;
                    },
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        errorBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.red, width: 5))),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  child: Text(
                    'ชื่อจริงภาษาไทย (ไม่ต้องใส่คำนำหน้า)',
                    style: TextStyle(fontFamily: 'Mitr'),
                  ),
                  alignment: Alignment.topLeft,
                ),
                const SizedBox(
                  height: 10,
                ),
                PhysicalModel(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  elevation: 2.0,
                  shadowColor: Colors.black,
                  child: TextFormField(
                    controller: firstNameTHController,
                    validator: (value) {
                      if (value != null && value.trim().length < 3) {
                        return 'This field requires a minimum of 3 characters';
                      }

                      return null;
                    },
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        errorBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.red, width: 5))),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  child: Text(
                    'นามสกุลภาษาไทย',
                    style: TextStyle(fontFamily: 'Mitr'),
                  ),
                  alignment: Alignment.topLeft,
                ),
                const SizedBox(
                  height: 10,
                ),
                PhysicalModel(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  elevation: 2.0,
                  shadowColor: Colors.black,
                  child: TextFormField(
                    controller: lastNameTHController,
                    validator: (value) {
                      if (value != null && value.trim().length < 3) {
                        return 'This field requires a minimum of 3 characters';
                      }

                      return null;
                    },
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        errorBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.red, width: 5))),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  child: Text(
                    'ชื่อจริงภาษาอังกฤษ',
                    style: TextStyle(fontFamily: 'Mitr'),
                  ),
                  alignment: Alignment.topLeft,
                ),
                const SizedBox(
                  height: 10,
                ),
                PhysicalModel(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  elevation: 2.0,
                  shadowColor: Colors.black,
                  child: TextFormField(
                    controller: firstNameENGController,
                    validator: (value) {
                      if (value != null && value.trim().length < 3) {
                        return 'This field requires a minimum of 3 characters';
                      }

                      return null;
                    },
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        errorBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.red, width: 5))),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  child: Text(
                    'นามสกุลภาษาอังกฤษ',
                    style: TextStyle(fontFamily: 'Mitr'),
                  ),
                  alignment: Alignment.topLeft,
                ),
                const SizedBox(
                  height: 10,
                ),
                PhysicalModel(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  elevation: 2.0,
                  shadowColor: Colors.black,
                  child: TextFormField(
                    controller: lastNameENGController,
                    validator: (value) {
                      if (value != null && value.trim().length < 3) {
                        return 'This field requires a minimum of 3 characters';
                      }

                      return null;
                    },
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        errorBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.red, width: 5))),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton.icon(
                    onPressed: () {
                      _saveForm;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SecondPage(
                                  title: titleController.text,
                                  firstNameTH: firstNameTHController.text,
                                  lastNameTH: lastNameTHController.text,
                                  firstNameENG: firstNameENGController.text,
                                  lastNameENG: lastNameENGController.text,
                                )),
                      );
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Color.fromARGB(255, 255, 243, 137)),
                        shape:
                            MaterialStateProperty.resolveWith<OutlinedBorder>(
                                (_) {
                          return RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10));
                        })),
                    icon: const Icon(
                      Icons.arrow_forward,
                      color: Colors.black,
                    ),
                    label: const Text(
                      'ไปต่อ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
