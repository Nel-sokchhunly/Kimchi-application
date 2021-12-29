import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import '../../DummyData/all_drama.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({Key? key, required this.dramaObject}) : super(key: key);


  final Map<String, dynamic> dramaObject;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      // automaticallyImplyLeading: false,
      pinned: true,
      expandedHeight: MediaQuery.of(context).size.height * 0.41,
      backgroundColor: Colors.black,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          constraints: const BoxConstraints.expand(),
          decoration: BoxDecoration(
            image: DecorationImage(
              alignment: const Alignment(0, 0),
              image: NetworkImage(dramaObject['image_info']['src']),
              fit: BoxFit.cover,
            ),
            // border
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  alignment: const Alignment(0, -0.25),
                  color: Colors.grey.withOpacity(0.1),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: CachedNetworkImage(
                      imageUrl: dramaObject['image_info']['src'],
                      placeholder: (context, url) => Image.asset(
                        'assets/images/placeholder.png',
                        height: 200,
                        width: 150,
                        fit: BoxFit.fitHeight,
                        alignment: Alignment.center,
                      ),
                      height: 200,
                      fit: BoxFit.fitHeight,
                      alignment: Alignment.center,
                    ),

                  ),
                ),
                Container(
                  height: 30,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(30))),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
