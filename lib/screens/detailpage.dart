// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:io';
// import 'package:resumewise/utils/all_colors.dart';
// import 'package:resumewise/utils/custom_widget.dart';
// import 'package:resumewise/utils/global.dart';
// import 'package:resumewise/utils/text_style.dart';
// import 'package:resumewise/utils/toast_Message.dart';
//
// class contactinfo extends StatefulWidget {
//   const contactinfo({super.key});
//
//   @override
//   State<contactinfo> createState() => _contactinfoState();
// }
//
// class _contactinfoState extends State<contactinfo> {
//   ImagePicker imagePicker = ImagePicker();
//   XFile? xFile;
//   String? pickImagePath;
//   bool isContact = true;
//
//   GlobalKey<FormState> contactInfoKey = GlobalKey<FormState>();
//   TextEditingController nameController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController phoneController = TextEditingController();
//   TextEditingController addressController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey.shade200,
//       body: Center(
//         child: Stack(
//           alignment: Alignment.topCenter,
//           children: [
//             (isContact)
//                 ? SingleChildScrollView(
//                     child: Column(
//                       children: [
//                         SizedBox(
//                           height: 190,
//                         ),
//                         Padding(
//                           padding: EdgeInsets.only(
//                               bottom: 100, left: 20, right: 20, top: 5),
//                           child: Column(
//                             children: [
//                               Container(
//                                 padding: EdgeInsets.only(
//                                     top: 50, left: 25, right: 25),
//                                 height:
//                                     MediaQuery.of(context).size.height / 1.55,
//                                 color: Colors.white,
//                                 child: Form(
//                                   key: contactInfoKey,
//                                   child: Column(
//                                     children: [
//                                       Container(
//                                         margin: EdgeInsets.only(bottom: 10),
//                                         child: Row(
//                                           children: [
//                                             Expanded(
//                                                 child: TextFormField(
//                                               validator: (val) {
//                                                 if (val!.isEmpty) {
//                                                   return "Enter Name";
//                                                 }
//                                                 return null;
//                                               },
//                                               onSaved: (val) {
//                                                 Global.name = val ?? "";
//                                               },
//                                               controller: nameController,
//                                               decoration: InputDecoration(
//                                                 prefixIcon: Icon(
//                                                   Icons.person,
//                                                   size: 30,
//                                                 ),
//                                                 border: OutlineInputBorder(),
//                                                 hintText: "Name",
//                                                 hintStyle: TextStyle(
//                                                   fontSize: 17,
//                                                   color: Colors.grey.shade400,
//                                                 ),
//                                               ),
//                                             )),
//                                           ],
//                                         ),
//                                       ),
//                                       SizedBox(
//                                         width: 20,
//                                       ),
//                                       Container(
//                                         margin: EdgeInsets.only(bottom: 10),
//                                         child: Row(
//                                           children: [
//                                             Expanded(
//                                                 child: TextFormField(
//                                               keyboardType:
//                                                   TextInputType.emailAddress,
//                                               validator: (val) {
//                                                 if (val!.isEmpty) {
//                                                   return "Enter Email";
//                                                 }
//                                                 return null;
//                                               },
//                                               onSaved: (val) {
//                                                 Global.email = val ?? "";
//                                               },
//                                               controller: emailController,
//                                               decoration: InputDecoration(
//                                                 prefixIcon: Icon(
//                                                   Icons.email,
//                                                   size: 30,
//                                                 ),
//                                                 border: OutlineInputBorder(),
//                                                 hintText: "Email",
//                                                 hintStyle: TextStyle(
//                                                   fontSize: 17,
//                                                   color: Colors.grey.shade400,
//                                                 ),
//                                               ),
//                                             )),
//                                           ],
//                                         ),
//                                       ),
//                                       SizedBox(
//                                         width: 20,
//                                       ),
//                                       Container(
//                                         margin: EdgeInsets.only(bottom: 10),
//                                         child: Row(
//                                           children: [
//                                             Expanded(
//                                                 child: TextFormField(
//                                               keyboardType:
//                                                   TextInputType.number,
//                                               validator: (val) {
//                                                 if (val!.isEmpty) {
//                                                   return "Enter Contact";
//                                                 }
//                                                 return null;
//                                               },
//                                               onSaved: (val) {
//                                                 Global.phone = val ?? "";
//                                               },
//                                               controller: phoneController,
//                                               decoration: InputDecoration(
//                                                 prefixIcon: Icon(
//                                                   Icons.call,
//                                                   size: 30,
//                                                 ),
//                                                 border: OutlineInputBorder(),
//                                                 hintText: "Contact",
//                                                 hintStyle: TextStyle(
//                                                   fontSize: 17,
//                                                   color: Colors.grey.shade400,
//                                                 ),
//                                               ),
//                                             )),
//                                           ],
//                                         ),
//                                       ),
//                                       SizedBox(
//                                         width: 20,
//                                       ),
//                                       Container(
//                                         margin: EdgeInsets.only(bottom: 10),
//                                         child: Row(
//                                           children: [
//                                             Expanded(
//                                               child: TextFormField(
//                                                 validator: (val) {
//                                                   if (val!.isEmpty) {
//                                                     return "Enter Address";
//                                                   }
//                                                   return null;
//                                                 },
//                                                 onSaved: (val) {
//                                                   Global.address = val ?? "";
//                                                 },
//                                                 controller: addressController,
//                                                 maxLines: 3,
//                                                 decoration: InputDecoration(
//                                                   prefixIcon: Icon(
//                                                     Icons.location_on,
//                                                     size: 30,
//                                                   ),
//                                                   border: OutlineInputBorder(),
//                                                   hintText: "Current Address",
//                                                   hintStyle: TextStyle(
//                                                     fontSize: 17,
//                                                     color: Colors.grey.shade400,
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                       SizedBox(
//                                         height: 10,
//                                       ),
//                                       Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceAround,
//                                         children: [
//                                           OutlinedButton(
//                                             onPressed: () {
//                                               if (contactInfoKey.currentState!
//                                                   .validate()) {
//                                                 contactInfoKey.currentState!
//                                                     .save();
//
//                                                 nameController.clear();
//                                                 emailController.clear();
//                                                 phoneController.clear();
//                                                 addressController.clear();
//                                               }
//                                             },
//                                             style: OutlinedButton.styleFrom(
//                                               padding: EdgeInsets.symmetric(
//                                                   horizontal: 50, vertical: 14),
//                                               foregroundColor: primaryBlueColor,
//                                             ),
//                                             child: Text("Clear"),
//                                           ),
//                                           ElevatedButton(
//                                             onPressed: () {
//                                               if (contactInfoKey.currentState!
//                                                   .validate()) {
//                                                 contactInfoKey.currentState!
//                                                     .save();
//
//                                                 ScaffoldMessenger.of(context)
//                                                     .showSnackBar(
//                                                   SnackBar(
//                                                     behavior: SnackBarBehavior
//                                                         .floating,
//                                                     backgroundColor:
//                                                         Colors.green.shade500,
//                                                     action: SnackBarAction(
//                                                       label: "Next",
//                                                       onPressed: () {
//                                                         setState(() {
//                                                           isContact = false;
//                                                         });
//                                                       },
//                                                       textColor: primaryWhite,
//                                                     ),
//                                                     content: Text(
//                                                       "Contact information Saved SuccessFully!!!",
//                                                     ),
//                                                   ),
//                                                 );
//
//                                                 nameController.clear();
//                                                 emailController.clear();
//                                                 phoneController.clear();
//                                                 addressController.clear();
//                                               }
//                                             },
//                                             style: OutlinedButton.styleFrom(
//                                               padding: EdgeInsets.symmetric(
//                                                   horizontal: 50, vertical: 14),
//                                               foregroundColor: primaryWhite,
//                                               backgroundColor: primaryBlueColor,
//                                             ),
//                                             child: Text("Save"),
//                                           ),
//                                         ],
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   )
//                 : Column(
//                     children: [
//                       SizedBox(
//                         height: 195,
//                       ),
//                       Container(
//                         height: 300,
//                         margin: EdgeInsets.only(left: 25, right: 25),
//                         color: Colors.white,
//                         alignment: Alignment.center,
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: [
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceAround,
//                               children: [
//                                 GestureDetector(
//                                   onTap: () {
//                                     showDialog(
//                                         context: context,
//                                         builder: (context) {
//                                           return AlertDialog(
//                                             title: Text(
//                                               "Pick Image",
//                                             ),
//                                             content: Text(
//                                               "Choose Image From Gallery or Camera",
//                                             ),
//                                             actions: [
//                                               FloatingActionButton(
//                                                 mini: true,
//                                                 onPressed: () async {
//                                                   xFile = await imagePicker
//                                                       .pickImage(
//                                                     source: ImageSource.camera,
//                                                   );
//                                                   setState(() {
//                                                     if (xFile != null) {
//                                                       pickImagePath =
//                                                           xFile!.path;
//                                                     }
//                                                   });
//
//                                                   Navigator.of(context).pop();
//                                                 },
//                                                 elevation: 3,
//                                                 child: Icon(
//                                                   Icons.camera_alt,
//                                                 ),
//                                               ),
//                                               FloatingActionButton(
//                                                 mini: true,
//                                                 onPressed: () async {
//                                                   xFile = await imagePicker
//                                                       .pickImage(
//                                                     source: ImageSource.gallery,
//                                                   );
//                                                   setState(() {
//                                                     if (xFile != null) {
//                                                       pickImagePath =
//                                                           xFile!.path;
//                                                     }
//                                                   });
//
//                                                   Navigator.of(context).pop();
//                                                 },
//                                                 elevation: 3,
//                                                 child: Icon(
//                                                   Icons.image,
//                                                 ),
//                                               ),
//                                             ],
//                                           );
//                                         });
//                                   },
//                                   child: CircleAvatar(
//                                     radius: 70,
//                                     backgroundColor:
//                                         primaryBlueColor.withOpacity(0.5),
//                                     backgroundImage: (pickImagePath != null)
//                                         ? FileImage(File(pickImagePath!))
//                                         : null,
//                                     child: (pickImagePath != null)
//                                         ? Container()
//                                         : Icon(
//                                             Icons.add,
//                                             color: primaryWhite,
//                                             size: 30,
//                                           ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceAround,
//                               children: [
//                                 OutlinedButton(
//                                   onPressed: () {},
//                                   style: OutlinedButton.styleFrom(
//                                     padding: EdgeInsets.symmetric(
//                                         horizontal: 50, vertical: 14),
//                                     foregroundColor: primaryBlueColor,
//                                   ),
//                                   child: Text("Clear"),
//                                 ),
//                                 ElevatedButton(
//                                   onPressed: () {
//                                     if (pickImagePath != null) {
//                                       Global.profileImageFile =
//                                           File(pickImagePath!);
//                                       toastMessage(
//                                           context: context,
//                                           message:
//                                               "Profile Image Saved Successfully!!!");
//                                     }
//                                   },
//                                   style: OutlinedButton.styleFrom(
//                                     padding: EdgeInsets.symmetric(
//                                         horizontal: 50, vertical: 14),
//                                     foregroundColor: primaryWhite,
//                                     backgroundColor: primaryBlueColor,
//                                   ),
//                                   child: Text("Save"),
//                                 )
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//             CustomWidget.getAppBar(
//               context: context,
//               title: "Resume WorkSpace",
//               child: Row(
//                 children: [
//                   GestureDetector(
//                     onTap: () {
//                       setState(() {
//                         isContact = true;
//                       });
//                     },
//                     child: Container(
//                       width: MediaQuery.of(context).size.width / 2,
//                       decoration: BoxDecoration(
//                         border: Border(
//                             bottom: BorderSide(
//                           color:
//                               primaryWhite.withOpacity((isContact) ? 0.90 : 0),
//                           width: 2.5,
//                         )),
//                         color: primaryBlueColor,
//                       ),
//                       alignment: Alignment.center,
//                       child: Text(
//                         "Contact",
//                         style: TextStyling.subtitle,
//                       ),
//                     ),
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       setState(() {
//                         isContact = false;
//                       });
//                     },
//                     child: Container(
//                       width: MediaQuery.of(context).size.width / 2,
//                       decoration: BoxDecoration(
//                         border: Border(
//                             bottom: BorderSide(
//                           color:
//                               primaryWhite.withOpacity((isContact) ? 0 : 0.90),
//                           width: 2.5,
//                         )),
//                         color: primaryBlueColor,
//                       ),
//                       alignment: Alignment.center,
//                       child: Text(
//                         "Photo",
//                         style: TextStyling.subtitle,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
