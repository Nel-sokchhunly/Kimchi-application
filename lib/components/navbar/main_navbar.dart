import 'package:flutter/material.dart';

// components
import './navbar_button.dart';

class MainNavbar extends StatelessWidget {
  const MainNavbar({
    Key? key,
    required this.currentPage,
    required this.navigateTo,
  }) : super(key: key);

  final String currentPage;
  final Function navigateTo;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 62,
      // width: double.infinity,
      decoration: const BoxDecoration(
          border: Border(
              top: BorderSide(
        color: Colors.white,
        width: 2,
      ))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          NavbarButton(
            pageName: 'home',
            icon: const Icon(Icons.book),
            toolTipText: "Home",
            currentPage: currentPage,
              navigateTo: navigateTo,
          ),
          NavbarButton(
            pageName: 'search',
            icon: const Icon(Icons.search),
            toolTipText: "Search",
            currentPage: currentPage,
            navigateTo: navigateTo,
          ),
          NavbarButton(
            pageName: 'setting',
            icon: const Icon(Icons.settings),
            toolTipText: "Setting",
            currentPage: currentPage,
            navigateTo: navigateTo,
          ),
        ],
      ),
    );
  }
}
