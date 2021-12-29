import 'package:flutter/material.dart';

// components
import '../navbar/navbar_button.dart';

class CustomDramaBottomBar extends StatelessWidget {
  const CustomDramaBottomBar({
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
          TextButton(
            child: const Text('Info'),
            style: TextButton.styleFrom(
              primary : (currentPage == 'info-page') ? Colors.orange.shade600 : Colors.white,
            ),
            onPressed: () {
              if(currentPage != 'info-page') navigateTo('info-page');
            },
          ),TextButton(
            child: const Text('Episodes'),
            style: TextButton.styleFrom(
              primary : (currentPage == 'episode-page') ? Colors.orange.shade600 : Colors.white,
            ),
            onPressed: () {
              if(currentPage != 'episode-page') navigateTo('episode-page');
            },
          ),
        ],
      ),
    );
  }
}
