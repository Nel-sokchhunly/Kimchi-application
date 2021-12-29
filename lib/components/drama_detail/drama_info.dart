import 'package:flutter/material.dart';
import '../../service/launch_link.dart';

class DramaInfoPage extends StatefulWidget {
  const DramaInfoPage({Key? key, required this.dramaObject}) : super(key: key);

  final Map<String, dynamic> dramaObject;

  @override
  _DramaInfoPageState createState() => _DramaInfoPageState();
}

class _DramaInfoPageState extends State<DramaInfoPage> with LaunchWebView  {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15, top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Drama content
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Drama title
              Text(
                widget.dramaObject['title'],
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
              ),
              //  trailer section
              InkWell(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                  decoration: BoxDecoration(
                    color: Colors.red.shade600,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text(
                        'Click here to watch the trailer',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  // getting the video id
                  // RegExp exp = RegExp(r"^https:\/\/www.youtube.com\/embed\/(.*)");
                  RegExp exp =
                      RegExp(r"(?<=https:\/\/www.youtube.com\/embed\/).*$");
                  // RegExpMatch? matches = exp.firstMatch(widget.dramaObject['trailer_embed_link']);
                  final matches =
                      exp.firstMatch(widget.dramaObject['trailer_embed_link']);

                  String? videoID = matches?.group(0);
                  String url = 'https://www.youtube.com/watch?v=$videoID';
                  launchURL(url);
                },
              ),
              // drama add/remove button
              InkWell(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                  decoration: BoxDecoration(
                    color: Colors.orange.shade600,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    children: const [
                      Icon(Icons.add, size: 24, color: Colors.white),
                      SizedBox(width: 15),
                      Text(
                        'Add to your library',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  print('click');
                },
              ),

              //  drama detail
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // other names section
                  Text.rich(
                    TextSpan(
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                      text: 'Other names: ',
                      children: [
                        TextSpan(
                            text: widget.dramaObject['other_name'].join(', '),
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                            ))
                      ],
                    ),
                  ),
                  // status section
                  Text.rich(
                    TextSpan(
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                      text: 'Status : ',
                      children: [
                        TextSpan(
                            text: widget.dramaObject['status'],
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                            ))
                      ],
                    ),
                  ),
                  // genre section
                  Text.rich(
                    TextSpan(
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                      text: 'Genre : ',
                      children: [
                        TextSpan(
                            text: widget.dramaObject['genre'].join(', '),
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                            ))
                      ],
                    ),
                  ),
                  //  Description
                  Text.rich(
                    TextSpan(
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                      text: 'Description : \n    ',
                      children: [
                        TextSpan(
                            text: widget.dramaObject['description']
                                .join('\n    '),
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            ] //    adding spacing to each element inside the column
                .map((e) => Padding(
                    padding: const EdgeInsets.only(bottom: 15), child: e))
                .toList(),
          )
        ],
      ),
    );
  }
}

