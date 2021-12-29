import 'package:flutter/material.dart';
import '../../DummyData/all_drama.dart';
import 'package:cached_network_image/cached_network_image.dart';

// screen
import '../../screen/drama_detail.dart';

class DramaCard extends StatelessWidget {
  const DramaCard({Key? key, required this.dramaObject}) : super(key: key);

  final Map<String, dynamic> dramaObject;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160,
      child: Column(
        children: [
          InkWell(
            splashColor: Colors.red,
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: CachedNetworkImage(
                    imageUrl: dramaObject['image_info']['src'],
                    placeholder: (context, url) => Image.asset(
                      'assets/images/placeholder.png',
                      height: 200,
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                    ),
                    width: 160,
                    fit: BoxFit.cover,
                    alignment: Alignment.center,
                    fadeInDuration: const Duration(milliseconds: 600),
                    fadeOutDuration: const Duration(milliseconds: 600),
                    fadeInCurve: Curves.easeInToLinear,
                    fadeOutCurve: Curves.easeInToLinear,
                  ),
                ),
              ],
            ),
            onTap: () {
              print('navigate to Drama detail screen!');
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DramaDetail(dramaObject: dramaObject)),
              );
            },
            // radius: 20,
          ),
          Container(
            padding: const EdgeInsets.only(top: 5),
            alignment: Alignment.topLeft,
            child: Text(
              dramaObject['title'],
              style: const TextStyle(
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
