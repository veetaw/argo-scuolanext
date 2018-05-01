import 'dart:math';

import 'package:flutter/material.dart';

import '../locale/locales.dart';

PageController controller = new PageController();

class Intro extends StatelessWidget {
  final double _kImageSize = 150.0;
  final double _kTitleSize = 22.0;
  final double _kSubTitleSize = 20.0;
  Widget _buildPage({String title, String subTitle, String imageAssetName}) {
    return new Column(
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
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
          child: new Text(
            title,
            maxLines: 2,
            textAlign: TextAlign.left,
            style: new TextStyle(
              fontSize: _kTitleSize,
              fontWeight: FontWeight.w500,
              letterSpacing: -.3,
            ),
          ),
        ),
        new Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 64.0),
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
    );
  }

  // todo
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Stack(
      children: <Widget>[
        new PageView(
          children: <Widget>[
            // _buildPage(title: ),
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
                  child: new Text(
                    RELocalizations.of(context).introButtonText,
                    style: const TextStyle(fontSize: 16.0),
                  ),
                  onPressed: () {},
                ),
              ),
              new Dots(
                pageCount: 3,
                color: Colors.grey.shade500,
              )
            ],
          ),
        )
      ],
    ));
  }
}

class Dots extends AnimatedWidget {
  Dots({this.pageCount, this.color})
      : assert(pageCount != null),
        assert(Color != null);

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
          child: new InkWell(
            onTap: () => controller.animateToPage(index + 1,
                duration: new Duration(milliseconds: 300),
                curve: Curves.easeOut),
          ),
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
