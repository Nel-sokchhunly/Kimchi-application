import 'package:flutter/material.dart';
import 'package:flutterapp/state/index.dart';

class NavbarButton extends StatelessWidget {
  const NavbarButton({
    Key? key,
    required this.pageName,
    required this.icon,
    required this.toolTipText,
    required this.currentPage,
    required this.navigateTo,
  }) : super(key: key);

  final String pageName;
  final Icon icon;
  final String toolTipText;
  final String currentPage;
  final Function navigateTo;



  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: icon,
      color: (pageName == currentPage) ? Colors.orange.shade600 : Colors.white,
      tooltip: toolTipText,
      onPressed: () {
        if(currentPage != pageName) navigateTo(pageName);
      },
    );
  }
}
