import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import './screen/authentication.dart';
import './screen/library.dart';
import './screen/search.dart';
import './screen/setting.dart';

// layout
import 'screen/homepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isAndroid) {
    await AndroidInAppWebViewController.setWebContentsDebuggingEnabled(true);
  }

  runApp(const Main());
}

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(
            Theme.of(context)
                .textTheme, // If this is not set, then ThemeData.light().textTheme is used.
          ).apply(
            displayColor: Colors.white,
            bodyColor: Colors.white,
          ),
          primaryColor: const Color(0xFFDC2F02),
          backgroundColor: Colors.black),
      title: 'Kimchi',
      home: const Homepage(),
    );
  }
}
