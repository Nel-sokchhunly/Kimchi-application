import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:html/parser.dart';
import 'dart:io';
import 'package:url_launcher/url_launcher.dart';

// ignore: depend_on_referenced_packages
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class CustomVideoPlayer extends StatefulWidget {
  const CustomVideoPlayer({Key? key, required this.videoPlayerController})
      : super(key: key);

  final VideoPlayerController videoPlayerController;

  @override
  _CustomVideoPlayerState createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  late ChewieController chewieController;

  @override
  void initState() {
    chewieController = ChewieController(
      videoPlayerController: widget.videoPlayerController,
      looping: false,
      autoPlay: true,
      // aspectRatio: 16 / 9,
      autoInitialize: true,
      fullScreenByDefault: true,
    );

    super.initState();
  }

  @override
  void dispose() {
    widget.videoPlayerController.dispose();
    chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Chewie(
          controller: chewieController,
        ),
      ),
    );
  }
}

class VideoDisplay extends StatefulWidget {
  const VideoDisplay({Key? key, required this.videoUrl}) : super(key: key);

  final String videoUrl;

  @override
  _VideoDisplayState createState() => _VideoDisplayState();
}

class _VideoDisplayState extends State<VideoDisplay> {
  InAppWebViewController? webViewController;

  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
    crossPlatform: InAppWebViewOptions(
      useShouldOverrideUrlLoading: true,
      mediaPlaybackRequiresUserGesture: false,
    ),
    android: AndroidInAppWebViewOptions(
      useHybridComposition: true,
    ),
    ios: IOSInAppWebViewOptions(
      allowsInlineMediaPlayback: true,
    ),
  );

  late PullToRefreshController pullToRefreshController;
  String url = "";
  double progress = 0;
  final urlController = TextEditingController();

  @override
  void initState() {
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp
    ]);
    super.initState();

    pullToRefreshController = PullToRefreshController(
      options: PullToRefreshOptions(
        color: Colors.blue,
      ),
      onRefresh: () async {
        if (Platform.isAndroid) {
          webViewController?.reload();
        } else if (Platform.isIOS) {
          webViewController?.loadUrl(
              urlRequest: URLRequest(url: await webViewController?.getUrl()));
        }
      },
    );
  }

  @override
  void dispose() async {
    super.dispose();
    // await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  Widget build(BuildContext context) {
    InAppWebView webView = InAppWebView(
      initialUrlRequest: URLRequest(url: Uri.parse(widget.videoUrl)),
      initialOptions: options,
      pullToRefreshController: pullToRefreshController,
      onLoadStart: (controller, url) async {
        setState(() {
          this.url = url.toString();
          urlController.text = this.url;
        });
      },
      androidOnPermissionRequest: (controller, origin, resources) async {
        return PermissionRequestResponse(
            resources: resources,
            action: PermissionRequestResponseAction.GRANT);
      },
      shouldOverrideUrlLoading: (controller, navigationAction) async {
        return NavigationActionPolicy.CANCEL;
      },
      onLoadStop: (controller, url) async {
        pullToRefreshController.endRefreshing();
        setState(() {
          this.url = url.toString();
          urlController.text = this.url;
        });
      },
      onLoadError: (controller, url, code, message) {
        pullToRefreshController.endRefreshing();
      },
      onProgressChanged: (controller, progress) {
        if (progress == 100) {
          pullToRefreshController.endRefreshing();
        }
        setState(() {
          this.progress = progress / 100;
          urlController.text = url;
        });
      },
      onUpdateVisitedHistory: (controller, url, androidIsReload) {
        setState(() {
          this.url = url.toString();
          urlController.text = this.url;
        });
      },
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // backgroundColor: Colors.black,
        body: SafeArea(
          child: Center(
            child: Container(
              height: double.infinity,
              // padding: const EdgeInsets.all(15),
              child: webView,
            ),
          ),
        ),
      ),
    );
  }
}
