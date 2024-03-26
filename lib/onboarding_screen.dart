import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class IntroScreen extends StatelessWidget {
  final String? title;
  final String? description;
  final String? imageAsset;
  final TextStyle? textStyle;
  final Color headerBgColor;
  final EdgeInsets headerPadding;
  final Widget? header;

  int? _pageIndex;

  IntroScreen({
    required this.title,
    this.headerPadding = const EdgeInsets.all(12),
    required this.description,
    this.header,
    this.headerBgColor = Colors.white,
    this.textStyle,
    this.imageAsset,
  });

  set index(val) => this._pageIndex = val;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: screenSize.height,
      // Add decoration to change background color
      decoration: BoxDecoration(
        color: Colors.white, // Set background color here
      ),
      child: Column(
        children: <Widget>[
          Container(
            height: screenSize.height * .8,
            padding: headerPadding,
            decoration: BoxDecoration(
              color: headerBgColor,
            ),
            child: Center(
              child: imageAsset != null
                  ? Animate(
                      child: Image.asset(
                        imageAsset!,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: screenSize.height * .5,
                      ),
                    ).slide(
                      begin: Offset(1, 0),
                      duration: Duration(milliseconds: 500))
                  : this.header ??
                      Container(
                        child: Animate(
                          child: Text(
                            "${this._pageIndex ?? 1}",
                            style: TextStyle(
                              fontSize: 300,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ).fadeIn(duration: Duration(seconds: 1)),
                      ),
            ),
          ),
        ],
      ),
    );
  }
}
