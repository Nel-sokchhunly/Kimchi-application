import 'package:flutter/material.dart';

// component
import '../components/navbar/main_navbar.dart';

// screen
import 'library.dart';
import 'search.dart';
import 'setting.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String currentPage = 'home';

  navigateTo(String page) {
    setState(() {
      currentPage = page;
    });
  }

  Map<String, Widget> pageSelector = {
    'library': const LibraryPage(),
    'search': const SearchPage(),
    'setting': const SettingPage(),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar:
          MainNavbar(currentPage: currentPage, navigateTo: navigateTo),
      body: SafeArea(
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          switchInCurve: Curves.easeInToLinear,
          switchOutCurve: Curves.easeInToLinear,
          child: pageSelector[currentPage] ?? const LibraryPage(),
        ),
      ),
    );
  }
}
