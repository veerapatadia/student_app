// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:resumewise/utils/global.dart';
// import 'package:resumewise/utils/text_style.dart';
// import 'package:resumewise/utils/all_colors.dart';
//
// class homepage extends StatefulWidget {
//   const homepage({super.key});
//
//   @override
//   State<homepage> createState() => _homepageState();
// }
//
// class _homepageState extends State<homepage> {
//   bool isClicked = true;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "Resume Wise",
//           style: TextStyle(color: primaryWhite),
//         ),
//         backgroundColor: primaryBlueColor,
//         centerTitle: true,
//       ),
//       body: Center(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Padding(
//               padding: EdgeInsets.only(top: 15, left: 15, right: 15),
//               child: Row(
//                 children: [
//                   Container(
//                     height: 230,
//                     width: 380,
//                     color: Colors.white,
//                     child: Image.asset(
//                       "assets/icons/splash2.jpg",
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.only(top: 18, left: 20),
//               child: Column(
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Text(
//                         "Resumes",
//                         style: TextStyle(
//                           color: primaryBlueColor,
//                           fontSize: 22,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                     ],
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(top: 15),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         GestureDetector(
//                           onTap: () {
//                             setState(() {
//                               isClicked = true;
//                             });
//                           },
//                           child: Container(
//                             height: 60,
//                             width: 155,
//                             decoration: BoxDecoration(
//                               color: (isClicked == true)
//                                   ? primaryBlueColor
//                                   : primaryWhite,
//                               boxShadow: <BoxShadow>[
//                                 BoxShadow(
//                                   color: Colors.grey,
//                                   offset: Offset(0, 5),
//                                   spreadRadius: 2,
//                                   blurRadius: 7,
//                                 )
//                               ],
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             alignment: Alignment.center,
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               children: [
//                                 Icon(
//                                   Icons.task_rounded,
//                                   color: (isClicked == false)
//                                       ? primaryBlueColor
//                                       : primaryWhite,
//                                 ),
//                                 Text(
//                                   "My Resumes",
//                                   style: TextStyle(
//                                     color: (isClicked)
//                                         ? primaryWhite
//                                         : primaryBlueColor,
//                                     fontSize: 18,
//                                     fontWeight: FontWeight.w600,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         GestureDetector(
//                           onTap: () {
//                             setState(() {
//                               isClicked = false;
//                               showDialog(
//                                   context: context,
//                                   barrierDismissible: false,
//                                   builder: (context) {
//                                     return AlertDialog(
//                                       title: Text("Resume Name"),
//                                       content: Expanded(
//                                         child: TextField(
//                                           onChanged: (val) {
//                                             Global.resumeName = val;
//                                           },
//                                           decoration: InputDecoration(
//                                             hintText: "Enter Resume Name",
//                                             border: OutlineInputBorder(),
//                                           ),
//                                         ),
//                                       ),
//                                       actions: [
//                                         FloatingActionButton(
//                                           mini: true,
//                                           elevation: 3,
//                                           backgroundColor: primaryWhite,
//                                           foregroundColor: primaryBlueColor,
//                                           onPressed: () {
//                                             Navigator.of(context)
//                                                 .pop('homepage');
//                                           },
//                                           child: Icon(Icons.close),
//                                         ),
//                                         FloatingActionButton(
//                                           mini: true,
//                                           elevation: 3,
//                                           backgroundColor: primaryBlueColor,
//                                           foregroundColor: primaryWhite,
//                                           onPressed: () {
//                                             Navigator.of(context)
//                                                 .pushNamed('workspace');
//                                           },
//                                           child: Icon(Icons.done),
//                                         ),
//                                       ],
//                                     );
//                                   });
//                             });
//                           },
//                           child: Container(
//                             height: 60,
//                             width: 155,
//                             decoration: BoxDecoration(
//                               color: (isClicked == false)
//                                   ? primaryBlueColor
//                                   : primaryWhite,
//                               boxShadow: <BoxShadow>[
//                                 BoxShadow(
//                                   color: Colors.grey,
//                                   offset: Offset(0, 5),
//                                   spreadRadius: 2,
//                                   blurRadius: 7,
//                                 )
//                               ],
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             alignment: Alignment.center,
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               children: [
//                                 Icon(
//                                   Icons.add,
//                                   color: (isClicked == false)
//                                       ? primaryWhite
//                                       : primaryBlueColor,
//                                 ),
//                                 Text(
//                                   "Create Resume",
//                                   style: TextStyle(
//                                     color: (isClicked == false)
//                                         ? primaryWhite
//                                         : primaryBlueColor,
//                                     fontSize: 18,
//                                     fontWeight: FontWeight.w600,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   (isClicked == true)
//                       ? (Global.allResume.isEmpty)
//                       ? Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       SizedBox(
//                         height: 60,
//                       ),
//                       Image.asset(
//                         "assets/icons/open-cardboard-box.png",
//                         height: 90,
//                       ),
//                       SizedBox(
//                         height: 40,
//                       ),
//                       Text(
//                         "No Resumes",
//                         style: TextStyle(
//                           fontSize: 19,
//                           color: secondaryGreyColor,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                     ],
//                   )
//                       : Container(
//                     child: Column(
//                       children: [
//                         ...Global.allResume.map(
//                               (e) => GestureDetector(
//                             onTap: () {
//                               Global.selectedResume = e;
//                               Navigator.of(context)
//                                   .pushNamed('pdf_viewer');
//                             },
//                             child: Container(
//                               margin: EdgeInsets.only(top: 10),
//                               child: Stack(
//                                 children: [
//                                   Padding(
//                                     padding: const EdgeInsets.only(
//                                         top: 20, left: 20, right: 20),
//                                     child: Container(
//                                       height: 100,
//                                       width: double.infinity,
//                                       decoration: BoxDecoration(
//                                         color: Colors.red,
//                                         borderRadius:
//                                         BorderRadius.circular(20),
//                                         gradient: LinearGradient(
//                                           begin: Alignment.centerLeft,
//                                           end: Alignment.centerRight,
//                                           colors: [
//                                             primaryBlueColor
//                                                 .withOpacity(0.18),
//                                             primaryBlueColor
//                                           ],
//                                         ),
//                                       ),
//                                       padding:
//                                       EdgeInsets.only(right: 16),
//                                       alignment:
//                                       Alignment.centerRight,
//                                       child: Text(
//                                         e.resumeName,
//                                         style: TextStyling.subtitle,
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   )
//                       : Container(),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
