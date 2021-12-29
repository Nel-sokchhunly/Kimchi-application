import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutterapp/components/drama_detail/video_player.dart';

// components
import '../components/library/drama_card.dart';

// dummy data
import '../../DummyData/all_drama.dart';

class LibraryPage extends StatefulWidget {
  const LibraryPage({Key? key}) : super(key: key);

  @override
  _LibraryPageState createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
      child: Column(
        children: [
          // Navbar
          Column(
            children: const [
              SizedBox(
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Library',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 2.0,
                    ),
                  ),
                ),
              ),
              Divider(
                color: Colors.white,
                thickness: 2,
              ),
            ],
          ),
          // const Expanded(
          //   child: VideoDisplay(
          //     videoUrl: 'https://www.youtube.com/watch?v=wpW6aVWgvMc',
          //   ),
          // )
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(top: 15, bottom: 15),
              itemCount: 1,
              itemBuilder: (context, index) {
                return Wrap(
                  direction: Axis.horizontal,
                  runSpacing: 15,
                  spacing: 15,
                  alignment: WrapAlignment.spaceBetween,
                  children: [
                    for (var drama in allDramaData)
                      DramaCard(dramaObject: drama),
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
