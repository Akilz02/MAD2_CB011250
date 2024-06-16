import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:test02/components/bottom_nav_bar.dart';
import 'package:test02/pages/setting_page.dart';

import 'cart_page.dart';
import 'profile_page.dart';
import 'shop_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // late StreamSubscription subscription;
  // var isDeviceConnected = false;
  // bool isAlertSet = false;

  //navigation bottom bar
  int _selectedIndex = 0;

  void navigateBottomBar(int newIndex) {
    setState(() {
      _selectedIndex = newIndex;
    });
  }

  //logout button
  // void _handleLogout() {
  //   FirebaseAuth.instance.signOut();
  //   // Navigator.pushReplacementNamed(context, '/login');
  // }
  void _handleLogout() {
    FirebaseAuth.instance.signOut().then((_) {
      Navigator.pushReplacementNamed(context, '/login');
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error signing out: $error'),
        ),
      );
    });
  }

  //pages to display

  final List<Widget> _pages = [
    //shop page
    const ShopPage(),

    //cart page
    const CartPage(),

    //profile page
    const ProfilePage(),

    //settings page
    SettingPage(),
  ];

  // @override
  // void initState() {
  //   getConnectivity();
  //   super.initState();
  // }

  // getConnectivity() =>
  //     subscription = Connectivity().onConnectivityChanged.listen(
  //           (ConnectivityResult result) async {
  //         isDeviceConnected = await InternetConnectionChecker().hasConnection;
  //         if (!isDeviceConnected && isAlertSet == false) {
  //           showDialogBox();
  //           setState(() => isAlertSet = true);
  //         }
  //       } as void Function(List<ConnectivityResult> event)?,
  //     );
  //
  // @override
  // void dispose() {
  //   subscription.cancel();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      appBar: AppBar(
        title: const Text('Bubble Tea Shop'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: _handleLogout,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/weather_page');
        },
        child: Icon(Icons.fastfood, color: Colors.white),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      body: _pages[_selectedIndex],
    );
  }

  // showDialogBox() =>showCupertinoDialog<String>(
  //   context: context,
  //   builder: (BuildContext context) => CupertinoAlertDialog(
  //     title: const Text('No Internet Connection'),
  //     content: const Text('Please check your internet connection.'),
  //     actions: <Widget>[
  //       TextButton(
  //         onPressed: () async {
  //           Navigator.pop(context, 'Cancel');
  //           setState(() => isAlertSet = false);
  //           isDeviceConnected =
  //           await InternetConnectionChecker().hasConnection;
  //           if (isDeviceConnected) {
  //             showDialogBox();
  //             setState(() =>
  //               isAlertSet = true);
  //           }
  //         },
  //         child: const Text('OK'),
  //       ),
  //     ]
  //   ),
  // );
}


// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:test02/components/bottom_nav_bar.dart';
// import 'package:test02/pages/setting_page.dart';
//
// import 'cart_page.dart';
// import 'profile_page.dart';
// import 'shop_page.dart';
//
// class HomePage extends StatefulWidget {
//   const HomePage ({super.key});
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//
//   //navigation bottom bar
//   int _selectedIndex = 0;
//   void navigateBottomBar(int newIndex){
//     setState(() {
//       _selectedIndex = newIndex;
//     });
//   }
//
//   //logout button
//   void _handleLogout(BuildContext context) {
//     FirebaseAuth.instance.signOut().then((_) {
//       Navigator.pushReplacementNamed(context, '/login');
//     }).catchError((error) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Error signing out: $error'),
//         ),
//       );
//     });
//   }
//
//   //pages to display
//
//   final List<Widget> _pages = [
//     //shop page
//     const ShopPage(),
//
//     //cart page
//     const CartPage(),
//
//     //profile page
//     const ProfilePage(),
//
//     //settings page
//     SettingPage(),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Theme.of(context).colorScheme.secondary,
//       appBar: AppBar(
//         title: const Text('Bubble Tea Shop'),
//         centerTitle: true,
//         backgroundColor: Theme.of(context).colorScheme.primary,
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.logout),
//             onPressed: () => _handleLogout(context), // Pass context to logout handler
//           ),
//         ],
//       ),
//       bottomNavigationBar: MyBottomNavBar(
//         onTabChange: (index) => navigateBottomBar(index),
//       ) ,
//       body: _pages[_selectedIndex],
//     );
//   }
// }
