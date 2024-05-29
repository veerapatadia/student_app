import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:studentapp/global.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  bool isClicked = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Student App",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Color(0xff1B3C73),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 4,
              child: Container(
                child: Padding(
                  padding: EdgeInsets.only(top: 15, left: 15, right: 15),
                  child: Row(
                    children: [
                      Container(
                        height: 280,
                        width: 380,
                        decoration: BoxDecoration(
                          //color: Colors.red,
                          image: DecorationImage(
                            image: NetworkImage(
                              "https://i.pinimg.com/564x/e6/d6/06/e6d6067a14f7ebe72d20ec3f0c3d79b7.jpg",
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 8,
              child: Container(
                // color: Colors.red,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      (Global.allStudent.isEmpty)
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 60),
                                  child: Text(
                                    "No Data Added",
                                    style: TextStyle(
                                      fontSize: 19,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : Column(
                              children: Global.allStudent.map((e) {
                                return GestureDetector(
                                  onTap: () {
                                    Global.selectedStudent = e;
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(top: 5),
                                    child: Stack(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10, left: 5, right: 7),
                                          child: Container(
                                            height: 100,
                                            width: 385,
                                            decoration: BoxDecoration(
                                              // color: Colors.red,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              gradient: LinearGradient(
                                                begin: Alignment.centerRight,
                                                end: Alignment.centerLeft,
                                                colors: [
                                                  Color(0xff1B3C73)
                                                      .withOpacity(0.18),
                                                  Color(0xff1B3C73),
                                                ],
                                              ),
                                            ),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    // color: Colors.red,
                                                    child: CircleAvatar(
                                                      radius: 60,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 2,
                                                  child: Container(
                                                    //color: Colors.amber,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              10),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Text(
                                                                e.name,
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        18,
                                                                    color: Colors
                                                                        .white,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                              ),
                                                            ],
                                                          ),
                                                          Row(
                                                            children: [
                                                              Text(
                                                                e.grid,
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        18,
                                                                    color: Colors
                                                                        .white,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                              ),
                                                            ],
                                                          ),
                                                          Row(
                                                            children: [
                                                              Text(
                                                                e.std,
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        18,
                                                                    color: Colors
                                                                        .white,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: Container(
                                                    //color: Colors.green,
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            IconButton(
                                                              onPressed: () {
                                                                showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (context) {
                                                                    TextEditingController
                                                                        nameController =
                                                                        TextEditingController(
                                                                            text:
                                                                                e.name);
                                                                    TextEditingController
                                                                        gridController =
                                                                        TextEditingController(
                                                                            text:
                                                                                e.grid);
                                                                    TextEditingController
                                                                        stdController =
                                                                        TextEditingController(
                                                                            text:
                                                                                e.std);

                                                                    return AlertDialog(
                                                                      title: Text(
                                                                          'Edit Data'),
                                                                      content:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.min,
                                                                        children: <Widget>[
                                                                          TextField(
                                                                            controller:
                                                                                nameController,
                                                                            decoration:
                                                                                InputDecoration(labelText: 'Name'),
                                                                          ),
                                                                          TextField(
                                                                            controller:
                                                                                gridController,
                                                                            decoration:
                                                                                InputDecoration(labelText: 'GRID'),
                                                                          ),
                                                                          TextField(
                                                                            controller:
                                                                                stdController,
                                                                            decoration:
                                                                                InputDecoration(labelText: 'Std'),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      actions: <Widget>[
                                                                        TextButton(
                                                                          child:
                                                                              Text('Cancel'),
                                                                          onPressed:
                                                                              () {
                                                                            Navigator.of(context).pop();
                                                                          },
                                                                        ),
                                                                        TextButton(
                                                                          child:
                                                                              Text('Save'),
                                                                          onPressed:
                                                                              () {
                                                                            setState(() {
                                                                              e.name = nameController.text;
                                                                              e.grid = gridController.text;
                                                                              e.std = stdController.text;
                                                                            });
                                                                            Navigator.of(context).pop();
                                                                          },
                                                                        ),
                                                                      ],
                                                                    );
                                                                  },
                                                                );
                                                              },
                                                              icon: Icon(
                                                                  Icons.edit),
                                                            ),
                                                            IconButton(
                                                              onPressed: () {
                                                                setState(() {
                                                                  Global
                                                                      .allStudent
                                                                      .remove(
                                                                          e);
                                                                });
                                                              },
                                                              icon: Icon(
                                                                  Icons.delete),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 330, bottom: 5),
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('add_page');
                  },
                  child: Icon(Icons.add),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
