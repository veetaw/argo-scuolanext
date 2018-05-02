import 'dart:math';

import 'package:flutter/material.dart';

import '../locale/locales.dart';
import '../util/shared_preferences.dart';
import 'login.dart';

PageController controller = new PageController();

class Intro extends StatelessWidget {
  final double _kImageSize = 200.0;
  final double _kTitleSize = 22.0;
  final double _kSubTitleSize = 20.0;

  static String get routeName => "intro";

  void _changePrefs() {
    SharedPreferences sharedPreferences = SharedPreferences.instance;
    sharedPreferences.changeFirstTime();
  }

  Widget _buildPage({String title, String subTitle, String imageAssetName}) {
    return new Padding(
      padding: const EdgeInsets.only(bottom: 80.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          new Expanded(
            child: new Image(
              image: new AssetImage(imageAssetName),
              width: _kImageSize,
              height: _kImageSize,
            ),
          ),
          new Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
            child: new Text(
              title,
              maxLines: 2,
              style: new TextStyle(
                fontSize: _kTitleSize,
                fontWeight: FontWeight.w500,
                letterSpacing: -.3,
              ),
            ),
          ),
          new Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 64.0),
            child: new Text(
              subTitle,
              maxLines: 5,
              textAlign: TextAlign.center,
              style: new TextStyle(
                fontSize: _kSubTitleSize,
                fontWeight: FontWeight.w300,
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Stack(
        children: <Widget>[
          new PageView(
            controller: controller,
            physics: AlwaysScrollableScrollPhysics(),
            children: <Widget>[
              _buildPage(
                title: RELocalizations.of(context).introTitleFirst,
                subTitle: RELocalizations.of(context).introSubTitleFirst,
                imageAssetName: "assets/icons/icon_bw.png",
              ),
              _buildPage(
                title: RELocalizations.of(context).introTitleSecond,
                subTitle: RELocalizations.of(context).introSubTitleSecond,
                imageAssetName: "assets/icons/icon_bw.png", // todo temporary
              ),
            ],
          ),
          new Positioned(
            bottom: 16.0,
            left: 16.0,
            right: 16.0,
            child: new Column(
              children: <Widget>[
                new Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new MaterialButton(
                    height: 50.0,
                    child: new Text(
                      RELocalizations.of(context).introButtonText.toUpperCase(),
                      style: const TextStyle(fontSize: 18.0),
                    ),
                    onPressed: () {
                      _changePrefs();
                      Navigator
                          .of(context)
                          .pushReplacementNamed(Login.routeName);
                    },
                  ),
                ),
                new Dots(
                  pageCount: 2,
                  color: Colors.grey.shade500,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Dots extends AnimatedWidget {
  Dots({this.pageCount, this.color})
      : assert(pageCount != null),
        assert(Color != null),
        super(listenable: controller);

  final int pageCount;
  final Color color;

  static const double _kDotSize = 4.0;
  static const double _kSpacing = 16.0;
  static const double _kDotZoom = 4.0;

  Widget _buildDot(int index) {
    double anim = Curves.ease.transform(
      max(
        0.0,
        1.0 - ((controller.page ?? controller.initialPage) - index).abs(),
      ),
    );
    return new Container(
      width: _kSpacing,
      child: new Material(
        type: MaterialType.circle,
        color: color,
        child: new Container(
          height: _kDotSize + _kDotZoom * anim,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: new List<Widget>.generate(pageCount, _buildDot),
    );
  }
}
