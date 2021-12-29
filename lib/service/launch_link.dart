import 'package:url_launcher/url_launcher.dart';

mixin LaunchWebView {
  void launchURL(url) async => await canLaunch(url)
      ? await launch(url, forceSafariVC: false)
      : throw 'Could not launch $url';
}