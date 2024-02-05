import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/feature/pageview/page/cart/cart.dart';
import 'package:flutter_application_1/feature/pageview/page/favourite/favourites.dart';
import 'package:flutter_application_1/feature/pageview/page/news/news.dart';
import 'package:flutter_application_1/feature/pageview/page/profle/profily.dart';

import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class home_view extends StatefulWidget {
  const home_view({super.key});

  @override
  State<home_view> createState() => _home_viewState();
}

class _home_viewState extends State<home_view> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? user;
  Future<void> _getuser() async {
    user = _auth.currentUser;
  }

  @override
  void initState() {
    super.initState();
    _getuser();
  }

  final bottomnavigationbarcontroller = PersistentTabController();
  List<Widget> _buildScreens() {
    return [
      const news(),
      const cart(),
      const favourite(),
      const profily(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        // opacity: 0.1,
        icon: const Icon(CupertinoIcons.home),
        title: ("Home"),
        activeColorPrimary: CupertinoColors.white,
        inactiveColorPrimary: CupertinoColors.black,
      ),
      PersistentBottomNavBarItem(
        // opacity: 1,
        icon: const Icon(CupertinoIcons.shopping_cart),
        title: ("cart"),
        activeColorPrimary: CupertinoColors.white,
        inactiveColorPrimary: CupertinoColors.black,
      ),
      PersistentBottomNavBarItem(
        // opacity: 0.1,
        icon: const Icon(CupertinoIcons.square_favorites),
        title: ("favourites"),
        activeColorPrimary: CupertinoColors.white,
        inactiveColorPrimary: CupertinoColors.black,
      ),
      PersistentBottomNavBarItem(
        // opacity: 1,
        icon: const Icon(CupertinoIcons.profile_circled),
        title: ("profile"),
        activeColorPrimary: CupertinoColors.white,
        inactiveColorPrimary: CupertinoColors.black,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        context,
        controller: bottomnavigationbarcontroller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: Colors.white,
        handleAndroidBackButtonPress: true, // Default is true.
        resizeToAvoidBottomInset:
            true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: true, // Default is true.
        hideNavigationBarWhenKeyboardShows:
            true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        decoration: const NavBarDecoration(
          // borderRadius: BorderRadius.circular(10.0),
          // colorBehindNavBar: Colors.black,

          gradient: LinearGradient(
            colors: <Color>[
              Color(0xff0d47a1),
              Color(0xff1976d2),
              Color(0xff42a5f5)
            ],
          ),
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: const ItemAnimationProperties(
          // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.style3,
        // Choose the nav bar style with this property.
      ),
    );
  }
}
