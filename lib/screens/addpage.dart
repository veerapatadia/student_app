import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:studentapp/global.dart';
import 'package:studentapp/model/student.dart';

class adddatapage extends StatefulWidget {
  const adddatapage({super.key});

  @override
  State<adddatapage> createState() => _adddatapageState();
}

class _adddatapageState extends State<adddatapage> {
  ImagePicker imagePicker = ImagePicker();
  XFile? xFile;
  String? pickImagePath;
  GlobalKey<FormState> addKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController gridController = TextEditingController();
  TextEditingController stdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Data Page"),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: 100, left: 20, right: 20, top: 20),
                    child: Column(
                      children: [
                        Container(
                          color: Colors.grey.shade200,
                          padding:
                              EdgeInsets.only(left: 25, right: 25, top: 20),
                          height: MediaQuery.of(context).size.height / 1.15,
                          child: Column(
                            children: [
                              Container(
                                height: 270,
                                width: 340,
                                color: Colors.white,
                                alignment: Alignment.center,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
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
                                                      "Choose Image",
                                                    ),
                                                    actions: [
                                                      FloatingActionButton(
                                                        mini: true,
                                                        onPressed: () async {
                                                          xFile =
                                                              await imagePicker
                                                                  .pickImage(
                                                            source: ImageSource
                                                                .camera,
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
                                                          xFile =
                                                              await imagePicker
                                                                  .pickImage(
                                                            source: ImageSource
                                                                .gallery,
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
                                            backgroundColor: Colors
                                                .blue.shade900
                                                .withOpacity(0.5),
                                            backgroundImage:
                                                (pickImagePath != null)
                                                    ? FileImage(
                                                        File(pickImagePath!))
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
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        OutlinedButton(
                                          onPressed: () {},
                                          style: OutlinedButton.styleFrom(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 50, vertical: 14),
                                            foregroundColor:
                                                Colors.blue.shade900,
                                          ),
                                          child: Text("Clear"),
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            if (pickImagePath != null) {
                                              Global.profileImageFile =
                                                  File(pickImagePath!);
                                            }
                                          },
                                          style: OutlinedButton.styleFrom(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 50, vertical: 14),
                                            foregroundColor: Colors.white,
                                            backgroundColor:
                                                Colors.blue.shade900,
                                          ),
                                          child: Text("Save"),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Form(
                                key: addKey,
                                child: Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(bottom: 10),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                "Name",
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: TextFormField(
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
                                                  decoration: InputDecoration(
                                                    border:
                                                        OutlineInputBorder(),
                                                    hintText: "Name",
                                                    hintStyle: TextStyle(
                                                      fontSize: 18,
                                                      color:
                                                          Colors.grey.shade400,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(bottom: 10),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                "GRID",
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: TextFormField(
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
                                                  decoration: InputDecoration(
                                                    border:
                                                        OutlineInputBorder(),
                                                    hintText: "GRID",
                                                    hintStyle: TextStyle(
                                                      fontSize: 18,
                                                      color:
                                                          Colors.grey.shade400,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(bottom: 10),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                "Std",
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: TextFormField(
                                                  validator: (val) {
                                                    if (val!.isEmpty) {
                                                      return "Enter Std";
                                                    }
                                                    return null;
                                                  },
                                                  onSaved: (val) {
                                                    Global.name = val ?? "";
                                                  },
                                                  controller: stdController,
                                                  decoration: InputDecoration(
                                                    border:
                                                        OutlineInputBorder(),
                                                    hintText: "Std",
                                                    hintStyle: TextStyle(
                                                      fontSize: 18,
                                                      color:
                                                          Colors.grey.shade400,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          ElevatedButton(
                                            onPressed: () {
                                              if (addKey.currentState!
                                                  .validate()) {
                                                addKey.currentState!.save();

                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    behavior: SnackBarBehavior
                                                        .floating,
                                                    backgroundColor:
                                                        Colors.green.shade500,
                                                    action: SnackBarAction(
                                                      label: "Next",
                                                      onPressed: () {
                                                        setState(() {
                                                          Navigator.of(context)
                                                              .pushNamedAndRemoveUntil(
                                                                  "/",
                                                                  (route) =>
                                                                      false);
                                                        });
                                                      },
                                                      textColor: Colors.white,
                                                    ),
                                                    content: Text(
                                                      "Student Data Saved SuccessFully!!!",
                                                    ),
                                                  ),
                                                );

                                                nameController.clear();
                                                gridController.clear();
                                                stdController.clear();

                                                Student student = Student(
                                                  name: Global.name,
                                                  grid: Global.grid,
                                                  std: Global.std,
                                                  profileImageFile:
                                                      Global.profileImageFile,
                                                );
                                                Global.allStudent.add(student);
                                              }
                                            },
                                            style: OutlinedButton.styleFrom(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 40, vertical: 15),
                                              foregroundColor: Colors.white,
                                              backgroundColor: Colors.blue,
                                            ),
                                            child: Text(
                                              "Save",
                                              style: TextStyle(fontSize: 17),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
