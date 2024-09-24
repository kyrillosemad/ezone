// // ignore_for_file: file_names
// import 'package:bookito/services/auth/logout_fun.dart';
// import 'package:bookito/view/constants/colors.dart';
// import 'package:bookito/view/modules_view/main%20pages/screens/add%20book.dart';
// import 'package:bookito/view/modules_view/main%20pages/screens/favorite.dart';
// import 'package:bookito/view/modules_view/main%20pages/screens/homepage.dart';
// import 'package:bookito/view/modules_view/main%20pages/screens/mybooks.dart';
// import 'package:ezone/view/view_modules/home_page/screens/home_page.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:sizer/sizer.dart';
// import 'package:molten_navigationbar_flutter/molten_navigationbar_flutter.dart';

// class BottomNav extends StatefulWidget {
//   const BottomNav({super.key});

//   @override
//   State<BottomNav> createState() => _BottomNavState();
// }

// class _BottomNavState extends State<BottomNav> {
//   int curInd = 2;
//   List<Widget> body = const [
//    HomePage(),

//   ];

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         bottomNavigationBar: MoltenBottomNavigationBar(
//           domeCircleColor: MyColors().maincolor,
//           domeCircleSize: 26.sp,
//           borderSize: 1.sp,
//           borderColor: MyColors().maincolor,
//           borderRaduis: const BorderRadius.all(Radius.zero),
//           barColor: Colors.white,
//           selectedIndex: curInd,
//           onTabChange: (clickedIndex) {
//             setState(() {
//               if (clickedIndex == 4) {
//                 Get.defaultDialog(
//                   title: "logout!",
//                   titleStyle: TextStyle(color: MyColors().maincolor),
//                   cancelTextColor: MyColors().maincolor,
//                   buttonColor: MyColors().maincolor,
//                   content: Text(
//                     "are you sure to logout",
//                     style: TextStyle(color: MyColors().maincolor),
//                   ),
//                   confirmTextColor: Colors.white,
//                   onCancel: () {},
//                   onConfirm: () {
//                     setState(() {
//                       logoutFun();
//                     });
//                   },
//                 );
//               } else {
//                 setState(() {
//                   curInd = clickedIndex;
//                 });
//               }
//             });
//           },
//           barHeight: 8.h,
//           tabs: [
//             MoltenTab(
//               unselectedColor: MyColors().maincolor,
//               selectedColor: Colors.white,
//               icon: Icon(
//                 Icons.favorite,
//                 size: 19.sp,
//               ),
//               title: Text(
//                 "Favorite",
//                 style: TextStyle(
//                   color: MyColors().maincolor,
//                   fontSize: 11.sp,
//                 ),
//               ),
//             ),
//             MoltenTab(
//               unselectedColor: MyColors().maincolor,
//               selectedColor: Colors.white,
//               icon: Icon(
//                 Icons.add,
//                 size: 19.sp,
//               ),
//               title: Text(
//                 "New book",
//                 style: TextStyle(
//                   color: MyColors().maincolor,
//                   fontSize: 11.sp,
//                 ),
//               ),
//             ),
//             MoltenTab(
//               unselectedColor: MyColors().maincolor,
//               selectedColor: Colors.white,
//               icon: Icon(
//                 Icons.home,
//                 size: 19.sp,
//               ),
//               title: Text(
//                 "Home",
//                 style: TextStyle(
//                   color: MyColors().maincolor,
//                   fontSize: 11.sp,
//                 ),
//               ),
//             ),
//             MoltenTab(
//               unselectedColor: MyColors().maincolor,
//               selectedColor: Colors.white,
//               icon: Icon(
//                 Icons.my_library_books,
//                 size: 18.sp,
//               ),
//               title: Text(
//                 "My books",
//                 style: TextStyle(
//                   color: MyColors().maincolor,
//                   fontSize: 11.sp,
//                 ),
//               ),
//             ),
//             MoltenTab(
//               unselectedColor: MyColors().maincolor,
//               selectedColor: Colors.white,
//               icon: Icon(
//                 Icons.logout,
//                 size: 19.sp,
//               ),
//               title: Text(
//                 "Log out",
//                 style: TextStyle(
//                   color: MyColors().maincolor,
//                   fontSize: 11.sp,
//                 ),
//               ),
//             ),
//           ],
//         ),
//         body: body[curInd],
//       ),
//     );
//   }
// }
