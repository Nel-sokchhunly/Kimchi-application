import 'package:flutter/material.dart';
import 'package:flutterapp/components/drama_detail/drama_episodes.dart';
import 'package:flutterapp/components/drama_detail/drama_detail_bottom_bar.dart';

// component
import '../components/drama_detail/custom_sliver_appbar.dart';
import '../components/drama_detail/drama_info.dart';

class DramaDetail extends StatefulWidget {
  const DramaDetail({Key? key, required this.dramaObject}) : super(key: key);

  final Map<String, dynamic> dramaObject;

  @override
  _DramaDetailState createState() => _DramaDetailState();
}

class _DramaDetailState extends State<DramaDetail> {
  String currentPage = 'info-page';

  void navigateTo(String pageName) {
    setState(() {
      currentPage = pageName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomDramaBottomBar(
        currentPage: currentPage,
        navigateTo: navigateTo,
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            CustomSliverAppBar(dramaObject: widget.dramaObject),
            SliverToBoxAdapter(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                switchInCurve: Curves.easeInToLinear,
                switchOutCurve: Curves.easeInToLinear,
                child: (currentPage == 'info-page')
                    ? DramaInfoPage(
                  key: const Key('info-page'),
                  dramaObject: widget.dramaObject,
                )
                    : DramaEpisodePage(
                  key: const Key('episode-page'),
                  dramaObject: widget.dramaObject,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
