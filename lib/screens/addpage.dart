import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:studentapp/global.dart';

import '../model/student.dart';

class adddatapage extends StatefulWidget {
  const adddatapage({super.key});

  @override
  State<adddatapage> createState() => _adddatapageState();
}

class _adddatapageState extends State<adddatapage> {
  ImagePicker imagePicker = ImagePicker();
  XFile? xFile;
  String? pickImagePath;
  bool isContact = true;

  GlobalKey<FormState> addKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController gridController = TextEditingController();
  TextEditingController stdController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Data Page",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Color(0xff1B3C73),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey.shade300,
      body: Center(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 20, left: 20, bottom: 50),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(
                              top: 20, left: 25, right: 25),
                          height: MediaQuery.of(context).size.height / 1.3,
                          color: Colors.white,
                          child: Form(
                            key: addKey,
                            child: Column(
                              children: [
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                title: Text(
                                                  "Pick Image",
                                                ),
                                                content: Text(
                                                  "Choose Image From Gallery or Camera",
                                                ),
                                                actions: [
                                                  FloatingActionButton(
                                                    mini: true,
                                                    onPressed: () async {
                                                      xFile = await imagePicker
                                                          .pickImage(
                                                        source:
                                                            ImageSource.camera,
                                                      );
                                                      setState(() {
                                                        if (xFile != null) {
                                                          pickImagePath =
                                                              xFile!.path;
                                                        }
                                                      });

                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    elevation: 3,
                                                    child: Icon(
                                                      Icons.camera_alt,
                                                    ),
                                                  ),
                                                  FloatingActionButton(
                                                    mini: true,
                                                    onPressed: () async {
                                                      xFile = await imagePicker
                                                          .pickImage(
                                                        source:
                                                            ImageSource.gallery,
                                                      );
                                                      setState(() {
                                                        if (xFile != null) {
                                                          pickImagePath =
                                                              xFile!.path;
                                                        }
                                                      });

                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    elevation: 3,
                                                    child: Icon(
                                                      Icons.image,
                                                    ),
                                                  ),
                                                ],
                                              );
                                            });
                                      },
                                      child: CircleAvatar(
                                        radius: 70,
                                        backgroundColor: Colors.blue.shade900
                                            .withOpacity(0.7),
                                        backgroundImage: (pickImagePath != null)
                                            ? FileImage(File(pickImagePath!))
                                            : null,
                                        child: (pickImagePath != null)
                                            ? Container()
                                            : Icon(
                                                Icons.add,
                                                color: Colors.white,
                                                size: 30,
                                              ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 15),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          ElevatedButton(
                                            onPressed: () {
                                              if (pickImagePath != null) {
                                                Global.profileImageFile =
                                                    File(pickImagePath!);
                                              }
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  behavior:
                                                      SnackBarBehavior.floating,
                                                  backgroundColor:
                                                      Colors.green.shade500,
                                                  action: SnackBarAction(
                                                    label: "",
                                                    onPressed: () {},
                                                    textColor: Colors.white,
                                                  ),
                                                  content: Text(
                                                    "Profile Image Saved SuccessFully!!!",
                                                  ),
                                                ),
                                              );
                                              Student student = Student(
                                                grid: Global.grid,
                                                std: Global.std,
                                                name: Global.name,
                                                profileImageFile:
                                                    Global.profileImageFile,
                                              );
                                              Global.allStudent.add(student);
                                            },
                                            style: OutlinedButton.styleFrom(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 50, vertical: 14),
                                              foregroundColor: Colors.white,
                                              backgroundColor:
                                                  Color(0xff1B3C73),
                                            ),
                                            child: Text(
                                              "Save",
                                              style: TextStyle(fontSize: 17),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  margin: const EdgeInsets.only(
                                      bottom: 23, top: 20),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          child: TextFormField(
                                        keyboardType: TextInputType.number,
                                        validator: (val) {
                                          if (val!.isEmpty) {
                                            return "Enter GRID";
                                          }
                                          return null;
                                        },
                                        onSaved: (val) {
                                          Global.grid = val ?? "";
                                        },
                                        controller: gridController,
                                        decoration: const InputDecoration(
                                          label: Text("GRID"),
                                          border: OutlineInputBorder(),
                                          hintText: "GRID",
                                        ),
                                      )),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  margin: const EdgeInsets.only(bottom: 23),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: TextFormField(
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          validator: (val) {
                                            if (val!.isEmpty) {
                                              return "Enter Name";
                                            }
                                            return null;
                                          },
                                          onSaved: (val) {
                                            Global.name = val ?? "";
                                          },
                                          controller: nameController,
                                          decoration: const InputDecoration(
                                            label: Text("Name"),
                                            border: OutlineInputBorder(),
                                            hintText: "Name",
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  margin: EdgeInsets.only(bottom: 23),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          child: TextFormField(
                                        keyboardType: TextInputType.number,
                                        validator: (val) {
                                          if (val!.isEmpty) {
                                            return "Enter Standard";
                                          }
                                          return null;
                                        },
                                        onSaved: (val) {
                                          Global.std = val ?? "";
                                        },
                                        controller: stdController,
                                        decoration: InputDecoration(
                                          label: Text("Standard"),
                                          border: OutlineInputBorder(),
                                          hintText: "Standard",
                                        ),
                                      )),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    OutlinedButton(
                                      onPressed: () {
                                        if (addKey.currentState!.validate()) {
                                          addKey.currentState!.reset();

                                          gridController.clear();
                                          nameController.clear();
                                          stdController.clear();
                                        }
                                      },
                                      style: OutlinedButton.styleFrom(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 50, vertical: 14),
                                        foregroundColor: Color(0xff1B3C73),
                                      ),
                                      child: Text(
                                        "Clear",
                                        style: TextStyle(fontSize: 17),
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        if (addKey.currentState!.validate()) {
                                          addKey.currentState!.save();

                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              behavior:
                                                  SnackBarBehavior.floating,
                                              backgroundColor:
                                                  Colors.green.shade500,
                                              action: SnackBarAction(
                                                  label: "Next",
                                                  onPressed: () {
                                                    setState(() {
                                                      Navigator.of(context)
                                                          .pushNamedAndRemoveUntil(
                                                              "/",
                                                              (route) => false);
                                                    });
                                                  },
                                                  textColor: Colors.white),
                                              content: Text(
                                                "Student Data Saved SuccessFully!!!",
                                              ),
                                            ),
                                          );

                                          gridController.clear();
                                          nameController.clear();
                                          stdController.clear();
                                        }
                                        Student student = Student(
                                          grid: Global.grid,
                                          std: Global.std,
                                          name: Global.name,
                                          profileImageFile:
                                              Global.profileImageFile,
                                        );
                                        Global.allStudent.add(student);
                                      },
                                      style: OutlinedButton.styleFrom(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 50, vertical: 14),
                                        foregroundColor: Colors.white,
                                        backgroundColor: Color(0xff1B3C73),
                                      ),
                                      child: Text(
                                        "Save",
                                        style: TextStyle(fontSize: 17),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
