/*
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:wanderconsumer_android_flutter/core/constant/app_theme.dart';
import 'package:wanderconsumer_android_flutter/core/constant/colors_constants.dart';
import 'package:wanderconsumer_android_flutter/core/constant/font_constants.dart';

class ExpandableHtmlWidget extends StatefulWidget {
  final String htmlContent;
  final double collapsedHeight;
  final TextStyle textStyle;

  const ExpandableHtmlWidget({
    super.key,
    required this.htmlContent,
    this.collapsedHeight = 100.0, // Height for collapsed state
    this.textStyle = const TextStyle(fontSize: 14),
  });

  @override
  State<ExpandableHtmlWidget> createState() => _ExpandableHtmlWidgetState();
}

class _ExpandableHtmlWidgetState extends State<ExpandableHtmlWidget> {
  bool _isExpanded = false;
  bool _isOverflowing = false;
  final GlobalKey _htmlKey = GlobalKey();
  double _htmlHeight = 0;

  @override
  void initState() {
    super.initState();
    print("call again");
    Future.delayed(const Duration(milliseconds: 500), () {
      WidgetsBinding.instance.addPostFrameCallback(_afterLayout);
    });
  }

  void _afterLayout(_) {
    final RenderBox renderBox = _htmlKey.currentContext!.findRenderObject() as RenderBox;
    setState(() {
      _htmlHeight = renderBox.size.height;
      _isOverflowing = _htmlHeight > widget.collapsedHeight;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: _isExpanded ? _htmlHeight : widget.collapsedHeight,
          // !_isOverflowing
          //     ? null
          //     : _isExpanded
          //     ? _htmlHeight
          //     : widget.collapsedHeight,
          child: SingleChildScrollView(
            physics: _isExpanded ? const NeverScrollableScrollPhysics() : const ClampingScrollPhysics(),
            child: HtmlWidget(
              widget.htmlContent,
              key: _htmlKey,
              textStyle: widget.textStyle,
              renderMode: RenderMode.column,
            ),
          ),
        ),
        if (_isOverflowing)
          const SizedBox(
            height: 10,
          ),
        GestureDetector(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: Center(
            child: Text(
              _isExpanded ? "Read Less" : "Read More",
              style: Theme.of(context).grayCliff700.copyWith(fontSize: MyFonts.fonts16, color: MyColors.secondaryColor),
            ),
          ),
        ),
      ],
    );
  }
}
*/

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:multiple_image_and_videos_as_social_media/core/constant/colors_constants.dart';

class ExpandableHtmlWidget extends StatefulWidget {
  final String htmlContent;
  final TextStyle textStyle;
  final int maxLines;

  const ExpandableHtmlWidget({
    super.key,
    required this.htmlContent,
    this.textStyle = const TextStyle(fontSize: 14),
    this.maxLines = 3, // Number of visible lines in collapsed state
  });

  @override
  State<ExpandableHtmlWidget> createState() => _ExpandableHtmlWidgetState();
}

class _ExpandableHtmlWidgetState extends State<ExpandableHtmlWidget> {
  bool isExpanded = false;

  late String firstPart;
  late String secondPart;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _splitHtmlContent();
  }

  String _parseHtmlString(String htmlString) {
    var document = parse(htmlString);
    String parsedString = parse(document.body!.text).documentElement!.text;
    return parsedString;
  }

  void _splitHtmlContent() {
    const padding = 16.0;
    final double availableWidth = MediaQuery.of(context).size.width - (padding * 2);

    final cleanContent = _parseHtmlString(widget.htmlContent);

    final textSpan = TextSpan(
      text: cleanContent,
      style: widget.textStyle,
    );

    final textPainter = TextPainter(
      text: textSpan,
      maxLines: widget.maxLines,
      textDirection: TextDirection.ltr,
    )..layout(maxWidth: availableWidth);

    if (textPainter.didExceedMaxLines) {
      int endIndex = textPainter
          .getPositionForOffset(
        Offset(textPainter.size.width, textPainter.size.height),
      )
          .offset;

      firstPart = cleanContent.substring(0, endIndex);
      secondPart = cleanContent.substring(endIndex);
      setState(() {});
    } else {
      firstPart = cleanContent;
      secondPart = '';
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.justify,
      text: TextSpan(
        style: widget.textStyle,
        children: [
          TextSpan(
            text: isExpanded ? (firstPart + secondPart) : firstPart,
          ),
          if (secondPart.isNotEmpty)
            TextSpan(
              text: isExpanded ? ' Read less' : 'Read more',
              style: TextStyle(color: MyColors.greenBorderColor),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
            ),
        ],
      ),
    );
  }
}
