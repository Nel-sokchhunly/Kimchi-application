import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutterapp/components/drama_detail/video_player.dart';
import '../../service/launch_link.dart';

class DramaEpisodePage extends StatefulWidget {
  const DramaEpisodePage({Key? key, required this.dramaObject})
      : super(key: key);

  final Map<String, dynamic> dramaObject;

  @override
  _DramaEpisodePageState createState() => _DramaEpisodePageState();
}

class _DramaEpisodePageState extends State<DramaEpisodePage>
    with LaunchWebView {
  // ads block link
  String adsBlockLinkAndroid =
      'https://play.google.com/store/apps/details?id=org.blokada.alarm.dnschanger';
  String adsBlockLinkIOS =
      'https://apps.apple.com/us/app/adguard-adblock-privacy/id1047223162';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            child: Container(
              padding: const EdgeInsets.all(15),
              margin: const EdgeInsets.only(bottom: 15),
              decoration: BoxDecoration(
                color: Colors.orange.shade600,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                "Click here to download Adsblocker for a better streaming experience!"
                    .toUpperCase(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1,
                ),
              ),
            ),
            onTap: () {
              if (Platform.isAndroid) {
                launchURL(adsBlockLinkAndroid);
              } else if (Platform.isIOS) {
                launchURL(adsBlockLinkIOS);
              }
            },
          ),
          for (var episode in widget.dramaObject['episodes'].reversed.toList())
            InkWell(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                margin: const EdgeInsets.only(bottom: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text.rich(
                          TextSpan(
                            text: RegExp(r"(Episode).+")
                                .firstMatch(episode['title'])
                                ?.group(0),
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Text(
                          episode['upload_time'],
                          style: const TextStyle(color: Colors.black45),
                        ),
                      ],
                    ),
                    Text(
                      '${episode['type']}',
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: (episode['type'] == 'SUB')
                              ? Colors.orange.shade600
                              : Colors.blue.shade600,
                          fontSize: 16),
                    ),
                  ],
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VideoDisplay(
                        videoUrl:
                            // "https://assets.mixkit.co/videos/preview/mixkit-a-girl-blowing-a-bubble-gum-at-an-amusement-park-1226-large.mp4",
                            episode['ep_streaming_link']),
                  ),
                );
              },
            ),
        ],
      ),
    );
  }
}
